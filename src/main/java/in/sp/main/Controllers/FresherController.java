package in.sp.main.Controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import in.sp.main.Entities.FresherProfile;
import in.sp.main.Entities.Message;
import in.sp.main.Entities.User;
import in.sp.main.Repositories.FresherProfileRepository;
import in.sp.main.Repositories.JobApplicationRepository;
import in.sp.main.Repositories.JobRepository;
import in.sp.main.Repositories.MessageRepository;
import in.sp.main.Repositories.UserRepository;
import in.sp.main.Services.CertificateService;
import in.sp.main.Services.FresherProfileService;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/fresher")
public class FresherController {

    @Autowired
    private FresherProfileService fresherProfileService;
    
    @Autowired
    private FresherProfileRepository fresherProfileRepository;

    @Autowired
    private UserRepository userRepository;
    
    @Autowired
    private JobRepository jobRepository;

    @Autowired
    private JobApplicationRepository applicationRepository;

    @Autowired
    private CertificateService certificateService;

    @Autowired
    private MessageRepository messageRepo;
    
    @RequestMapping(value="/dashboard", method=RequestMethod.GET)
    public String dashboard(HttpSession session, Model model) {

        Long userId = (Long) session.getAttribute("USER_ID");

        if (userId == null) {
            return "redirect:/auth/login";
        }

        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));

        long totalJobs = jobRepository.countByJobTypeIn(
                java.util.Arrays.asList("FRESHER", "BOTH")
        );

        long appliedJobs = applicationRepository.countByUser(user);

        model.addAttribute("totalJobs", totalJobs);
        model.addAttribute("appliedJobs", appliedJobs);

        FresherProfile profile = fresherProfileRepository.findByUser(user).orElse(null);

        System.out.println("USER ID: " + user.getId());
        System.out.println("PROFILE ID: " + (profile != null ? profile.getId() : "null"));
        System.out.println("APPROVED: " + (profile != null && profile.isCertificateApproved()));
        System.out.println("PATH: " + (profile != null ? profile.getCertificatePath() : "null"));

        boolean showCertificate = false;
        String certificatePath = null;

        if (profile != null && profile.isCertificateApproved() && profile.getCertificatePath() != null) {
            showCertificate = true;
            certificatePath = profile.getCertificatePath();
        }

        System.out.println("SHOW CERTIFICATE: " + showCertificate);
        model.addAttribute("user", user);
        model.addAttribute("showCertificate", showCertificate);
        model.addAttribute("certificatePath", certificatePath);

        return "fresher/dashboard";
    }
   @RequestMapping(value = "/profile", method = RequestMethod.GET)
    public String profileForm() {
       return "fresher/profile";
    }

    @RequestMapping(value = "/profile", method = RequestMethod.POST)
    public String saveProfile(
            HttpSession session,
            @RequestParam String skillSet,
            @RequestParam String domainInterested,
            @RequestParam Double tenth,
            @RequestParam Double twelfth,
            @RequestParam Double degree,
            @RequestParam String preferredLocations,
            @RequestParam(required = false, defaultValue = "false") boolean readyForBond,
            @RequestParam MultipartFile resume,
            @RequestParam MultipartFile video,
            @RequestParam MultipartFile photo,
            @RequestParam MultipartFile aadhar
    ) {

        fresherProfileService.saveProfile(
                session,
                skillSet,
                domainInterested,
                tenth,
                twelfth,
                degree,
                preferredLocations,
                readyForBond,
                resume,
                video,
                photo,
                aadhar
        );

        return "redirect:/fresher/dashboard";
    }
    @RequestMapping(value = "/viewprofile", method = RequestMethod.GET)
    public String viewProfile(HttpSession session, Model model) {

        Long userId = (Long) session.getAttribute("USER_ID");

        if (userId == null) {
            return "redirect:/auth/login";
        }

        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));

        FresherProfile profile = fresherProfileRepository
                .findByUser(user)
                .orElse(null);

        model.addAttribute("profile", profile);

        return "fresher/view-profile";
    }
    
    @RequestMapping(value = "/edit-profile", method = RequestMethod.GET)
    public String editProfile(HttpSession session, Model model) {

        Long userId = (Long) session.getAttribute("USER_ID");

        if (userId == null) {
            return "redirect:/auth/login";
        }

        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));

        FresherProfile profile = fresherProfileRepository
                .findByUser(user)
                .orElse(null);

        model.addAttribute("profile", profile);

        return "fresher/edit-profile";
    }
    
   
    @RequestMapping(value="/download-certificate", method=RequestMethod.GET)
    public String certificate(HttpSession session, Model model){

        Long userId = (Long) session.getAttribute("USER_ID");

        User user = userRepository.findById(userId).orElseThrow();

        String file = certificateService.generateCertificate(user);

        model.addAttribute("file", file);

        return "fresher/certificate";
    }
    
    @RequestMapping(value="/toggle-profile", method=RequestMethod.GET)
    public String toggleProfile(HttpSession session){

        Long userId = (Long) session.getAttribute("USER_ID");

        User user = userRepository.findById(userId).orElseThrow();

        user.setProfileActive(!user.isProfileActive());

        userRepository.save(user);

        return "redirect:/fresher/dashboard";
    }
    
    @RequestMapping(value="/messages", method=RequestMethod.GET)
    public String viewMessages(HttpSession session, Model model){

        Long userId = (Long) session.getAttribute("USER_ID");

        if(userId == null){
            return "redirect:/auth/login";
        }

        User user = userRepository.findById(userId).orElseThrow();

        List<Message> messages = messageRepo.findByReceiver(user);

        model.addAttribute("messages", messages);

        return "fresher/messages";
    }
}