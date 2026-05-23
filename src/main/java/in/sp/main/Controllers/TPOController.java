package in.sp.main.Controllers;



import java.io.File;
import java.nio.file.Files;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
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
import in.sp.main.Entities.TPO;
import in.sp.main.Repositories.ApplicationRepository;
import in.sp.main.Repositories.DriveRepository;
import in.sp.main.Repositories.StudentRepository;
import in.sp.main.Repositories.TPORepository;
import in.sp.main.Services.EmailService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/tpo")
public class TPOController {

    @Autowired
    private TPORepository tpoRepository;
    @Autowired
    private DriveRepository driveRepository;
    @Autowired
    private StudentRepository studentRepository;  
    @Autowired
    private ApplicationRepository applicationRepository;
    
    @Autowired
    private EmailService emailService;
    
    @GetMapping("/login")
    public String loginPage() {
        return "tpo/login";
    }

    @PostMapping("/login")
    public String login(
            @RequestParam String email,
            @RequestParam String password,
            HttpSession session,
            Model model
    ) {

        TPO tpo = tpoRepository.findByEmailAndPassword(email, password);

        if (tpo == null) {

            model.addAttribute("error", "Invalid email or password");

            return "tpo/login";
        }

        LocalDate today = LocalDate.now();

        if (tpo.getCollege().getSubscriptionEnd().isBefore(today)) {

            model.addAttribute(
                    "error",
                    "Your college subscription has expired. Please contact the platform administrator to renew access."
            );

            return "tpo/login";
        }

        session.setAttribute("tpo", tpo);

        return "redirect:/tpo/dashboard";
    }

    @GetMapping("/dashboard")
    public String tpoDashboard(HttpSession session, Model model) {

        TPO tpo = (TPO) session.getAttribute("tpo");

        if (tpo == null) {
            return "redirect:/tpo/login";
        }

        Long collegeId = tpo.getCollege().getId();

        long totalDrives = driveRepository.countByCollegeId(collegeId);
        long totalStudents = studentRepository.countByCollegeId(collegeId);
        long totalApplications = applicationRepository.count();

        model.addAttribute("totalDrives", totalDrives);
        model.addAttribute("totalStudents", totalStudents);
        model.addAttribute("totalApplications", totalApplications);

        return "tpo/dashboard";
    }
    @GetMapping("/set-password")
    public String setPasswordPage(@RequestParam String token, Model model) {
        model.addAttribute("token", token);
        return "tpo/set-password";
    }

