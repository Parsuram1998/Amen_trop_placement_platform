package in.sp.main.Repositories;

import java.util.Optional;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import in.sp.main.Entities.*;

public interface HrCandidateSelectionRepository extends JpaRepository<HrCandidateSelection, Long> {

    Optional<HrCandidateSelection> findByCandidate(User candidate);

    List<HrCandidateSelection> findByHr(User hr);

}