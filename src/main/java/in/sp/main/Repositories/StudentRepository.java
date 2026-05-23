package in.sp.main.Repositories;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import in.sp.main.Entities.Student;

public interface StudentRepository extends JpaRepository<Student, Long> {

    Student findByEmailAndPassword(String email, String password);
    Student findByResetToken(String token);
    long countByCollegeId(Long collegeId);
	Student findByEmail(String email);
	Page<Student> findByCollegeId(
	        Long collegeId,
	        Pageable pageable
	);
	Page<Student>
	findByCollegeIdAndNameContainingIgnoreCaseOrCollegeIdAndUsnContainingIgnoreCaseOrCollegeIdAndEmailContainingIgnoreCaseOrCollegeIdAndPhoneContainingIgnoreCaseOrCollegeIdAndBranchContainingIgnoreCase(

	        Long collegeId1,
	        String name, Long collegeId2,
	        String usn,
	        Long collegeId3,
	        String email,
	        Long collegeId4,
	        String phone,
	        Long collegeId5,
	        String branch,
	        Pageable pageable
	);
}