    @PostMapping("/set-password")
    public String savePassword(
            @RequestParam String token,
            @RequestParam String password
    ) {

        TPO tpo = tpoRepository.findByResetToken(token);

        if (tpo != null) {
            tpo.setPassword(password);
            tpo.setResetToken(null); // invalidate token
            tpoRepository.save(tpo);
        }

        return "redirect:/tpo/login";
    }
    @GetMapping("/add-drive")
    public String addDrivePage(HttpSession session) {

        if (session.getAttribute("tpo") == null) {
            return "redirect:/tpo/login";
        }

        return "tpo/add-drive";
    }
    @PostMapping("/save-drive")
    public String saveDrive(
            @RequestParam String companyName,
            @RequestParam String role,
            @RequestParam double salary,
            @RequestParam String aboutCompany,
            @RequestParam String rounds,
            @RequestParam(required = false) boolean bondApplicable,
            @RequestParam String skills,
            @RequestParam double tenthCriteria,
            @RequestParam double twelfthCriteria,
            @RequestParam double degreeCriteria,
            @RequestParam String driveDate,
            HttpSession session
    ) {

        TPO tpo = (TPO) session.getAttribute("tpo");

        Drive drive = new Drive();

        drive.setCompanyName(companyName);
        drive.setRole(role);
        drive.setSalary(salary);
        drive.setAboutCompany(aboutCompany);
        drive.setRounds(rounds);
        drive.setBondApplicable(bondApplicable);
        drive.setSkills(skills);
        drive.setTenthCriteria(tenthCriteria);
        drive.setTwelfthCriteria(twelfthCriteria);
        drive.setDegreeCriteria(degreeCriteria);
        drive.setDriveDate(LocalDate.parse(driveDate));
        drive.setStatus("ONGOING");
        drive.setCollege(tpo.getCollege());

        driveRepository.save(drive);

        return "redirect:/tpo/drives";
    }
    @GetMapping("/drives")
    public String drives(
            @RequestParam(defaultValue = "0") int page,

            @RequestParam(required = false)
            String startDate,

            @RequestParam(required = false)
            String endDate,

            HttpSession session,
            Model model
    ) {

        TPO tpo = (TPO) session.getAttribute("tpo");

        if (tpo == null) {
            return "redirect:/tpo/login";
        }

        Pageable pageable = PageRequest.of(page, 5);

        Page<Drive> drivePage;

        // 🔥 DATE FILTER
        if (startDate != null &&
            endDate != null &&
            !startDate.isEmpty() &&
            !endDate.isEmpty()) {

            drivePage =
                    driveRepository
                    .findByCollegeIdAndDriveDateBetween(

                            tpo.getCollege().getId(),

                            LocalDate.parse(startDate),

                            LocalDate.parse(endDate),

                            pageable
                    );

        } else {

            drivePage =
                    driveRepository.findByCollegeId(
                            tpo.getCollege().getId(),
                            pageable
                    );
        }

        model.addAttribute(
                "drives",
                drivePage.getContent()
        );

        model.addAttribute(
                "currentPage",
                page
        );

        model.addAttribute(
                "totalPages",
                drivePage.getTotalPages()
        );

        // 🔥 PRESERVE FILTER VALUES
        model.addAttribute("startDate", startDate);
        model.addAttribute("totalDrives", driveRepository.countByCollegeId(tpo.getCollege().getId()));
        model.addAttribute("endDate", endDate);

        return "tpo/drives";
    }
    @GetMapping("/add-student")
    public String addStudentPage(HttpSession session) {

        if (session.getAttribute("tpo") == null) {
            return "redirect:/tpo/login";
        }

        return "tpo/add-student";
    }
    @PostMapping("/save-student")
    public String saveStudent(
            @RequestParam String name,
            @RequestParam String usn,
            @RequestParam String email,
            @RequestParam String phone,
            @RequestParam String branch,
            @RequestParam double tenth,
            @RequestParam double twelfth,
            @RequestParam double degree,
            HttpServletRequest request,
            Model model,
            HttpSession session
    ) {

        TPO tpo = (TPO) session.getAttribute("tpo");

        String token = UUID.randomUUID().toString();

        Student s = new Student();
        s.setName(name);
        s.setUsn(usn);
        s.setEmail(email);
        s.setPhone(phone);
        s.setBranch(branch);
        s.setTenthPercentage(tenth);
        s.setTwelfthPercentage(twelfth);
        s.setDegreePercentage(degree);
        s.setCollege(tpo.getCollege());
        s.setResetToken(token);

        studentRepository.save(s);

        // 🔥 dynamic link
        String baseUrl = request.getScheme() + "://" +
                request.getServerName() +
                (request.getServerPort() == 80 || request.getServerPort() == 443 ? "" : ":" + request.getServerPort());

        String link = baseUrl + request.getContextPath()
                + "/student/set-password?token=" + token;

        emailService.sendPasswordSetupEmail(
                s.getEmail(),
                link
        );

        model.addAttribute(
                "success",
                "Student added successfully. Email sent."
        );

        return "redirect:/tpo/dashboard";
    }
    
