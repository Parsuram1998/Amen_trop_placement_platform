package in.sp.main.Repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import in.sp.main.Entities.Job;

public interface JobRepository extends JpaRepository<Job,Long>{

	@Query("SELECT j FROM Job j WHERE UPPER(j.jobType) IN :types")
	List<Job> findByJobTypeInIgnoreCase(List<String> types);
	
	 boolean existsByTitleAndCompanyNameAndLocation(
	            String title,
	            String companyName,
	            String location);
	 long countByJobTypeIn(List<String> jobTypes);

}