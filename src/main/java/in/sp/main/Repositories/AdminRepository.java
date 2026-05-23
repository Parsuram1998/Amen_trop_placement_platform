package in.sp.main.Repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import in.sp.main.Entities.Admin;

public interface AdminRepository extends JpaRepository<Admin, Long> {

    Admin findByEmailAndPassword(String email, String password);

}