    @GetMapping("/applicants/{driveId}")
    public String viewApplicants(
            @PathVariable Long driveId,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(required = false) String status,
            HttpSession session,
            Model model
    ) {

        TPO tpo = (TPO) session.getAttribute("tpo");

        if (tpo == null) {
            return "redirect:/tpo/login";
        }

        Drive drive = driveRepository
                .findById(driveId)
                .orElse(null);

        if (drive == null ||
            !drive.getCollege()
                  .getId()
                  .equals(tpo.getCollege().getId())) {

            return "redirect:/tpo/dashboard";
        }

        Pageable pageable = PageRequest.of(page, 10);

        Page<Application> appPage;

        // 🔥 FILTER LOGIC
        if (status != null && !status.isEmpty()) {

            appPage =
                    applicationRepository
                    .findByDriveIdAndStatus(
                            driveId,
                            status,
                            pageable
                    );

        } else {

            appPage =
                    applicationRepository
                    .findByDriveId(
                            driveId,
                            pageable
                    );
        }

        model.addAttribute(
                "applications",
                appPage.getContent()
        );

        model.addAttribute(
                "currentPage",
                page
        );

        model.addAttribute(
                "totalPages",
                appPage.getTotalPages()
        );

        model.addAttribute(
                "driveId",
                driveId
        );

        model.addAttribute(
                "selectedStatus",
                status
        );
        model.addAttribute("totalApplicants", applicationRepository.countByDriveId(driveId));
        return "tpo/applicants";
    }
    @GetMapping("/select/{appId}")
    public String selectStudent(
            @PathVariable Long appId,
            HttpSession session
    ) {

        TPO tpo = (TPO) session.getAttribute("tpo");

        if (tpo == null) {
            return "redirect:/tpo/login";
        }

        Application app = applicationRepository.findById(appId).orElse(null);

        if (app == null) {
            return "redirect:/tpo/dashboard";
        }

        // 🔥 SECURITY CHECK
        if (!app.getDrive().getCollege().getId()
                .equals(tpo.getCollege().getId())) {
            return "redirect:/tpo/dashboard";
        }

        // 🔥 UPDATE STATUS
        app.setStatus("SELECTED");
        applicationRepository.save(app);

        return "redirect:/tpo/applicants/" + app.getDrive().getId();
    }
    @GetMapping("/export/applicants/{driveId}")
    public void exportApplicants(
            @PathVariable Long driveId,
            HttpServletResponse response,
            HttpSession session
    ) throws Exception {

        TPO tpo = (TPO) session.getAttribute("tpo");

        if (tpo == null) return;

        List<Application> apps =
                applicationRepository.findByDriveId(driveId);

        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("Applicants");

        Row header = sheet.createRow(0);
        header.createCell(0).setCellValue("Name");
        header.createCell(1).setCellValue("Email");
        header.createCell(2).setCellValue("Phone");
        header.createCell(3).setCellValue("Branch");
        header.createCell(4).setCellValue("10th %");
        header.createCell(5).setCellValue("12th %");
        header.createCell(6).setCellValue("Degree %");
        header.createCell(7).setCellValue("Status");

        int rowNum = 1;

        for (Application app : apps) {

            Student s = app.getStudent();

            Row row = sheet.createRow(rowNum++);

            row.createCell(0).setCellValue(s.getName());
            row.createCell(1).setCellValue(s.getEmail());
            row.createCell(2).setCellValue(s.getPhone());
            row.createCell(3).setCellValue(s.getBranch());
            row.createCell(4).setCellValue(s.getTenthPercentage());
            row.createCell(5).setCellValue(s.getTwelfthPercentage());
            row.createCell(6).setCellValue(s.getDegreePercentage());
            row.createCell(7).setCellValue(app.getStatus());
        }

        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setHeader("Content-Disposition", "attachment; filename=applicants.xlsx");

        workbook.write(response.getOutputStream());
        workbook.close();
    }
    
    @GetMapping("/export/selected/{driveId}")
    public void exportSelected(
            @PathVariable Long driveId,
            HttpServletResponse response,
            HttpSession session
    ) throws Exception {

        TPO tpo = (TPO) session.getAttribute("tpo");

        if (tpo == null) return;

        List<Application> apps =
                applicationRepository.findByDriveIdAndStatus(
                        driveId, "SELECTED");

        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("Selected Students");

        // 🔥 FULL HEADER
        Row header = sheet.createRow(0);
        header.createCell(0).setCellValue("Name");
        header.createCell(1).setCellValue("Email");
        header.createCell(2).setCellValue("Phone");
        header.createCell(3).setCellValue("Branch");
        header.createCell(4).setCellValue("10th %");
        header.createCell(5).setCellValue("12th %");
        header.createCell(6).setCellValue("Degree %");
        header.createCell(7).setCellValue("Status");

        int rowNum = 1;

        for (Application app : apps) {

            Student s = app.getStudent();

            Row row = sheet.createRow(rowNum++);

            row.createCell(0).setCellValue(s.getName());
            row.createCell(1).setCellValue(s.getEmail());
            row.createCell(2).setCellValue(s.getPhone());
            row.createCell(3).setCellValue(s.getBranch());
            row.createCell(4).setCellValue(s.getTenthPercentage());
            row.createCell(5).setCellValue(s.getTwelfthPercentage());
            row.createCell(6).setCellValue(s.getDegreePercentage());
            row.createCell(7).setCellValue(app.getStatus());
        }

        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setHeader("Content-Disposition", "attachment; filename=selected_students.xlsx");

        workbook.write(response.getOutputStream());
        workbook.close();
    }
    
