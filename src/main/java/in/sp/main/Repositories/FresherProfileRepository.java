package in.sp.main.Repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import in.sp.main.Entities.FresherProfile;
import in.sp.main.Entities.User;
import in.sp.main.Enums.FresherStatus;

public interface FresherProfileRepository extends JpaRepository<FresherProfile, Long> {

    Optional<FresherProfile> findByUser(User user);
    
    Page<FresherProfile> findAll(Pageable pageable);

    Page<FresherProfile> findByStatus(FresherStatus status, Pageable pageable);
    
    long countByStatus(FresherStatus status);
    
    @Query("SELECT c FROM FresherProfile c WHERE c.isApproved = true AND c.isActive = true AND (c.lockedByHrId IS NULL OR c.lockedByHrId = :hrId)")
    List<FresherProfile> findAvailableCandidates(@Param("hrId") Long hrId);
}