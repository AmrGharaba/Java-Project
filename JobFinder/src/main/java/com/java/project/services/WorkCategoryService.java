package com.java.project.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.project.models.Vacancy;
import com.java.project.models.WorkCategory;
import com.java.project.repositories.WorkCategoryRepository;

@Service
public class WorkCategoryService {
	@Autowired
	private WorkCategoryRepository workCategoryRepository;
	
	public WorkCategory findWorkCategory(Long id) {
		WorkCategory workCategory = workCategoryRepository.findById(id).get();
		return workCategory;
	}
	public List<WorkCategory> listWorkCategories(){
		return workCategoryRepository.findAll();
	}
	public void addCategory(WorkCategory newCategory) {
		workCategoryRepository.save(newCategory);
	}
	public void addVacancy(WorkCategory category, Vacancy vacancy) {
		category.getVacancies().add(vacancy);
		workCategoryRepository.save(category);
		
	}
}
