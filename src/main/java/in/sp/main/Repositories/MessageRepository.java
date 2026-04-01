package in.sp.main.Repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import in.sp.main.Entities.Message;
import in.sp.main.Entities.User;

public interface MessageRepository extends JpaRepository<Message, Long> {

    List<Message> findByReceiver(User user);

}