package in.sp.main.Repositories;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import in.sp.main.Entities.Drive;

public interface DriveRepository extends JpaRepository<Drive, Long> {

    List<Drive> findByCollegeId(Long collegeId);
    List<Drive> findByCollegeIdAndDriveDateBetween(
            Long collegeId,
            LocalDate start,
            LocalDate end
    );
    long countByCollegeId(Long collegeId);
    Page<Drive> findByCollegeId(
            Long collegeId,
            Pageable pageable
    );
    Page<Drive> findByCollegeIdAndDriveDateBetween(
            Long collegeId,
            LocalDate startDate,
            LocalDate endDate,
            Pageable pageable
    );
}