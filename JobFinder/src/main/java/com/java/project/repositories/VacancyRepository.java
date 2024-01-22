package com.java.project.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.java.project.models.City;
import com.java.project.models.Vacancy;
import com.java.project.models.WorkCategory;
@Repository
public interface VacancyRepository extends CrudRepository<Vacancy, Long> {
	List<Vacancy> findByCityAndWorkCategoriesAndDescriptionContains(City city, WorkCategory category, String search);
	List<Vacancy> findByCity(City city);
	List<Vacancy> findByWorkCategories(WorkCategory category);

}
