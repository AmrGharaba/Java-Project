package com.java.project.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.java.project.models.City;
@Repository
public interface CityRepository extends CrudRepository<City, Long> {
	List<City> findAll();

}
