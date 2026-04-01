package in.sp.main.Controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import in.sp.main.Entities.FresherProfile;
import in.sp.main.Entities.HrCandidateSelection;
import in.sp.main.Entities.ProfessionalProfile;
import in.sp.main.Entities.User;
import in.sp.main.Enums.Role;
import in.sp.main.Repositories.FresherProfileRepository;
import in.sp.main.Repositories.HrCandidateSelectionRepository;
import in.sp.main.Repositories.ProfessionalProfileRepository;
import in.sp.main.Repositories.UserRepository;
import jakarta.servlet.http.HttpSession;

@Controller
public class HRCandidatesController {
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private HrCandidateSelectionRepository selectionRepo;

	@Autowired
	private FresherProfileRepository fresherRepo;
	
	@Autowired
	private ProfessionalProfileRepository profRepo;
	
	@RequestMapping(value="/candidates", method=RequestMethod.GET)
	public String candidates(HttpSession session, Model model){

	    Long hrId = (Long) session.getAttribute("USER_ID");

	    if(hrId == null){
	        return "redirect:/auth/login";
	    }

	    User hr = userRepository.findById(hrId).orElseThrow();

	    List<User> allCandidates = userRepository.findByRoleIn(
	            java.util.Arrays.asList(Role.FRESHER, Role.PROFESSIONAL)
	    );

	    List<User> visibleCandidates = new ArrayList<>();

	    Map<Long, String> resumeMap = new HashMap<>();
	    Map<Long, String> skillMap = new HashMap<>();
	    Map<Long, String> locationMap = new HashMap<>();

	    // 🔥 NEW MAPS
	    Map<Long, Integer> experienceMap = new HashMap<>();
	    Map<Long, Double> expectedCtcMap = new HashMap<>();
	    Map<Long, String> noticeMap = new HashMap<>();
	    Map<Long, String> companyMap = new HashMap<>();

	    Map<Long, Double> degreeMap = new HashMap<>();
	    Map<Long, String> bondMap = new HashMap<>();

	    Map<Long, Boolean> verifiedMap = new HashMap<>();
	    Map<Long, Boolean> approvedMap = new HashMap<>();
	    Map<Long, String> lockedMap = new HashMap<>();

	    for(User c : allCandidates){

	        FresherProfile fp = null;
	        ProfessionalProfile pp = null;

	        if(c.getRole() == Role.FRESHER){
	            fp = fresherRepo.findByUser(c).orElse(null);
	            if(fp == null || !fp.isActive()) continue;

	        } else {
	            pp = profRepo.findByUser(c).orElse(null);
	            if(pp == null || !pp.isActive()) continue;
	        }

	        // 🔴 APPROVAL CHECK
	        boolean approved = (fp != null) ? fp.isApproved() : pp.isApproved();
	        if(!approved) continue;

	        // 🔴 HR LOCK
	        var selectionOpt = selectionRepo.findByCandidate(c);
	        if(selectionOpt.isPresent()){
	            HrCandidateSelection sel = selectionOpt.get();

	            if(sel.isLocked() && !sel.getHr().getId().equals(hr.getId())){
	                continue;
	            }
	        }

	        visibleCandidates.add(c);

	        // 🔥 COMMON DATA
	        if(fp != null){
	            skillMap.put(c.getId(), fp.getSkillSet());
	            locationMap.put(c.getId(), fp.getPreferredLocations());
	            degreeMap.put(c.getId(), fp.getDegreePercentage());
	            bondMap.put(c.getId(), String.valueOf(fp.isReadyForBond()));
	            resumeMap.put(c.getId(), fp.getResumePath());

	            verifiedMap.put(c.getId(), false); // fresher no verified
	            approvedMap.put(c.getId(), fp.isApproved());
	            lockedMap.put(c.getId(), String.valueOf(fp.getLockedByHrId()));

	        } else {

	            skillMap.put(c.getId(), pp.getSkillSet());
	            locationMap.put(c.getId(), pp.getPreferredLocations());
	            experienceMap.put(c.getId(), pp.getExperienceYears());
	            expectedCtcMap.put(c.getId(), pp.getExpectedCtc());
	            noticeMap.put(c.getId(), pp.getNoticePeriod());
	            companyMap.put(c.getId(), pp.getCompanyName());
	            resumeMap.put(c.getId(), pp.getResumePath());

	            verifiedMap.put(c.getId(), pp.isVerified());
	            approvedMap.put(c.getId(), pp.isApproved());
	            lockedMap.put(c.getId(), String.valueOf(pp.getLockedByHrId()));
	        }
	    }

	    // 🔥 SEND EVERYTHING
	    model.addAttribute("candidates", visibleCandidates);

	    model.addAttribute("resumeMap", resumeMap);
	    model.addAttribute("skillMap", skillMap);
	    model.addAttribute("locationMap", locationMap);

	    model.addAttribute("experienceMap", experienceMap);
	    model.addAttribute("expectedCtcMap", expectedCtcMap);
	    model.addAttribute("noticeMap", noticeMap);
	    model.addAttribute("companyMap", companyMap);

	    model.addAttribute("degreeMap", degreeMap);
	    model.addAttribute("bondMap", bondMap);

	    model.addAttribute("verifiedMap", verifiedMap);
	    model.addAttribute("approvedMap", approvedMap);
	    model.addAttribute("lockedMap", lockedMap);

	    return "hr/candidates";
	}
}
