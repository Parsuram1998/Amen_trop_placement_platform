package in.sp.main.Entities;

import in.sp.main.Enums.FresherStatus;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "fresher_profiles")
public class FresherProfile {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne
    @JoinColumn(name = "user_id", nullable = false, unique = true)
    private User user;

    private String skillSet;
    private String domainInterested;

    private Double tenthPercentage;
    private Double twelfthPercentage;
    private Double degreePercentage;

    private String preferredLocations; // store comma separated

    private boolean readyForBond;

    private String resumePath;
    private String videoResumePath;
    private String photoPath;
    private String aadharPath;

    @Enumerated(EnumType.STRING)
    private FresherStatus status;  // SELECTED / IN_PROGRESS

    @Column(name = "certificate_path")
    private String certificatePath;

    @Column(name = "certificate_approved")
    private Boolean certificateApproved;
    
    private Boolean isApproved = false;
    private Boolean isActive = true;

    private Long lockedByHrId; 
    
   
    
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getSkillSet() {
		return skillSet;
	}

	public void setSkillSet(String skillSet) {
		this.skillSet = skillSet;
	}

	public String getDomainInterested() {
		return domainInterested;
	}

	public void setDomainInterested(String domainInterested) {
		this.domainInterested = domainInterested;
	}

	public Double getTenthPercentage() {
		return tenthPercentage;
	}

	public void setTenthPercentage(Double tenthPercentage) {
		this.tenthPercentage = tenthPercentage;
	}

	public Double getTwelfthPercentage() {
		return twelfthPercentage;
	}

	public void setTwelfthPercentage(Double twelfthPercentage) {
		this.twelfthPercentage = twelfthPercentage;
	}

	public Double getDegreePercentage() {
		return degreePercentage;
	}

	public void setDegreePercentage(Double degreePercentage) {
		this.degreePercentage = degreePercentage;
	}

	public String getPreferredLocations() {
		return preferredLocations;
	}

	public void setPreferredLocations(String preferredLocations) {
		this.preferredLocations = preferredLocations;
	}

	public boolean isReadyForBond() {
		return readyForBond;
	}

	public void setReadyForBond(boolean readyForBond) {
		this.readyForBond = readyForBond;
	}

	public String getResumePath() {
		return resumePath;
	}

	public void setResumePath(String resumePath) {
		this.resumePath = resumePath;
	}

	public String getVideoResumePath() {
		return videoResumePath;
	}

	public void setVideoResumePath(String videoResumePath) {
		this.videoResumePath = videoResumePath;
	}

	public String getPhotoPath() {
		return photoPath;
	}

	public void setPhotoPath(String photoPath) {
		this.photoPath = photoPath;
	}

	public String getAadharPath() {
		return aadharPath;
	}

	public void setAadharPath(String aadharPath) {
		this.aadharPath = aadharPath;
	}

	public FresherStatus getStatus() {
		return status;
	}

	public void setStatus(FresherStatus status) {
		this.status = status;
	}

	public String getCertificatePath() {
		return certificatePath;
	}

	public void setCertificatePath(String certificatePath) {
		this.certificatePath = certificatePath;
	}

	public boolean isCertificateApproved() {
	    return certificateApproved;
	}

	public void setCertificateApproved(boolean certificateApproved) {
		this.certificateApproved = certificateApproved;
	}



	public boolean isApproved() {
		return isApproved;
	}

	public void setApproved(boolean isApproved) {
		this.isApproved = isApproved;
	}

	public boolean isActive() {
		return isActive;
	}

	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}

	public Long getLockedByHrId() {
		return lockedByHrId;
	}

	public void setLockedByHrId(Long lockedByHrId) {
		this.lockedByHrId = lockedByHrId;
	}

	public Boolean getCertificateApproved() {
		return certificateApproved;
	}

	public void setCertificateApproved(Boolean certificateApproved) {
		this.certificateApproved = certificateApproved;
	}

	public Boolean getIsApproved() {
		return isApproved;
	}

	public void setIsApproved(Boolean isApproved) {
		this.isApproved = isApproved;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}

    // getters and setters
    
    
}