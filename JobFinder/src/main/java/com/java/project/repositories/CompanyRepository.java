package com.java.project.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.java.project.models.Company;

@Repository
public interface CompanyRepository extends CrudRepository<Company, Long> {
	Optional<Company> findByEmail(String email);
	List<Company> findAll();
}
