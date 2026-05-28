package in.sp.main.Entities;

import java.time.LocalDate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class Drive {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String companyName;
    private String role;
    private double salary;

    @Column(length = 2000)
    private String aboutCompany;

    private String rounds;
    private boolean bondApplicable;
    private String skills;

    private double tenthCriteria;
    private double twelfthCriteria;
    private double degreeCriteria;

    private LocalDate driveDate;

    private String status; // ONGOING / ENDED

    @ManyToOne
    @JoinColumn(name = "college_id")
    private College college;

  private String companyLocation;
    
	public String getCompanyLocation() {
	return companyLocation;
}

public void setCompanyLocation(String companyLocation) {
	this.companyLocation = companyLocation;
}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public double getSalary() {
		return salary;
	}

	public void setSalary(double salary) {
		this.salary = salary;
	}

	public String getAboutCompany() {
		return aboutCompany;
	}

	public void setAboutCompany(String aboutCompany) {
		this.aboutCompany = aboutCompany;
	}

	public String getRounds() {
		return rounds;
	}

	public void setRounds(String rounds) {
		this.rounds = rounds;
	}

	public boolean isBondApplicable() {
		return bondApplicable;
	}

	public void setBondApplicable(boolean bondApplicable) {
		this.bondApplicable = bondApplicable;
	}

	public String getSkills() {
		return skills;
	}

	public void setSkills(String skills) {
		this.skills = skills;
	}

	public double getTenthCriteria() {
		return tenthCriteria;
	}

	public void setTenthCriteria(double tenthCriteria) {
		this.tenthCriteria = tenthCriteria;
	}

	public double getTwelfthCriteria() {
		return twelfthCriteria;
	}

	public void setTwelfthCriteria(double twelfthCriteria) {
		this.twelfthCriteria = twelfthCriteria;
	}

	public double getDegreeCriteria() {
		return degreeCriteria;
	}

	public void setDegreeCriteria(double degreeCriteria) {
		this.degreeCriteria = degreeCriteria;
	}

	public LocalDate getDriveDate() {
		return driveDate;
	}

	public void setDriveDate(LocalDate driveDate) {
		this.driveDate = driveDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public College getCollege() {
		return college;
	}

	public void setCollege(College college) {
		this.college = college;
	}

    
}