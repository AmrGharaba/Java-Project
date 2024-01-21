package com.java.project.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.java.project.models.Vacancy;
@Repository
public interface VacancyRepository extends CrudRepository<Vacancy, Long> {

}
