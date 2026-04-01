package in.sp.main.Entities;

import in.sp.main.Enums.HrCandidateStatus;
import jakarta.persistence.*;

@Entity
public class HrCandidateSelection {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    private User hr;

    @ManyToOne
    private User candidate;

    @Enumerated(EnumType.STRING)
    private HrCandidateStatus status;
    
    @Column(length = 2000)
    private String feedback;

    private boolean locked; // 🔥 KEY FIELD

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public User getHr() {
		return hr;
	}

	public void setHr(User hr) {
		this.hr = hr;
	}

	public User getCandidate() {
		return candidate;
	}

	public void setCandidate(User candidate) {
		this.candidate = candidate;
	}

	public HrCandidateStatus getStatus() {
		return status;
	}

	public void setStatus(HrCandidateStatus status) {
		this.status = status;
	}

	public boolean isLocked() {
		return locked;
	}

	public void setLocked(boolean locked) {
		this.locked = locked;
	}

	public String getFeedback() {
		return feedback;
	}

	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}

    
}