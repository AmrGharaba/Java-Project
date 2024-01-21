package com.java.project.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.java.project.models.User;

@Repository
public interface UserRepository extends CrudRepository<User, Long> {
	
	Optional<User> findByEmail(String email);
	Optional<User> findFirstByOrderByIdDesc();
	List<User> findByAccessLevelIsNull();
	List<User> findByAccessLevelEquals(int i);
	List<User> findByIdIsNot(Long j);


}