    @GetMapping("/end-drive/{id}")
    public String endDrive(
            @PathVariable Long id,
            HttpSession session
    ) {

        TPO tpo = (TPO) session.getAttribute("tpo");

        if (tpo == null) {
            return "redirect:/tpo/login";
        }

        Drive drive = driveRepository.findById(id).orElse(null);

        if (drive == null) {
            return "redirect:/tpo/dashboard";
        }

        // 🔒 Security check
        if (!drive.getCollege().getId().equals(tpo.getCollege().getId())) {
            return "redirect:/tpo/dashboard";
        }

        drive.setStatus("ENDED");
        driveRepository.save(drive);

        return "redirect:/tpo/drives";
    }
    @GetMapping("/export/drives")
    public void exportDrives(
            @RequestParam int year,
            HttpSession session,
            HttpServletResponse response
    ) throws Exception {

        TPO tpo = (TPO) session.getAttribute("tpo");

        if (tpo == null) return;

        LocalDate start = LocalDate.of(year, 1, 1);
        LocalDate end = LocalDate.of(year, 12, 31);

        List<Drive> drives = driveRepository
                .findByCollegeIdAndDriveDateBetween(
                        tpo.getCollege().getId(),
                        start,
                        end
                );

        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("Drives");

        Row header = sheet.createRow(0);
        header.createCell(0).setCellValue("Company");
        header.createCell(1).setCellValue("Role");
        header.createCell(2).setCellValue("Salary");
        header.createCell(3).setCellValue("Date");
        header.createCell(4).setCellValue("Status");

        int rowNum = 1;

        for (Drive d : drives) {

            Row row = sheet.createRow(rowNum++);

            row.createCell(0).setCellValue(d.getCompanyName());
            row.createCell(1).setCellValue(d.getRole());
            row.createCell(2).setCellValue(d.getSalary());
            row.createCell(3).setCellValue(d.getDriveDate().toString());
            row.createCell(4).setCellValue(d.getStatus());
        }

        // auto size
        for (int i = 0; i < 5; i++) {
            sheet.autoSizeColumn(i);
        }

        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setHeader("Content-Disposition", "attachment; filename=drives_" + year + ".xlsx");

        workbook.write(response.getOutputStream());
        workbook.close();
    }
    @GetMapping("/download-template")
    public void downloadTemplate(HttpServletResponse response) throws Exception {

        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("Students Template");

        Row header = sheet.createRow(0);

        header.createCell(0).setCellValue("Name");
        header.createCell(1).setCellValue("USN");
        header.createCell(2).setCellValue("Email");
        header.createCell(3).setCellValue("Phone");
        header.createCell(4).setCellValue("Branch");
        header.createCell(5).setCellValue("10th");
        header.createCell(6).setCellValue("12th");
        header.createCell(7).setCellValue("Degree");

        for (int i = 0; i < 8; i++) {
            sheet.autoSizeColumn(i);
        }

        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setHeader("Content-Disposition", "attachment; filename=student_template.xlsx");

        workbook.write(response.getOutputStream());
        workbook.close();
    }
    @GetMapping("/upload-students")
    public String uploadStudentsPage(HttpSession session) {

        if (session.getAttribute("tpo") == null) {
            return "redirect:/tpo/login";
        }

        return "tpo/upload-students";
    }
    
    
    @PostMapping("/upload-students")
    public String uploadStudents(
            @RequestParam("file") MultipartFile file,
            HttpSession session,
            Model model,
            HttpServletRequest request
    ) throws Exception {

        TPO tpo = (TPO) session.getAttribute("tpo");

        if (tpo == null) {
            return "redirect:/tpo/login";
        }

        List<String> errors = new ArrayList<>();
        int successCount = 0;

        Workbook workbook = new XSSFWorkbook(file.getInputStream());

        Sheet sheet = workbook.getSheetAt(0);

        DataFormatter formatter = new DataFormatter();

        for (int i = 1; i <= sheet.getLastRowNum(); i++) {

            Row row = sheet.getRow(i);

            if (row == null) {
                continue;
            }

            try {

                String name =
                        formatter.formatCellValue(row.getCell(0)).trim();

                String usn =
                        formatter.formatCellValue(row.getCell(1)).trim();

                String email =
                        formatter.formatCellValue(row.getCell(2)).trim();

                String phone =
                        formatter.formatCellValue(row.getCell(3)).trim();

                String branch =
                        formatter.formatCellValue(row.getCell(4)).trim();

                String tenthStr =
                        formatter.formatCellValue(row.getCell(5)).trim();

                String twelfthStr =
                        formatter.formatCellValue(row.getCell(6)).trim();

                String degreeStr =
                        formatter.formatCellValue(row.getCell(7)).trim();

                // 🔥 validation
                if (name.isEmpty() || email.isEmpty()) {

                    errors.add(
                            "Row " + (i + 1)
                            + ": Name or Email missing"
                    );

                    continue;
                }

                if (!email.contains("@")) {

                    errors.add(
                            "Row " + (i + 1)
                            + ": Invalid email"
                    );

                    continue;
                }

                // 🔥 prevent duplicate email
                Student existingStudent =
                        studentRepository.findByEmail(email);

                if (existingStudent != null) {

                    errors.add(
                            "Row " + (i + 1)
                            + ": Email already exists"
                    );

                    continue;
                }

                // 🔥 safe parsing
                double tenth =
                        tenthStr.isEmpty()
                                ? 0
                                : Double.parseDouble(tenthStr);

                double twelfth =
                        twelfthStr.isEmpty()
                                ? 0
                                : Double.parseDouble(twelfthStr);

                double degree =
                        degreeStr.isEmpty()
                                ? 0
                                : Double.parseDouble(degreeStr);

                // 🔥 create student
                Student s = new Student();

                s.setName(name);
                s.setUsn(usn);
                s.setEmail(email);
                s.setPhone(phone);
                s.setBranch(branch);

                s.setTenthPercentage(tenth);
                s.setTwelfthPercentage(twelfth);
                s.setDegreePercentage(degree);

                s.setCollege(tpo.getCollege());

                // 🔥 token generation
                String token = UUID.randomUUID().toString();

                s.setResetToken(token);

                // 🔥 save student
                studentRepository.saveAndFlush(s);

                System.out.println("Student saved: " + s.getEmail());

                // 🔥 dynamic base url
                String baseUrl =
                        request.getScheme()
                        + "://"
                        + request.getServerName()
                        + ":"
                        + request.getServerPort();

                // 🔥 password setup link
                String link =
                        baseUrl
                        + request.getContextPath()
                        + "/student/set-password?token="
                        + token;

                System.out.println("Sending email to: " + s.getEmail());

                emailService.sendPasswordSetupEmail(
                        s.getEmail(),
                        link
                );

                System.out.println("Email sent successfully");

                successCount++;

            } catch (Exception e) {

                e.printStackTrace();

                errors.add(
                        "Row " + (i + 1)
                        + ": Invalid data format"
                );
            }
        }

        workbook.close();

        model.addAttribute("successCount", successCount);

        model.addAttribute("errors", errors);

        return "tpo/upload-result";
    }
    
