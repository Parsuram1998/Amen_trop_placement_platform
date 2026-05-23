package in.sp.main.Repositories;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import in.sp.main.Entities.TPO;

public interface TPORepository extends JpaRepository<TPO, Long> {

    TPO findByEmailAndPassword(String email, String password);
    TPO findByResetToken(String token);
    List<TPO> findByCollegeId(Long collegeId);
    Page<TPO> findByCollegeId(
            Long collegeId,
            Pageable pageable
    );
}