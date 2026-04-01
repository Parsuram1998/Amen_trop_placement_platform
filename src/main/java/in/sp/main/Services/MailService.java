package in.sp.main.Services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import in.sp.main.Entities.Job;
import in.sp.main.Entities.User;
import in.sp.main.Enums.Role;
import in.sp.main.Repositories.UserRepository;

@Service
public class MailService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private JavaMailSender mailSender;   // ⭐ THIS WAS MISSING

    public void sendJobNotification(Job job){

        List<User> users = userRepository.findAll();

        for(User u : users){

            if(u.getRole() == Role.FRESHER || u.getRole() == Role.PROFESSIONAL){

                SimpleMailMessage msg = new SimpleMailMessage();

                msg.setTo(u.getEmail());
                msg.setSubject("New Job Posted");

                msg.setText(
                "New Job: "+job.getTitle()+"\n"+
                "Company: "+job.getCompanyName());

                mailSender.send(msg);
            }
        }
    }
}