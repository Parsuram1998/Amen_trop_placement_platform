package in.sp.main.Controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import in.sp.main.Entities.FresherProfile;
import in.sp.main.Entities.HrCandidateSelection;
import in.sp.main.Entities.HrRequest;
import in.sp.main.Entities.ProfessionalProfile;
import in.sp.main.Entities.User;
import in.sp.main.Enums.FresherStatus;
import in.sp.main.Enums.HrCandidateStatus;
import in.sp.main.Repositories.FresherProfileRepository;
import in.sp.main.Repositories.HrCandidateSelectionRepository;
import in.sp.main.Repositories.HrRequestRepository;
import in.sp.main.Repositories.ProfessionalProfileRepository;
import in.sp.main.Repositories.UserRepository;
import in.sp.main.ServicesImpl.NotificationService;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/hr")
public class HRController {

    @Autowired
    private FresherProfileRepository fresherProfileRepository;

    @Autowired
    private ProfessionalProfileRepository professionalRepo;
    @Autowired
    private NotificationService notificationService;
    @Autowired
    private HrRequestRepository hrRequestRepo;
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private HrCandidateSelectionRepository selectionRepo;

    // 🔥 SELECT CANDIDATE
    @RequestMapping(value="/select", method=RequestMethod.GET)
    public String selectCandidate(@RequestParam Long candidateId,
                                 HttpSession session){

        Long hrId = (Long) session.getAttribute("USER_ID");

        User hr = userRepository.findById(hrId).orElseThrow();
        User candidate = userRepository.findById(candidateId).orElseThrow();

        // check if already locked
        if(selectionRepo.findByCandidate(candidate).isPresent()){
            return "redirect:/hr/candidates?error=alreadyTaken";
        }

        HrCandidateSelection sel = new HrCandidateSelection();
        sel.setHr(hr);
        sel.setCandidate(candidate);
        sel.setStatus(HrCandidateStatus.SHORTLISTED);
        sel.setLocked(true);

        selectionRepo.save(sel);
        notificationService.send(candidate,
                "You have been shortlisted by HR");
        return "redirect:/hr/dashboard";
    }

    // 🔥 UPDATE STATUS
    @RequestMapping(value="/update-status", method=RequestMethod.POST)
    public String updateStatus(@RequestParam Long selectionId,
                               @RequestParam HrCandidateStatus status,
                               @RequestParam(required = false) String feedback){

        HrCandidateSelection sel = selectionRepo.findById(selectionId).orElseThrow();

        sel.setStatus(status);

        // 🔥 IF REJECTED → UNLOCK
               
        if(status == HrCandidateStatus.REJECTED){
            sel.setLocked(false);
            sel.setFeedback(feedback);
            notificationService.send(sel.getCandidate(),
                    "You have been rejected. Feedback: " + feedback);
        }

        selectionRepo.save(sel);

        return "redirect:/hr/stats";
    }
    
    
    
    @RequestMapping(value="/dashboard", method=RequestMethod.GET)
    public String dashboard(){
        return "hr/dashboard";
    }
    
    @RequestMapping(value="/stats", method=RequestMethod.GET)
    public String hrDashboard(HttpSession session, Model model){

        Long hrId = (Long) session.getAttribute("USER_ID");

        User hr = userRepository.findById(hrId).orElseThrow();

        List<HrCandidateSelection> selections = selectionRepo.findByHr(hr);

        model.addAttribute("selections", selections);

        return "hr/stats";
    }

    @RequestMapping(value="/freshers", method=RequestMethod.GET)
    public String selectedFreshers(
            @RequestParam(defaultValue="0") int page,
            Model model){

        PageRequest pageable = PageRequest.of(page,10);

        Page<FresherProfile> fresherPage =
                fresherProfileRepository.findByStatus(
                        FresherStatus.SELECTED,pageable);

        model.addAttribute("freshers",fresherPage.getContent());
        model.addAttribute("currentPage",page);
        model.addAttribute("totalPages",fresherPage.getTotalPages());

        return "hr/freshers";
    }
    
    @RequestMapping(value="/professionals", method=RequestMethod.GET)
    public String professionals(Model model){

        List<ProfessionalProfile> list =
        professionalRepo.findByVerifiedTrue();

        model.addAttribute("professionals", list);

        return "hr/professionals";
    }
    
    @RequestMapping(value="/fresher-profile", method=RequestMethod.GET)
    public String fresherProfile(@RequestParam Long id, Model model){

        FresherProfile profile =
        		fresherProfileRepository.findById(id).orElseThrow();

        model.addAttribute("profile", profile);

        return "hr/fresher-profile";
    }
    
    @RequestMapping(value="/support", method=RequestMethod.POST)
    public String support(@RequestParam String type,
                          @RequestParam String message,
                          HttpSession session){

        Long userId = (Long) session.getAttribute("USER_ID");

        User hr = userRepository.findById(userId).orElseThrow();

        HrRequest req = new HrRequest();
        req.setHr(hr);
        req.setType(type);
        req.setMessage(message);

        hrRequestRepo.save(req);

        return "redirect:/hr/dashboard?success=requestSent";
    }
}