    @GetMapping("/download-resume/{studentId}")
    public void downloadResume(
            @PathVariable Long studentId,
            HttpServletResponse response
    ) throws Exception {

        Student student = studentRepository.findById(studentId).orElse(null);

        if (student == null || student.getResumePath() == null) return;

        String filePath = "uploads/" + student.getResumePath();

        File file = new File(filePath);

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition",
                "attachment; filename=" + file.getName());

        Files.copy(file.toPath(), response.getOutputStream());
    }
    
    @GetMapping("/view-resume/{studentId}")
    public void viewResume(
            @PathVariable Long studentId,
            HttpServletResponse response
    ) throws Exception {

        Student student = studentRepository.findById(studentId).orElse(null);

        if (student == null || student.getResumePath() == null) return;

        String filePath = System.getProperty("user.dir") + "/uploads/" + student.getResumePath();

        File file = new File(filePath);

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "inline; filename=" + file.getName());

        Files.copy(file.toPath(), response.getOutputStream());
    }
    @GetMapping("/students")
    public String students(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(required = false) String keyword,
            HttpSession session,
            Model model
    ) {

        TPO tpo = (TPO) session.getAttribute("tpo");

        if (tpo == null) {
            return "redirect:/tpo/login";
        }

        Pageable pageable = PageRequest.of(page, 10);

        Page<Student> studentPage;

        // 🔥 SEARCH
        if (keyword != null && !keyword.trim().isEmpty()) {

            studentPage =
                    studentRepository
                    .findByCollegeIdAndNameContainingIgnoreCaseOrCollegeIdAndUsnContainingIgnoreCaseOrCollegeIdAndEmailContainingIgnoreCaseOrCollegeIdAndPhoneContainingIgnoreCaseOrCollegeIdAndBranchContainingIgnoreCase(

                            tpo.getCollege().getId(),
                            keyword,

                            tpo.getCollege().getId(),
                            keyword,

                            tpo.getCollege().getId(),
                            keyword,

                            tpo.getCollege().getId(),
                            keyword,

                            tpo.getCollege().getId(),
                            keyword,

                            pageable
                    );

        } else {

            studentPage =
                    studentRepository.findByCollegeId(
                            tpo.getCollege().getId(),
                            pageable
                    );
        }

        model.addAttribute(
                "students",
                studentPage.getContent()
        );

        model.addAttribute(
                "currentPage",
                page
        );

        model.addAttribute(
                "totalPages",
                studentPage.getTotalPages()
        );

        model.addAttribute(
                "keyword",
                keyword
        );
        model.addAttribute("totalStudents", studentRepository.countByCollegeId(tpo.getCollege().getId()));
        return "tpo/students";
    }
    
    @GetMapping("/export/drives/date-range")
    public void exportDrivesByDateRange(

            @RequestParam String startDate,
            @RequestParam String endDate,

            HttpSession session,
            HttpServletResponse response

    ) throws Exception {

        TPO tpo = (TPO) session.getAttribute("tpo");

        if (tpo == null) {
            return;
        }

        List<Drive> drives =
                driveRepository
                .findByCollegeIdAndDriveDateBetween(

                        tpo.getCollege().getId(),

                        LocalDate.parse(startDate),

                        LocalDate.parse(endDate)
                );

        Workbook workbook = new XSSFWorkbook();

        Sheet sheet = workbook.createSheet("Drives");

        Row header = sheet.createRow(0);

        header.createCell(0).setCellValue("Company");
        header.createCell(1).setCellValue("Role");
        header.createCell(2).setCellValue("Salary");
        header.createCell(3).setCellValue("Date");
        header.createCell(4).setCellValue("Status");

        int rowCount = 1;

        for (Drive d : drives) {

            Row row = sheet.createRow(rowCount++);

            row.createCell(0)
               .setCellValue(d.getCompanyName());

            row.createCell(1)
               .setCellValue(d.getRole());

            row.createCell(2)
               .setCellValue(d.getSalary());

            row.createCell(3)
               .setCellValue(
                       d.getDriveDate().toString()
               );

            row.createCell(4)
               .setCellValue(d.getStatus());
        }

        response.setContentType(
                "application/octet-stream"
        );

        response.setHeader(
                "Content-Disposition",
                "attachment; filename=filtered-drives.xlsx"
        );

        workbook.write(response.getOutputStream());

        workbook.close();
    }
}