package in.sp.main.Controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import in.sp.main.Entities.Notification;
import in.sp.main.Entities.User;
import in.sp.main.Enums.Role;
import in.sp.main.Repositories.NotificationRepository;
import in.sp.main.Repositories.UserRepository;
import in.sp.main.Services.AuthService;
import in.sp.main.dto.LoginRequest;
import in.sp.main.dto.RegisterRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/auth")
public class AuthController {

    @Autowired
    private AuthService authService;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private NotificationRepository notificationRepository;
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginPage(Model model) {
        model.addAttribute("loginRequest", new LoginRequest());
        return "commons/login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@ModelAttribute LoginRequest request,
                        HttpSession session) {

        try {

            User user = authService.login(request);

            session.setAttribute("USER_ID", user.getId());
            session.setAttribute("ROLE", user.getRole());

            if (user.getRole() == Role.FRESHER) {
                return "redirect:/fresher/dashboard";
            } else if (user.getRole() == Role.PROFESSIONAL) {
                return "redirect:/professional/dashboard";
            } else if (user.getRole() == Role.ADMIN) {
                return "redirect:/admin/dashboard";
            } else if (user.getRole() == Role.HR) {
                return "redirect:/hr/dashboard";
            }

            return "redirect:/auth/login";

        } catch (Exception e) {
            e.printStackTrace();   
            throw e;
        }
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String registerPage(Model model) {
        model.addAttribute("registerRequest", new RegisterRequest());
        return "commons/register";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(@ModelAttribute RegisterRequest request,
                           Model model) {

        try {
            authService.register(request);
            return "redirect:/auth/login";

        } catch (RuntimeException ex) {

            model.addAttribute("error", ex.getMessage());
            model.addAttribute("registerRequest", request);

            return "commons/register";
        }
    }
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/auth/login";
    }

    @RequestMapping(value = "/register/fresher", method = RequestMethod.GET)
    public String fresherRegister(Model model) {

        RegisterRequest req = new RegisterRequest();
        req.setRole(Role.FRESHER);

        model.addAttribute("registerRequest", req);
        return "register/fresher-register";
    }

    @RequestMapping(value = "/register/professional", method = RequestMethod.GET)
    public String professionalRegister(Model model) {

        RegisterRequest req = new RegisterRequest();
        req.setRole(Role.PROFESSIONAL);

        model.addAttribute("registerRequest", req);
        return "register/professional-register";
    }

    @RequestMapping(value = "/register/admin", method = RequestMethod.GET)
    public String adminRegister(Model model) {

        RegisterRequest req = new RegisterRequest();
        req.setRole(Role.ADMIN);

        model.addAttribute("registerRequest", req);
        return "register/admin-register";
    }

    @RequestMapping(value = "/register/hr", method = RequestMethod.GET)
    public String hrRegister(Model model) {

        RegisterRequest req = new RegisterRequest();
        req.setRole(Role.HR);

        model.addAttribute("registerRequest", req);
        return "register/hr-register";
    }
    
    @RequestMapping("/notifications")
    public String notifications(HttpSession session, Model model){

        Long userId = (Long) session.getAttribute("USER_ID");

        User user = userRepository.findById(userId).orElseThrow();

        List<Notification> list = notificationRepository.findByReceiverOrderByCreatedAtDesc(user);

        model.addAttribute("notifications", list);

        return "common/notifications";
    }
}
