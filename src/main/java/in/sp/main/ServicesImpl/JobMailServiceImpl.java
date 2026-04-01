package in.sp.main.ServicesImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import in.sp.main.Entities.Job;
import in.sp.main.Entities.User;
import in.sp.main.Enums.Role;
import in.sp.main.Repositories.UserRepository;
import in.sp.main.Services.JobMailService;

@Service
public class JobMailServiceImpl implements JobMailService {

    @Autowired
    private JavaMailSender mailSender;

    @Autowired
    private UserRepository userRepository;

    @Override
    public void sendJobNotification(Job job) {

        List<User> recipients = new ArrayList<>();

        if ("FRESHER".equalsIgnoreCase(job.getJobType())) {
            recipients = userRepository.findByRole(Role.FRESHER);
        } else if ("PROFESSIONAL".equalsIgnoreCase(job.getJobType())) {
            recipients = userRepository.findByRole(Role.PROFESSIONAL);
        } else if ("BOTH".equalsIgnoreCase(job.getJobType())) {
            recipients.addAll(userRepository.findByRole(Role.FRESHER));
            recipients.addAll(userRepository.findByRole(Role.PROFESSIONAL));
        }

        for (User user : recipients) {
            if (user.getEmail() == null || user.getEmail().trim().isEmpty()) {
                continue;
            }

            try {
                SimpleMailMessage message = new SimpleMailMessage();
                message.setTo(user.getEmail());
                message.setSubject("New Job Posted - " + job.getTitle());
                message.setText(
                        "Hello " + user.getFullName() + ",\n\n" +
                        "A new job has been posted on Amentrop.\n\n" +
                        "Job Title: " + job.getTitle() + "\n" +
                        "Company: " + job.getCompanyName() + "\n" +
                        "Location: " + job.getLocation() + "\n" +
                        "Domain: " + job.getDomain() + "\n\n" +
                        "Please login to your account to view details and apply.\n\n" +
                        "Regards,\nAmentrop Team"
                );

                mailSender.send(message);

            } catch (Exception e) {
                System.out.println("Mail failed for: " + user.getEmail() + " - " + e.getMessage());
            }
        }
    }
}