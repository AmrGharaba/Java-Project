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

		if(vacancyFilter.getCity() == null) {
			
			List<Vacancy> vacancies = vacancyRepository.findByWorkCategories(category);
			return vacancies;
		}
		else if(category == null) {
			List<Vacancy> vacancies = vacancyRepository.findByCity(null);
			return vacancies;
			
		}
		else if(vacancyFilter.getCity() != null && category != null ){
			List<Vacancy> vacancies = vacancyRepository.findByCityAndWorkCategoriesAndDescriptionContains(vacancyFilter.getCity(), category, vacancyFilter.getDescription());
			return vacancies;
		}
		List<Vacancy> vacancies = vacancyRepository.findAll();
		return vacancies;
		}
	public List<Vacancy> findByCategory(WorkCategory category){
		List<Vacancy> vacancies = vacancyRepository.findByWorkCategories(category);
		return vacancies;
		
	}
		
		
		

	public void saveVacancy(Vacancy vacancy) {
		vacancyRepository.save(vacancy);
	}
	
	 public List<Vacancy> listVacancy(){
	    	return vacancyRepository.findAll();
	    }
	 
	 public  List<Vacancy> filterdVacancy(String categoryTitle) {
		return vacancyRepository.findByWorkCategoriesTitle(categoryTitle);
	}



}
