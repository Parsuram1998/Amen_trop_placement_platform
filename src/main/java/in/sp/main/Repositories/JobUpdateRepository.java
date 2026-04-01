package in.sp.main.Repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import in.sp.main.Entities.Job;
import in.sp.main.Entities.JobUpdate;

public interface JobUpdateRepository extends JpaRepository<JobUpdate, Long> {

    List<JobUpdate> findByJob(Job job);

}