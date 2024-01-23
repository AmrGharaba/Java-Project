package com.java.project.models;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;
@Entity
@Table(name="vacancies")
public class Vacancy {
	
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @NotEmpty(message="Name is required!")
    @Size(min=3, max=30, message="Title must be between 3 and 30 characters")
    private String name;
    
	@NotEmpty(message = "please Type")
	@Size(min = 1)
	@Column(columnDefinition="TEXT")
    private String description;
	
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "company_id")
	private Company company;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "city_id")
	private City city;
    
    @ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(
	        name = "vacancy_users", 
	        joinColumns = @JoinColumn(name = "vacancy_id"), 
	        inverseJoinColumns = @JoinColumn(name = "user_id")
			)
	private List<User> users;

    

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(
	        name = "vacancy_workCategories", 
	        joinColumns = @JoinColumn(name = "vacancy_id"), 
	        inverseJoinColumns = @JoinColumn(name = "workCategory_id")
			)
	private List<WorkCategory> workCategories;
	
    // This will not allow the createdAt column to be updated after creation
    @Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;
    
	public Vacancy() {}
	
    
    @PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}







	public List<User> getUsers() {
		return users;
	}


	public void setUsers(List<User> users) {
		this.users = users;
	}


	public List<WorkCategory> getWorkCategories() {
		return workCategories;
	}


	public void setWorkCategories(List<WorkCategory> workCategories) {
		this.workCategories = workCategories;
	}


	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public City getCity() {
		return city;
	}

	public void setCity(City city) {
		this.city = city;
	}
	

	
	
    
    

}
