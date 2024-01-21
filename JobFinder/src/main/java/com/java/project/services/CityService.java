package com.java.project.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.project.models.City;
import com.java.project.repositories.CityRepository;

@Service
public class CityService {
	@Autowired
	private CityRepository cityRepository;
	
	public void addCity(City city) {
		cityRepository.save(city);
	}
	public List<City> listCities(){
		return cityRepository.findAll();
	}
}
