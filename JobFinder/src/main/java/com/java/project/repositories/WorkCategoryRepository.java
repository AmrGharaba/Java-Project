package com.java.project.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.java.project.models.WorkCategory;
@Repository
public interface WorkCategoryRepository extends CrudRepository<WorkCategory, Long> {

}
