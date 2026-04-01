package in.sp.main.Repositories;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import in.sp.main.Entities.InternshipCertificate;
import in.sp.main.Entities.User;

public interface InternshipCertificateRepository extends JpaRepository<InternshipCertificate, Long> {

    Optional<InternshipCertificate> findByUser(User user);

}