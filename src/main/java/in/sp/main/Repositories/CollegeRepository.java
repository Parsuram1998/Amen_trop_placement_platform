package in.sp.main.Repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import in.sp.main.Entities.College;

public interface CollegeRepository extends JpaRepository<College, Long> {}
