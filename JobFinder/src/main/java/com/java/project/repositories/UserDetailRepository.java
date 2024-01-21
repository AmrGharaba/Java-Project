package com.java.project.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.java.project.models.UserDetail;

@Repository
public interface UserDetailRepository extends CrudRepository<UserDetail, Long> {

}
