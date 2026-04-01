package in.sp.main.Repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import in.sp.main.Entities.Job;
import in.sp.main.Entities.JobApplication;
import in.sp.main.Entities.User;

public interface JobApplicationRepository
        extends JpaRepository<JobApplication,Long>{

	boolean existsByJobAndUser(Job job, User user);
	List<JobApplication> findByJob(Job job);
	long countByUser(User user);
}