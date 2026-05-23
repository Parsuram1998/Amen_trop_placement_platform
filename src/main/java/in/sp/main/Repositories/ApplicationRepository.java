package in.sp.main.Repositories;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import in.sp.main.Entities.Application;

public interface ApplicationRepository extends JpaRepository<Application, Long> {

    boolean existsByStudentIdAndDriveId(Long studentId, Long driveId);

    List<Application> findByStudentId(Long studentId);
    List<Application> findByDriveId(Long driveId);
    List<Application> findByDriveIdAndStatus(Long driveId, String status);
    long countByStudentId(Long studentId);
    long countByDriveId(Long driveId);
    long count();
    Page<Application> findByDriveId(
            Long driveId,
            Pageable pageable
    );
    Page<Application> findByDriveIdAndStatus(
            Long driveId,
            String status,
            Pageable pageable
    );
}