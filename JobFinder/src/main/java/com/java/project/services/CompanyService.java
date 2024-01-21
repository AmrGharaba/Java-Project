package com.java.project.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.java.project.models.Company;
import com.java.project.models.LoginCompany;
import com.java.project.repositories.CompanyRepository;
@Service
public class CompanyService {
	@Autowired
	private CompanyRepository companyRepository;
	
    // TO-DO: Write register and login methods!
    public Company register(Company newCompany, BindingResult result) {
    	String passwordEntered = newCompany.getPassword();
        // TO-DO: Additional validations!
    	if(!newCompany.getPassword().equals(newCompany.getConfirm())) {
    	    result.rejectValue("confirm", "Matches", "The Confirm Password must match Password!");
    	}
    	if(result.hasErrors()) {
    	    // Exit the method and go back to the controller 
    	    // to handle the response
    	    return null;
    	}
    	String hashed = BCrypt.hashpw(newCompany.getPassword(), BCrypt.gensalt());
    	newCompany.setPassword(hashed);


        return companyRepository.save(newCompany);
    }
    
    
    public Company login(LoginCompany newLoginObject, BindingResult result) {
    	Optional<Company> company = companyRepository.findByEmail(newLoginObject.getEmail());

    	String passwordEntered = newLoginObject.getPassword();
        // TO-DO - Reject values:
        
    	// Find Company in the DB by email
        // Reject if NOT present
    	if(!company.isPresent()) {
    	    result.rejectValue("email", "Exists", "email doesnt exist");
    	    return null;
    	}
    	else {
    		Company companyToLogin = company.get();

    		// Reject if BCrypt password match fails
        	if(!BCrypt.checkpw(passwordEntered,(String) companyToLogin.getPassword())) {
        	    result.rejectValue("password", "Matches", "Invalid Password!");
        	    return null;
        	}
    		
    	}
        // Return null if result has errors
        // Otherwise, return the company object
    	
        return company.get();
    }

    public Company find_Company(Long id) {
    	Optional<Company> findCompany = companyRepository.findById(id);
    	return findCompany.get();
    
    }
    
    
    
    
    
    
}
