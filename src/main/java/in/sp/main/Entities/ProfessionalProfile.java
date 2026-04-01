package in.sp.main.Entities;

import jakarta.persistence.*;

@Entity
@Table(name="professional_profiles")
public class ProfessionalProfile {

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;

    @OneToOne
    @JoinColumn(name="user_id")
    private User user;

    private int experienceYears;

    @Column(name = "current_job_role")
    private String currentRole;

    private Double currentCtc;

    private Double expectedCtc;

    private String domainLooking;

    private String skillSet;

    private String resumePath;

    private String linkedIn;

    private String portfolio;

    private String preferredLocations;

    private String noticePeriod;

    private String companyName;

    private String companyLocation;

    private Boolean verified;
    
    private Boolean isApproved = false;
    private Boolean isActive = true;

    private Long lockedByHrId; // null = free
    
    

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

	public int getExperienceYears() {
		return experienceYears;
	}

	public void setExperienceYears(int experienceYears) {
		this.experienceYears = experienceYears;
	}

	public String getCurrentRole() {
		return currentRole;
	}

	public void setCurrentRole(String currentRole) {
		this.currentRole = currentRole;
	}

	public Double getCurrentCtc() {
		return currentCtc;
	}

	public void setCurrentCtc(Double currentCtc) {
		this.currentCtc = currentCtc;
	}

	public Double getExpectedCtc() {
		return expectedCtc;
	}

	public void setExpectedCtc(Double expectedCtc) {
		this.expectedCtc = expectedCtc;
	}

	public String getDomainLooking() {
		return domainLooking;
	}

	public void setDomainLooking(String domainLooking) {
		this.domainLooking = domainLooking;
	}

	public String getSkillSet() {
		return skillSet;
	}

	public void setSkillSet(String skillSet) {
		this.skillSet = skillSet;
	}

	public String getResumePath() {
		return resumePath;
	}

	public void setResumePath(String resumePath) {
		this.resumePath = resumePath;
	}

	public String getLinkedIn() {
		return linkedIn;
	}

	public void setLinkedIn(String linkedIn) {
		this.linkedIn = linkedIn;
	}

	public String getPortfolio() {
		return portfolio;
	}

	public void setPortfolio(String portfolio) {
		this.portfolio = portfolio;
	}

	public String getPreferredLocations() {
		return preferredLocations;
	}

	public void setPreferredLocations(String preferredLocations) {
		this.preferredLocations = preferredLocations;
	}

	public String getNoticePeriod() {
		return noticePeriod;
	}

	public void setNoticePeriod(String noticePeriod) {
		this.noticePeriod = noticePeriod;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getCompanyLocation() {
		return companyLocation;
	}

	public void setCompanyLocation(String companyLocation) {
		this.companyLocation = companyLocation;
	}

	public boolean isVerified() {
		return verified;
	}

	public void setVerified(boolean verified) {
		this.verified = verified;
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
    
}