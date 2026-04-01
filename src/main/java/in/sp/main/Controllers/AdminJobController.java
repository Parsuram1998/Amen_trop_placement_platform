package in.sp.main.Controllers;

import java.time.LocalDateTime;
import java.util.List;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
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
import in.sp.main.Repositories.FresherProfileRepository;
import in.sp.main.Repositories.JobApplicationRepository;
import in.sp.main.Repositories.JobRepository;
import in.sp.main.Repositories.JobUpdateRepository;
import in.sp.main.Repositories.ProfessionalProfileRepository;
import in.sp.main.Services.JobMailService;
import in.sp.main.Services.MailService;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminJobController {

    @Autowired
    private JobRepository jobRepository;
    
    @Autowired
    private JobApplicationRepository applicationRepository;
    
    @Autowired
    private FresherProfileRepository fresherRepo;

    @Autowired
    private ProfessionalProfileRepository professionalRepo;
    
    @Autowired
    private MailService mailService;
    
    @Autowired
    private JobMailService jobMailService;
    
    @Autowired
    private JobUpdateRepository jobUpdateRepo;
    
    @RequestMapping(value="/jobs", method=RequestMethod.GET)
    public String jobs(Model model){

        model.addAttribute("jobs", jobRepository.findAll());

        return "admin/jobs";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String jobs(HttpSession session, Model model){

        Object roleObj = session.getAttribute("ROLE");

        if (roleObj == null) {
            return "redirect:/auth/login";
        }

        String role = roleObj.toString();

        List<Job> jobs;

        if(role.equalsIgnoreCase("FRESHER")){
            jobs = jobRepository.findByJobTypeInIgnoreCase(
                    List.of("FRESHER","BOTH")
            );
        }else{
            jobs = jobRepository.findByJobTypeInIgnoreCase(
                    List.of("PROFESSIONAL","BOTH")
            );
        }

        model.addAttribute("jobs", jobs);

        return "jobs/list";
    }

    @RequestMapping(value="/create-job", method=RequestMethod.GET)
    public String createJobPage(){
        return "admin/create-job";
    }

    @RequestMapping(value="/save-job", method=RequestMethod.POST)
    public String saveJob(
            @RequestParam String title,
            @RequestParam String companyName,
            @RequestParam String location,
            @RequestParam String domain,
            @RequestParam String description,
            @RequestParam String eligibility,
            @RequestParam int minExperience,
            @RequestParam double minPercentage,
            @RequestParam String jobType,
            @RequestParam(required=false) boolean strictApply,
            @RequestParam(required = false) boolean bondRequired,
            Model model){

        boolean exists = jobRepository
                .existsByTitleAndCompanyNameAndLocation(
                        title,
                        companyName,
                        location);

        if(exists){

            model.addAttribute("error",
                    "Job already exists for this company and location");

            return "admin/create-job";
        }

        Job job = new Job();

        job.setTitle(title);
        job.setCompanyName(companyName);
        job.setLocation(location);
        job.setDomain(domain);
        job.setDescription(description);
        job.setEligibility(eligibility);
        job.setMinExperience(minExperience);
        job.setMinPercentage(minPercentage);
        job.setJobType(jobType);
        job.setStrictApply(strictApply);
        job.setCreatedAt(LocalDateTime.now());
        job.setBondRequired(bondRequired);
        
        Job savedJob = jobRepository.save(job);
        jobMailService.sendJobNotification(savedJob);

        return "redirect:/admin/jobs";
    }

    @RequestMapping(value="/job-applicants", method=RequestMethod.GET)
    public String jobApplicants(@RequestParam Long jobId,
                                @RequestParam(required = false) String skill,
                                @RequestParam(required = false) String role,
                                @RequestParam(required = false) Integer minExperience,
                                @RequestParam(required = false) Double minDegree,
                                Model model){

        Job job = jobRepository.findById(jobId).orElseThrow();

        List<JobApplication> apps = applicationRepository.findByJob(job);

        if (role != null && !role.trim().isEmpty()) {
            apps = apps.stream()
                    .filter(a -> a.getUser().getRole().name().equalsIgnoreCase(role))
                    .toList();
        }

        if (skill != null && !skill.trim().isEmpty()) {
            String searchSkill = skill.toLowerCase();

            apps = apps.stream().filter(a -> {
                User u = a.getUser();

                if ("FRESHER".equalsIgnoreCase(u.getRole().name())) {
                    FresherProfile fp = fresherRepo.findByUser(u).orElse(null);
                    return fp != null
                            && fp.getSkillSet() != null
                            && fp.getSkillSet().toLowerCase().contains(searchSkill);
                }

                if ("PROFESSIONAL".equalsIgnoreCase(u.getRole().name())) {
                    ProfessionalProfile pp = professionalRepo.findByUser(u).orElse(null);
                    return pp != null
                            && pp.getSkillSet() != null
                            && pp.getSkillSet().toLowerCase().contains(searchSkill);
                }

                return false;
            }).toList();
        }

        if (minExperience != null) {
            apps = apps.stream().filter(a -> {
                User u = a.getUser();

                if ("PROFESSIONAL".equalsIgnoreCase(u.getRole().name())) {
                    ProfessionalProfile pp = professionalRepo.findByUser(u).orElse(null);
                    return pp != null && pp.getExperienceYears() >= minExperience;
                }

                return true;
            }).toList();
        }

        if (minDegree != null) {
            apps = apps.stream().filter(a -> {
                User u = a.getUser();

                if ("FRESHER".equalsIgnoreCase(u.getRole().name())) {
                    FresherProfile fp = fresherRepo.findByUser(u).orElse(null);
                    return fp != null
                            && fp.getDegreePercentage() != null
                            && fp.getDegreePercentage() >= minDegree;
                }

                return true;
            }).toList();
        }

        model.addAttribute("job", job);
        model.addAttribute("applications", apps);

        return "admin/job-applicants";
    }
    
    @RequestMapping(value="/download-applicants", method=RequestMethod.GET)
    public void downloadApplicants(@RequestParam Long jobId,
                                   @RequestParam(required = false) String skill,
                                   @RequestParam(required = false) String role,
                                   @RequestParam(required = false) Integer minExperience,
                                   @RequestParam(required = false) Double minDegree,
                                   HttpServletResponse response) throws Exception {

        Job job = jobRepository.findById(jobId).orElseThrow();

        List<JobApplication> apps = applicationRepository.findByJob(job);

        if (role != null && !role.trim().isEmpty()) {
            apps = apps.stream()
                    .filter(a -> a.getUser().getRole().name().equalsIgnoreCase(role))
                    .toList();
        }

        if (skill != null && !skill.trim().isEmpty()) {
            String searchSkill = skill.toLowerCase();

            apps = apps.stream().filter(a -> {
                User u = a.getUser();

                if ("FRESHER".equalsIgnoreCase(u.getRole().name())) {
                    FresherProfile fp = fresherRepo.findByUser(u).orElse(null);
                    return fp != null
                            && fp.getSkillSet() != null
                            && fp.getSkillSet().toLowerCase().contains(searchSkill);
                }

                if ("PROFESSIONAL".equalsIgnoreCase(u.getRole().name())) {
                    ProfessionalProfile pp = professionalRepo.findByUser(u).orElse(null);
                    return pp != null
                            && pp.getSkillSet() != null
                            && pp.getSkillSet().toLowerCase().contains(searchSkill);
                }

                return false;
            }).toList();
        }

        if (minExperience != null) {
            apps = apps.stream().filter(a -> {
                User u = a.getUser();

                if ("PROFESSIONAL".equalsIgnoreCase(u.getRole().name())) {
                    ProfessionalProfile pp = professionalRepo.findByUser(u).orElse(null);
                    return pp != null && pp.getExperienceYears() >= minExperience;
                }

                return true;
            }).toList();
        }

        if (minDegree != null) {
            apps = apps.stream().filter(a -> {
                User u = a.getUser();

                if ("FRESHER".equalsIgnoreCase(u.getRole().name())) {
                    FresherProfile fp = fresherRepo.findByUser(u).orElse(null);
                    return fp != null
                            && fp.getDegreePercentage() != null
                            && fp.getDegreePercentage() >= minDegree;
                }

                return true;
            }).toList();
        }

        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("Applicants");

        Row header = sheet.createRow(0);
        header.createCell(0).setCellValue("Name");
        header.createCell(1).setCellValue("Email");
        header.createCell(2).setCellValue("Phone");
        header.createCell(3).setCellValue("Role");
        header.createCell(4).setCellValue("Applied At");

        int rowCount = 1;

        for (JobApplication app : apps) {
            Row row = sheet.createRow(rowCount++);

            User u = app.getUser();
            row.createCell(0).setCellValue(u.getFullName() != null ? u.getFullName() : "");
            row.createCell(1).setCellValue(u.getEmail() != null ? u.getEmail() : "");
            row.createCell(2).setCellValue(u.getPhone() != null ? u.getPhone() : "");
            row.createCell(3).setCellValue(u.getRole() != null ? u.getRole().name() : "");
            row.createCell(4).setCellValue(app.getAppliedAt() != null ? app.getAppliedAt().toString() : "");
        }

        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setHeader("Content-Disposition", "attachment; filename=filtered_applicants.xlsx");

        workbook.write(response.getOutputStream());
        workbook.close();
    }
    
    @RequestMapping(value="/add-update", method=RequestMethod.POST)
    public String addUpdate(@RequestParam Long jobId,
                            @RequestParam String updateText){

        try {

            Job job = jobRepository.findById(jobId)
                    .orElseThrow(() -> new RuntimeException("Job not found"));

            JobUpdate update = new JobUpdate();
            update.setJob(job);
            update.setUpdateText(updateText);
            update.setCreatedAt(java.time.LocalDateTime.now());

            jobUpdateRepo.save(update);

            return "redirect:/admin/jobs";

        } catch (Exception e) {

            e.printStackTrace();   // 🔥 THIS WILL SHOW REAL ERROR IN CONSOLE

            throw e;               // rethrow so you still see error page
        }
    }
}