package com.java.project.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.project.models.Vacancy;
import com.java.project.models.WorkCategory;
import com.java.project.repositories.VacancyRepository;

@Service
public class VacancyService {
	@Autowired
	private VacancyRepository vacancyRepository;
	
	
	public Vacancy findVacancy(Long id) {
		Vacancy vacancy = vacancyRepository.findById(id).get();
		return vacancy;
	}
	
	public List<Vacancy> filterVacancies(Vacancy vacancyFilter, WorkCategory category){

		List<Vacancy> vacancies = vacancyRepository.findByCityAndWorkCategoriesAndDescriptionContains(vacancyFilter.getCity(), category, vacancyFilter.getDescription());
		return vacancies;
		
	}

}
