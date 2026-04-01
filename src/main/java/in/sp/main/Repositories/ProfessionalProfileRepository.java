package in.sp.main.Repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import in.sp.main.Entities.FresherProfile;
import in.sp.main.Entities.ProfessionalProfile;
import in.sp.main.Entities.User;

public interface ProfessionalProfileRepository
extends JpaRepository<ProfessionalProfile,Long>{

    Optional<ProfessionalProfile> findByUser(User user);
    Page<ProfessionalProfile> findAll(Pageable pageable);
	List<ProfessionalProfile> findByVerifiedTrue();
	Object countByVerifiedTrue();
	
	 @Query("SELECT c FROM ProfessionalProfile c WHERE c.isApproved = true AND c.isActive = true AND (c.lockedByHrId IS NULL OR c.lockedByHrId = :hrId)")
	    List<ProfessionalProfile> findAvailableCandidates(@Param("hrId") Long hrId);

}