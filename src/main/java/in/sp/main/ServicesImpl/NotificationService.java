package in.sp.main.ServicesImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import in.sp.main.Entities.Notification;
import in.sp.main.Entities.User;
import in.sp.main.Repositories.NotificationRepository;

@Service
public class NotificationService {

    @Autowired
    private NotificationRepository repo;

    public void send(User user, String message){

        Notification n = new Notification();
        n.setReceiver(user);
        n.setMessage(message);
        n.setCreatedAt(java.time.LocalDateTime.now());

        repo.save(n);
    }
}