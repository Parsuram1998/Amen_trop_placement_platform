package in.sp.main.Repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import in.sp.main.Entities.User;
import in.sp.main.Enums.Role;

public interface UserRepository extends JpaRepository<User, Long> {

    Optional<User> findByEmail(String email);

    Optional<User> findByPhone(String phone);
    List<User> findByRole(Role role);
    List<User> findByProfileActiveTrue();
	List<User> findByRoleIn(List<Role> asList);
}
