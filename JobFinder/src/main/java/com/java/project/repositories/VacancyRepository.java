package com.java.project.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.java.project.models.Company;
import com.java.project.models.Vacancy;
import com.java.project.models.WorkCategory;

@Repository
public interface VacancyRepository extends CrudRepository<Vacancy, Long> {

	List<Vacancy> findAll();
	List<Vacancy> findByWorkCategoriesTitle(String categoryTitle);
}
