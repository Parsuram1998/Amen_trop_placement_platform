package in.sp.main.Controllers;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import in.sp.main.Entities.FresherProfile;
import in.sp.main.Entities.Job;
import in.sp.main.Entities.JobApplication;
import in.sp.main.Entities.JobUpdate;
import in.sp.main.Entities.ProfessionalProfile;
import in.sp.main.Entities.User;
import in.sp.main.Enums.Role;
import in.sp.main.Repositories.FresherProfileRepository;
import in.sp.main.Repositories.JobApplicationRepository;
import in.sp.main.Repositories.JobRepository;
import in.sp.main.Repositories.JobUpdateRepository;
import in.sp.main.Repositories.ProfessionalProfileRepository;
import in.sp.main.Repositories.UserRepository;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/jobs")
public class JobController {

    @Autowired
    private JobRepository jobRepository;

    @Autowired
    private JobApplicationRepository applicationRepository;

    @Autowired
    private UserRepository userRepository;
    
    @Autowired
    private FresherProfileRepository fresherRepo;

    @Autowired
    private ProfessionalProfileRepository professionalRepo;
    
    @Autowired
    private JobUpdateRepository jobUpdateRepo;

    @RequestMapping(method = RequestMethod.GET)
    public String jobs(HttpSession session, Model model){

        try {

            System.out.println("STEP 1");

            Object roleObj = session.getAttribute("ROLE");
            System.out.println("ROLE = " + roleObj);

            if (roleObj == null) {
                return "redirect:/auth/login";
            }

            Role role = Role.valueOf(roleObj.toString());
            System.out.println("ROLE CASTED = " + role);

            List<Job> jobs;

            System.out.println("STEP 2");

            // 🔥 TEMP: bypass query
            jobs = jobRepository.findAll();

            System.out.println("JOBS SIZE = " + jobs.size());

            model.addAttribute("jobs", jobs);

            System.out.println("STEP 3");

            return "jobs/list";

        } catch (Exception e) {
            e.printStackTrace();   // ⭐ THIS IS THE KEY
            return "error";
        }
    }

    @RequestMapping(value="/details", method=RequestMethod.GET)
    public String jobDetails(@RequestParam Long id,
                             HttpSession session,
                             Model model){

        Job job = jobRepository.findById(id).orElseThrow();

        Long userId = (Long) session.getAttribute("USER_ID");

        User user = userRepository.findById(userId).orElseThrow();

        boolean alreadyApplied =
                applicationRepository.existsByJobAndUser(job,user);

        List<JobUpdate> updates = jobUpdateRepo.findByJob(job);
        
        model.addAttribute("job", job);
        model.addAttribute("alreadyApplied", alreadyApplied);
        model.addAttribute("updates", updates);
        return "jobs/details";
    }
    
    @RequestMapping(value="/apply", method=RequestMethod.POST)
    public String applyJob(@RequestParam Long jobId,
                           HttpSession session){

        Long userId = (Long) session.getAttribute("USER_ID");

        if (userId == null) {
            return "redirect:/login";
        }

        User user = userRepository.findById(userId).orElseThrow();

        Job job = jobRepository.findById(jobId).orElseThrow();

        if (applicationRepository.existsByJobAndUser(job, user)) {
            return "redirect:/jobs/details?id=" + jobId + "&alreadyApplied=true";
        }

        String role = user.getRole().name();

        // Job type eligibility
        if ("FRESHER".equalsIgnoreCase(role)) {
            if (!"FRESHER".equalsIgnoreCase(job.getJobType())
                    && !"BOTH".equalsIgnoreCase(job.getJobType())) {
                return "redirect:/jobs/details?id=" + jobId + "&notEligible=true";
            }
        }

        if ("PROFESSIONAL".equalsIgnoreCase(role)) {
            if (!"PROFESSIONAL".equalsIgnoreCase(job.getJobType())
                    && !"BOTH".equalsIgnoreCase(job.getJobType())) {
                return "redirect:/jobs/details?id=" + jobId + "&notEligible=true";
            }
        }

        // Strict apply eligibility
        if (job.isStrictApply()) {

            if ("FRESHER".equalsIgnoreCase(role)) {

                FresherProfile fresher = fresherRepo.findByUser(user).orElse(null);

                if (fresher == null) {
                    return "redirect:/jobs/details?id=" + jobId + "&notEligible=true";
                }

                if (fresher.getDegreePercentage() == null
                        || fresher.getDegreePercentage() < job.getMinPercentage()) {
                    return "redirect:/jobs/details?id=" + jobId + "&notEligible=true";
                }

                if (job.getDomain() != null && !job.getDomain().trim().isEmpty()
                        && fresher.getDomainInterested() != null
                        && !fresher.getDomainInterested().toLowerCase().contains(job.getDomain().toLowerCase())) {
                    return "redirect:/jobs/details?id=" + jobId + "&notEligible=true";
                }

                if (job.isBondRequired() && !fresher.isReadyForBond()) {
                    return "redirect:/jobs/details?id=" + jobId + "&notEligible=true";
                }
            }

            if ("PROFESSIONAL".equalsIgnoreCase(role)) {

                ProfessionalProfile professional = professionalRepo.findByUser(user).orElse(null);

                if (professional == null) {
                    return "redirect:/jobs/details?id=" + jobId + "&notEligible=true";
                }

                if (professional.getExperienceYears() < job.getMinExperience()) {
                    return "redirect:/jobs/details?id=" + jobId + "&notEligible=true";
                }

                if (job.getDomain() != null && !job.getDomain().trim().isEmpty()
                        && professional.getDomainLooking() != null
                        && !professional.getDomainLooking().toLowerCase().contains(job.getDomain().toLowerCase())) {
                    return "redirect:/jobs/details?id=" + jobId + "&notEligible=true";
                }
            }
        }

        JobApplication app = new JobApplication();
        app.setJob(job);
        app.setUser(user);
        app.setAppliedAt(LocalDateTime.now());

        applicationRepository.save(app);

        return "redirect:/jobs/details?id=" + jobId + "&applied=true";
    }
  

  
}