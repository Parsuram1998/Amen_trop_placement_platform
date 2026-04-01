package in.sp.main.Controllers;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import in.sp.main.Entities.FresherProfile;
import in.sp.main.Entities.HrCandidateSelection;
import in.sp.main.Entities.Message;
import in.sp.main.Entities.ProfessionalProfile;
import in.sp.main.Entities.User;
import in.sp.main.Enums.FresherStatus;
import in.sp.main.Enums.HrCandidateStatus;
import in.sp.main.Enums.Role;
import in.sp.main.Repositories.FresherProfileRepository;
import in.sp.main.Repositories.HrCandidateSelectionRepository;
import in.sp.main.Repositories.JobApplicationRepository;
import in.sp.main.Repositories.JobRepository;
import in.sp.main.Repositories.MessageRepository;
import in.sp.main.Repositories.ProfessionalProfileRepository;
import in.sp.main.Repositories.UserRepository;
import in.sp.main.Services.AdminDashboardService;
import in.sp.main.Services.CertificateService;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private FresherProfileRepository fresherProfileRepository;
    @Autowired
    private AdminDashboardService adminDashboardService;
    @Autowired
    private ProfessionalProfileRepository professionalRepo;
    @Autowired
    private JobRepository jobRepo;
    @Autowired
    private JobApplicationRepository appRepo;
    @Autowired
    private CertificateService certificateService;
    @Autowired
    private MessageRepository messageRepo;
    @Autowired
    private UserRepository userRepo; 
    @Autowired
    private HrCandidateSelectionRepository selectionRepo;

    @RequestMapping(value="/hr-feedback", method=RequestMethod.GET)
    public String viewFeedback(Model model){

        List<HrCandidateSelection> all = selectionRepo.findAll();

        // Only rejected with feedback
        List<HrCandidateSelection> feedbackList = all.stream()
                .filter(s -> s.getStatus() == HrCandidateStatus.REJECTED)
                .filter(s -> s.getFeedback() != null && !s.getFeedback().isEmpty())
                .toList();

        model.addAttribute("feedbackList", feedbackList);

        return "admin/hr-feedback";
    }
    
    @RequestMapping(value="/dashboard", method=RequestMethod.GET)
    public String dashboard(Model model){

        model.addAttribute("totalFreshers", fresherProfileRepository.count());

        model.addAttribute("selectedFreshers",
                fresherProfileRepository.countByStatus(FresherStatus.SELECTED));

        model.addAttribute("needsImprovement",
                fresherProfileRepository.countByStatus(FresherStatus.NEEDS_IMPROVEMENT));

        model.addAttribute("totalProfessionals",
                professionalRepo.count());

        model.addAttribute("verifiedProfessionals",
                professionalRepo.countByVerifiedTrue());

        model.addAttribute("totalJobs",
                jobRepo.count());

        model.addAttribute("totalApplications",
                appRepo.count());

        return "admin/dashboard";
    }
    
    @RequestMapping(value="/freshers", method=RequestMethod.GET)
    public String viewFreshers(
            @RequestParam(defaultValue="0") int page,
            @RequestParam(required=false) String status,
            Model model) {

        try {

            PageRequest pageable = PageRequest.of(page,10);

            Page<FresherProfile> fresherPage;

            FresherStatus statusEnum = null;

            if(status != null){
                try {
                    statusEnum = FresherStatus.valueOf(status);
                } catch(Exception e){
                    statusEnum = null;
                }
            }

            if(statusEnum != null){
                fresherPage = fresherProfileRepository.findByStatus(statusEnum,pageable);
            }else{
                fresherPage = fresherProfileRepository.findAll(pageable);
            }

            model.addAttribute("freshers",fresherPage.getContent());
            model.addAttribute("currentPage",page);
            model.addAttribute("totalPages",fresherPage.getTotalPages());

            return "admin/freshers";

        } catch (Exception e) {
            e.printStackTrace();   // 🔥 THIS WILL PRINT FULL ERROR IN CONSOLE
            throw e;               // rethrow so you still see error page
        }
    }

    @RequestMapping(value="/update-status", method=RequestMethod.POST)
    public String updateStatus(
            @RequestParam Long id,
            @RequestParam String status) {

        FresherProfile profile =
                fresherProfileRepository.findById(id).orElseThrow();
        System.out.println("STATUS RECEIVED: " + status);
        profile.setStatus(FresherStatus.valueOf(status));

        fresherProfileRepository.save(profile);

        return "redirect:/admin/freshers";
    }
    
    @RequestMapping(value="/professionals", method=RequestMethod.GET)
    public String viewProfessionals(
            @RequestParam(defaultValue="0") int page,
            Model model){

        PageRequest pageable = PageRequest.of(page,10);

        Page<ProfessionalProfile> professionalPage =
                professionalRepo.findAll(pageable);

        model.addAttribute("professionals", professionalPage.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", professionalPage.getTotalPages());

        return "admin/professionals";
    }
    
    @RequestMapping(value="/verify-professional", method=RequestMethod.POST)
    public String verifyProfessional(@RequestParam Long id){

        ProfessionalProfile profile =
                professionalRepo.findById(id).orElseThrow();

        profile.setVerified(true);

        professionalRepo.save(profile);

        return "redirect:/admin/professionals";
    }
    
    @RequestMapping(value="/upload-template", method=RequestMethod.POST)
    public String uploadTemplate(@RequestParam MultipartFile file){

        try {
            File dir = new File("templates/");
            if(!dir.exists()) dir.mkdirs();

            file.transferTo(new File("templates/template.docx"));

        } catch(Exception e){
            e.printStackTrace();
        }

        return "redirect:/admin/dashboard";
    }
    
    @RequestMapping(value="/generate-certificate", method=RequestMethod.GET)
    public String generateCertificate(@RequestParam Long fresherId){

        try {

            System.out.println("=== ADMIN TRIGGER CERTIFICATE ===");

            FresherProfile profile = fresherProfileRepository.findById(fresherId).orElseThrow();

            User user = profile.getUser();

            String path = certificateService.generateCertificate(user);

            System.out.println("Generated Path: " + path);

            profile.setCertificatePath(path);
            profile.setCertificateApproved(true);

            fresherProfileRepository.save(profile);

            System.out.println("=== DB SAVED SUCCESS ===");

        } catch (Exception e) {
            System.out.println("=== ERROR IN ADMIN CERTIFICATE ===");
            e.printStackTrace(); 
        }

        return "redirect:/admin/freshers";
    }
    
    @RequestMapping(value="/send-message", method=RequestMethod.POST)
    public String sendMessage(@RequestParam(required=false) String clientName,
                              @RequestParam String content,
                              @RequestParam(required=false) List<Long> userIds){

        String sender = (clientName != null && !clientName.isEmpty())
                ? clientName
                : "Amentrop Admin";

        // ❗ IMPORTANT: If nothing selected → don't send
        if(userIds == null || userIds.isEmpty()){
            return "redirect:/admin/send-message?error=noUsersSelected";
        }

        List<User> users = userRepo.findAllById(userIds);

        for(User u : users){
            Message m = new Message();
            m.setSenderName(sender);
            m.setContent(content);
            m.setReceiver(u);

            messageRepo.save(m);
        }

        return "redirect:/admin/send-message?success=true";
    }
    
    @RequestMapping(value="/send-message", method=RequestMethod.GET)
    public String messagePage(Model model){

        List<User> users = userRepo.findByRoleIn(
                java.util.Arrays.asList(Role.FRESHER, Role.PROFESSIONAL)
        );

        model.addAttribute("users", users);

        return "admin/message";
    }
    @RequestMapping(value="/approve-candidate", method=RequestMethod.GET)
    public String approveCandidate(@RequestParam Long userId){

        try {

        	User user = userRepo.findById(userId)
                    .orElseThrow(() -> new RuntimeException("User not found"));

            if(user.getRole() == Role.FRESHER){

            	FresherProfile fp = fresherProfileRepository.findByUser(user).orElse(null);

                if(fp == null){
                    System.out.println("Fresher profile NOT FOUND for user: " + userId);
                    return "redirect:/admin/dashboard?error=profileNotFound";
                }

                fp.setApproved(true);
                fresherProfileRepository.save(fp);

            } else if(user.getRole() == Role.PROFESSIONAL){

            	ProfessionalProfile pp = professionalRepo.findByUser(user).orElse(null);

                if(pp == null){
                    System.out.println("Professional profile NOT FOUND for user: " + userId);
                    return "redirect:/admin/dashboard?error=profileNotFound";
                }

                pp.setApproved(true);
                professionalRepo.save(pp);
            }

            return "redirect:/admin/dashboard?success=approved";

        } catch (Exception e){
            e.printStackTrace(); // 🔥 VERY IMPORTANT
            return "redirect:/admin/dashboard?error=exception";
        }
    }

}