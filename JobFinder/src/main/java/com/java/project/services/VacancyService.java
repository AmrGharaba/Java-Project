package com.java.project.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.project.models.Company;
import com.java.project.models.Vacancy;
import com.java.project.repositories.VacancyRepository;
@Service
public class VacancyService {
	
	@Autowired 
	private VacancyRepository vacancyRepository;
	
	
	 public List<Vacancy> listVacancy(){
	    	return vacancyRepository.findAll();
	    }
	 
	 public  List<Vacancy> filterdVacancy(String categoryTitle) {
		return vacancyRepository.findByWorkCategoriesTitle(categoryTitle);
	}
}
