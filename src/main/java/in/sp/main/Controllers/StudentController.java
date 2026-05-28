package in.sp.main.Controllers;

import java.io.File;
import java.nio.file.Files;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import in.sp.main.Entities.Application;
import in.sp.main.Entities.Drive;
import in.sp.main.Entities.Student;
import in.sp.main.Repositories.ApplicationRepository;
import in.sp.main.Repositories.DriveRepository;
import in.sp.main.Repositories.StudentRepository;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/student")
public class StudentController {

    @Autowired
    private StudentRepository studentRepository;

    @Autowired
    private DriveRepository driveRepository;

    @Autowired
    private ApplicationRepository applicationRepository;

   
    
    @GetMapping("/set-password")
    public String setPasswordPage(@RequestParam String token, Model model) {
        model.addAttribute("token", token);
        return "student/set-password";
    }

    @PostMapping("/set-password")
    public String savePassword(
            @RequestParam String token,
            @RequestParam String password
    ) {

        Student s = studentRepository.findByResetToken(token);

        if (s != null) {
            s.setPassword(password);
            s.setResetToken(null);
            studentRepository.save(s);
        }

        return "redirect:/student/login";
    }
    
    // ---------------- LOGIN ----------------

    @GetMapping("/login")
    public String loginPage() {
        return "student/login";
    }

    @PostMapping("/login")
    public String login(
            @RequestParam String email,
            @RequestParam String password,
            HttpSession session,
            Model model
    ) {

        Student student = studentRepository
                .findByEmailAndPassword(email, password);

        // 🔴 invalid login
        if (student == null) {

            model.addAttribute("error", "Invalid email or password");

            return "student/login";
        }

        // 🔥 today's date
        LocalDate today = LocalDate.now();

        // 🔴 subscription expired
        if (student.getCollege()
                .getSubscriptionEnd()
                .isBefore(today)) {

            model.addAttribute(
                    "error",
                    "Placement portal access has expired. Please contact your TPO for further assistance."
            );

            return "student/login";
        }

        // ✅ success login
        session.setAttribute("student", student);

        return "redirect:/student/dashboard";
    }

    // ---------------- DASHBOARD ----------------

    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model) {

        Student student = (Student) session.getAttribute("student");

        if (student == null) {
            return "redirect:/student/login";
        }

        // 🔥 subscription check FIRST
        LocalDate today = LocalDate.now();

        if (student.getCollege().getSubscriptionEnd().isBefore(today)) {
            session.invalidate(); // optional but better
            model.addAttribute("error", "Access expired");
            return "student/login";
        }

        // 🔥 normal flow
        List<Drive> drives = driveRepository
                .findByCollegeId(student.getCollege().getId());

        List<Application> apps =
                applicationRepository.findByStudentId(student.getId());

        Map<Long, String> applicationStatusMap = new HashMap<>();

        for (Application a : apps) {
            applicationStatusMap.put(a.getDrive().getId(), a.getStatus());
        }

        long totalDrives = drives.size();
        long appliedCount = apps.size();

        model.addAttribute("drives", drives);
        model.addAttribute("applicationStatusMap", applicationStatusMap);
        model.addAttribute("totalDrives", totalDrives);
        model.addAttribute("appliedCount", appliedCount);

        return "student/dashboard";
    }

    // ---------------- APPLY ----------------

    @GetMapping("/apply/{driveId}")
    public String apply(
            @PathVariable Long driveId,
            HttpSession session
    ) {

        Student student = (Student) session.getAttribute("student");

        if (student == null) {
            return "redirect:/student/login";
        }

        boolean alreadyApplied = applicationRepository
                .existsByStudentIdAndDriveId(student.getId(), driveId);

        if (alreadyApplied) {
            return "redirect:/student/dashboard";
        }

        Drive drive = driveRepository.findById(driveId).orElse(null);

        Application app = new Application();
        app.setStudent(student);
        app.setDrive(drive);
        app.setStatus("APPLIED");

        applicationRepository.save(app);
        if ("ENDED".equals(drive.getStatus())) {
            return "redirect:/student/dashboard";
        }
        return "redirect:/student/dashboard";
    }
    
    @PostMapping("/upload-resume")
    public String uploadResume(
            @RequestParam("file") MultipartFile file,
            HttpSession session
    ) throws Exception {

        Student student = (Student) session.getAttribute("student");

        if (student == null) {
            return "redirect:/student/login";
        }

        String uploadDir = System.getProperty("user.dir") + "/uploads/";

        File dir = new File(uploadDir);

        // 🔥 create folder if not exists
        if (!dir.exists()) {
            dir.mkdirs();
        }

        String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();

        File dest = new File(uploadDir + fileName);

        file.transferTo(dest);

        // save only filename
        student.setResumePath(fileName);
        studentRepository.save(student);
        
        return "redirect:/student/dashboard";
    }
    
    @GetMapping("/view-resume/{id}")
    public void viewResume(
            @PathVariable Long id,
            HttpServletResponse response
    ) throws Exception {

        Student student = studentRepository.findById(id).orElse(null);

        if (student == null || student.getResumePath() == null) return;

        String filePath = System.getProperty("user.dir") + "/uploads/" + student.getResumePath();

        File file = new File(filePath);

        response.setContentType("application/pdf");

        // 🔥 IMPORTANT → inline instead of attachment
        response.setHeader("Content-Disposition", "inline; filename=" + file.getName());

        Files.copy(file.toPath(), response.getOutputStream());
    }
    
    @GetMapping("/delete-resume")
    public String deleteResume(HttpSession session) {

        Student student = (Student) session.getAttribute("student");

        if (student == null) {
            return "redirect:/student/login";
        }

        try {
            String filePath = System.getProperty("user.dir") + "/uploads/" + student.getResumePath();

            File file = new File(filePath);

            if (file.exists()) {
                file.delete();
            }

            student.setResumePath(null);
            studentRepository.save(student);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "redirect:/student/dashboard";
    }
    
    @GetMapping("/drive-details/{id}")
    public String driveDetails(
            @PathVariable Long id,
            Model model) {

        Drive drive = driveRepository.findById(id).orElse(null);

        model.addAttribute("drive", drive);

        return "student/drive-details";
    }
}