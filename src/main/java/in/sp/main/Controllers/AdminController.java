package in.sp.main.Controllers;

import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

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

import in.sp.main.Entities.Admin;
import in.sp.main.Entities.College;
import in.sp.main.Entities.TPO;
import in.sp.main.Repositories.AdminRepository;
import in.sp.main.Repositories.CollegeRepository;
import in.sp.main.Repositories.DriveRepository;
import in.sp.main.Repositories.StudentRepository;
import in.sp.main.Repositories.TPORepository;
import in.sp.main.Services.EmailService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private StudentRepository studentRepository;
	@Autowired
	private DriveRepository driveRepository;
    @Autowired
    private CollegeRepository collegeRepository;

    @Autowired
    private TPORepository tpoRepository;
    
    @Autowired
    private AdminRepository adminRepository;

    @Autowired
    private EmailService emailService;
    
    @GetMapping("/register")
    public String registerPage() {
        return "admin/register";
    }

    @PostMapping("/register")
    public String register(
            @RequestParam String name,
            @RequestParam String email,
            @RequestParam String password
    ) {

        Admin admin = new Admin();
        admin.setName(name);
        admin.setEmail(email);
        admin.setPassword(password);

        adminRepository.save(admin);

        return "redirect:/admin/login";
    }

    // ---------------- LOGIN ----------------

    @GetMapping("/login")
    public String loginPage() {
        return "admin/login";
    }

    @PostMapping("/login")
    public String login(
            @RequestParam String email,
            @RequestParam String password,
            HttpSession session,
            Model model
    ) {

        Admin admin =
                adminRepository.findByEmailAndPassword(
                        email,
                        password
                );

        if (admin != null) {

            session.setAttribute("admin", admin);

            return "redirect:/admin/dashboard";
        }

        model.addAttribute(
                "error",
                "Invalid email or password"
        );

        return "admin/login";
    }

    // ---------------- DASHBOARD ----------------

    @GetMapping("/dashboard")
    public String dashboard(
            HttpSession session,
            Model model
    ) {

        if (session.getAttribute("admin") == null) {
            return "redirect:/admin/login";
        }

        // 🔥 COUNTS
        long totalColleges =
                collegeRepository.count();

        long totalTpos =
                tpoRepository.count();

        long totalStudents =
                studentRepository.count();

        long totalDrives =
                driveRepository.count();

        // 🔥 SEND TO JSP
        model.addAttribute(
                "totalColleges",
                totalColleges
        );

        model.addAttribute(
                "totalTpos",
                totalTpos
        );

        model.addAttribute(
                "totalStudents",
                totalStudents
        );

        model.addAttribute(
                "totalDrives",
                totalDrives
        );

        return "admin/dashboard";
    }
    // Show Add College Page
    @GetMapping("/add-college")
    public String addCollegePage(HttpSession session) {

        if (session.getAttribute("admin") == null) {
            return "redirect:/admin/login";
        }

        return "admin/add-college";
    }

    // Save College
    @PostMapping("/save-college")
    public String saveCollege(
            @RequestParam String name,
            @RequestParam String startDate,
            @RequestParam String endDate
    ) {

        College college = new College();
        college.setName(name);
        college.setSubscriptionStart(LocalDate.parse(startDate));
        college.setSubscriptionEnd(LocalDate.parse(endDate));
        college.setActive(true);

        collegeRepository.save(college);

        return "redirect:/admin/dashboard";
    }

    // Show Add TPO Page
    @GetMapping("/add-tpo")
    public String addTpoPage(Model model) {
        model.addAttribute("colleges", collegeRepository.findAll());
        return "admin/add-tpo";
    }

    // Save TPO
    @PostMapping("/save-tpo")
    public String saveTpo(
            @RequestParam String name,
            @RequestParam String email,
            @RequestParam Long collegeId,
            HttpServletRequest request,
            Model model
    ) {

        College college = collegeRepository.findById(collegeId).orElse(null);

        String token = UUID.randomUUID().toString();

        TPO tpo = new TPO();
        tpo.setName(name);
        tpo.setEmail(email);
        tpo.setCollege(college);
        tpo.setResetToken(token);

        tpoRepository.save(tpo);

        // 🔥 Dynamic URL
        String baseUrl = request.getRequestURL().toString()
                .replace(request.getRequestURI(), request.getContextPath());

        String link = baseUrl + "/tpo/set-password?token=" + token;

        emailService.sendPasswordSetupEmail(
                tpo.getEmail(),
                link
        );

        model.addAttribute(
                "success",
                "TPO added successfully. Password setup email sent."
        );

        return "admin/dashboard";
    }
    
    @GetMapping("/colleges")
    public String viewColleges(
            @RequestParam(defaultValue = "0") int page,
            HttpSession session,
            Model model
    ) {

        if (session.getAttribute("admin") == null) {
            return "redirect:/admin/login";
        }

        Pageable pageable = PageRequest.of(page, 5);

        Page<College> collegePage =
                collegeRepository.findAll(pageable);

        model.addAttribute(
                "colleges",
                collegePage.getContent()
        );

        model.addAttribute("currentPage", page);

        model.addAttribute(
                "totalPages",
                collegePage.getTotalPages()
        );

        return "admin/colleges";
    }
    
    @GetMapping("/tpos")
    public String viewTpos(
            @RequestParam(required = false) Long collegeId,
            @RequestParam(defaultValue = "0") int page,
            HttpSession session,
            Model model
    ) {

        if (session.getAttribute("admin") == null) {
            return "redirect:/admin/login";
        }

        Pageable pageable = PageRequest.of(page, 5);

        Page<TPO> tpoPage;

        if (collegeId != null) {

            tpoPage = tpoRepository
                    .findByCollegeId(collegeId, pageable);

        } else {

            tpoPage = tpoRepository.findAll(pageable);
        }

        List<College> colleges = collegeRepository.findAll();

        model.addAttribute("tpos", tpoPage.getContent());

        model.addAttribute("colleges", colleges);

        model.addAttribute("selectedCollegeId", collegeId);

        model.addAttribute("currentPage", page);

        model.addAttribute("totalPages",
                tpoPage.getTotalPages());

        return "admin/tpos";
    }
    
    @GetMapping("/edit-tpo/{id}")
    public String editTpoPage(@PathVariable Long id, Model model) {

        TPO tpo = tpoRepository.findById(id).orElse(null);

        List<College> colleges = collegeRepository.findAll();

        model.addAttribute("tpo", tpo);
        model.addAttribute("colleges", colleges);

        return "admin/edit-tpo";
    }
    @PostMapping("/update-tpo")
    public String updateTpo(TPO tpo) {

        tpoRepository.save(tpo);

        return "redirect:/admin/tpos";
    }
    @GetMapping("/delete-tpo/{id}")
    public String deleteTpo(@PathVariable Long id) {

        tpoRepository.deleteById(id);

        return "redirect:/admin/tpos";
    }
    
    @GetMapping("/edit-college/{id}")
    public String editCollegePage(
            @PathVariable Long id,
            HttpSession session,
            Model model
    ) {

        if (session.getAttribute("admin") == null) {
            return "redirect:/admin/login";
        }

        College college = collegeRepository.findById(id).orElse(null);

        model.addAttribute("college", college);

        return "admin/edit-college";
    }
    
    @PostMapping("/update-college")
    public String updateCollege(
            @RequestParam Long id,
            @RequestParam String name,
            @RequestParam String subscriptionEnd,
            HttpSession session
    ) {

        if (session.getAttribute("admin") == null) {
            return "redirect:/admin/login";
        }

        College college = collegeRepository.findById(id).orElse(null);

        if (college != null) {

            college.setName(name);

            college.setSubscriptionEnd(
                    LocalDate.parse(subscriptionEnd)
            );

            collegeRepository.save(college);
        }

        return "redirect:/admin/colleges";
    }
}