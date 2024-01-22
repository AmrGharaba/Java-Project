package com.java.project.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.java.project.models.Company;
import com.java.project.models.LoginCompany;
import com.java.project.models.LoginUser;
import com.java.project.models.User;
import com.java.project.services.CompanyService;
import com.java.project.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller	
public class MainController {
	@Autowired
	UserService userService;
	@Autowired
	CompanyService companyService;
	
	
	
	/////////// user login and registration
	@GetMapping("/login")
	public String login(Model model) {
		model.addAttribute("newUser", new User());
		model.addAttribute("user", new LoginUser());
		return "login.jsp";
	}
	
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("newUser") User newUser, BindingResult result, Model model,
			HttpSession session) {

		// TO-DO Later -- call a register method in the service
		// to do some extra validations and create a new user!
		userService.register(newUser, result);
		if (result.hasErrors()) {
			// Be sure to send in the empty LoginUser before
			// re-rendering the page.

			model.addAttribute("user", new LoginUser());
			return "login.jsp";
		} else {
			session.setAttribute("loginId", newUser.getId());
			
			if(userService.listAdmins().isEmpty()) {
				userService.setAdmin();
			}
			
			// No errors!
			// TO-DO Later: Store their ID from the DB in session,
			// in other words, log them in.

			return "redirect:/user/dashboard.jsp";
		}

	}
	
	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("user") LoginUser newLogin, BindingResult result, Model model,
			HttpSession session) {

		// Add once service is implemented:
		User user = userService.login(newLogin, result);

		if (result.hasErrors()) {
			model.addAttribute("newUser", new User());

			return "main.jsp";
		} else {
			session.setAttribute("loginId", user.getId());

			return "redirect:/user/dashboard.jsp";
		}
	}

	
	
	////////////// end of user login and registration
	
	///////////// company login and registration
	
	
	@GetMapping("/loginEmployer")
	public String companyLogin(Model model) {
		model.addAttribute("newCompany", new Company());
		model.addAttribute("company", new LoginCompany());
		return "loginEmployer.jsp";
	}
	
	@PostMapping("/companyRegister")
	public String companyRegister(@Valid @ModelAttribute("newCompany") Company newCompany, BindingResult result, Model model,
			HttpSession session) {

		// TO-DO Later -- call a register method in the service
		// to do some extra validations and create a new user!
		companyService.register(newCompany, result);
		if (result.hasErrors()) {
			// Be sure to send in the empty LoginUser before
			// re-rendering the page.

			model.addAttribute("company", new LoginCompany());
			return "loginEmployer.jsp";
		} else {
			session.setAttribute("loginId", newCompany.getId());
			
			// No errors!
			// TO-DO Later: Store their ID from the DB in session,
			// in other words, log them in.

			return "redirect:/company/dashboard.jsp";
		}

	}
	
	@PostMapping("/companyLogin")
	public String companyLogin(@Valid @ModelAttribute("company") LoginCompany newLogin, BindingResult result, Model model,
			HttpSession session) {

		// Add once service is implemented:
		Company company = companyService.login(newLogin, result);

		if (result.hasErrors()) {
			model.addAttribute("newCompany", new Company());

			return "loginEmployer.jsp";
		} else {
			session.setAttribute("loginId", company.getId());

			return "redirect:/company/dashboard.jsp";
		}
	}
	
	@GetMapping("/")
	public String index() {
		return "index.jsp";
	}

	
	
	
	
	
	

}
