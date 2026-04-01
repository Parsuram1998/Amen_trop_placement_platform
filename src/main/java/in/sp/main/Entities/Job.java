package in.sp.main.Entities;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name="jobs")
public class Job {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String title;

    private String companyName;

    private String location;

    private String domain;

    private String description;

    private String eligibility;

    private int minExperience;

    private double minPercentage;

    private Boolean strictApply;
    
    @Column(name="job_type")
    private String jobType;
    
    @Column(name = "bond_required")
    private Boolean bondRequired;

    private LocalDateTime createdAt;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getEligibility() {
		return eligibility;
	}

	public void setEligibility(String eligibility) {
		this.eligibility = eligibility;
	}

	public int getMinExperience() {
		return minExperience;
	}

	public void setMinExperience(int minExperience) {
		this.minExperience = minExperience;
	}

	public double getMinPercentage() {
		return minPercentage;
	}

	public void setMinPercentage(double minPercentage) {
		this.minPercentage = minPercentage;
	}

	public boolean isStrictApply() {
		return strictApply;
	}

	public void setStrictApply(boolean strictApply) {
		this.strictApply = strictApply;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}

	public String getJobType() {
		return jobType;
	}

	public void setJobType(String jobType) {
		this.jobType = jobType;
	}

	public boolean isBondRequired() {
		return bondRequired;
	}

	public void setBondRequired(boolean bondRequired) {
		this.bondRequired = bondRequired;
	}

  
    
    
}