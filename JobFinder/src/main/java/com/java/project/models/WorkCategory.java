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
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;
@Entity
@Table(name="workCategories")
public class WorkCategory {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @NotEmpty(message="Title is required!")
    @Size(min=3, max=30, message="Title must be between 3 and 30 characters")
    private String title;
	
	
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(
	        name = "users_workCategories", 
	        joinColumns = @JoinColumn(name = "workCategory_id"), 
	        inverseJoinColumns = @JoinColumn(name = "user_id")
			)
	private List<User> users;	
	
	
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(
	        name = "companies_workCategories", 
	        joinColumns = @JoinColumn(name = "workCategory_id"), 
	        inverseJoinColumns = @JoinColumn(name = "company_id")
			)
	private List<Company> companies;
	
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(
	        name = "vacancy_workCategories", 
	        joinColumns = @JoinColumn(name = "workCategory_id"), 
	        inverseJoinColumns = @JoinColumn(name = "vacancy_id")
			)
	private List<Vacancy> vacancies;
	
    // This will not allow the createdAt column to be updated after creation
    @Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;
    
    
	public WorkCategory() {}
	
    
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


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public List<User> getUsers() {
		return users;
	}


	public void setUsers(List<User> users) {
		this.users = users;
	}


	public List<Company> getCompanies() {
		return companies;
	}


	public void setCompanies(List<Company> companies) {
		this.companies = companies;
	}


	public List<Vacancy> getVacancies() {
		return vacancies;
	}


	public void setVacancies(List<Vacancy> vacancies) {
		this.vacancies = vacancies;
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
	
	
	
    
    

}
