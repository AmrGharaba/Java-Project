package com.java.project.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.java.project.models.City;
import com.java.project.models.Company;
import com.java.project.models.LoginCompany;
import com.java.project.models.LoginUser;
import com.java.project.models.User;
import com.java.project.models.WorkCategory;
import com.java.project.services.CityService;
import com.java.project.services.CompanyService;
import com.java.project.services.UserService;
import com.java.project.services.WorkCategoryService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller	
public class MainController {
	@Autowired
	private UserService userService;
	@Autowired
	private CompanyService companyService;
	@Autowired
	private CityService cityService;
	@Autowired
	private WorkCategoryService workCategoryService;
	
	
	
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
			if(newUser.getAccessLevel() == 1) {
				return "redirect:/admin/dashboard";
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
			
			if(user.getAccessLevel() == 1) {
				return "redirect:/admin/dashboard";
			}

			return "redirect:/user/dashBoard.jsp";
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

	///////////// end of company login and registration	
	
	//////////// Admin dashboard
	
	@GetMapping("/admin/dashboard")
	public String adminDashboard(Model model, HttpSession session) {
		Long loginId = (Long)session.getAttribute("loginId");
		List<City> cities = cityService.listCities();
		List<User> users = userService.listOtherUsers(loginId);
		List<Company> companies = companyService.listCompanies();
		List<WorkCategory> workCategories = workCategoryService.listWorkCategories();
		model.addAttribute("newCity", new City());
		model.addAttribute("newCategory", new WorkCategory());
		model.addAttribute("cities", cities);
		model.addAttribute("users", users);
		model.addAttribute("companies", companies);
		model.addAttribute("workCategories", workCategories);
		return "admin/dashboard.jsp";
	}
	
	@PostMapping("/admin/dashboard/addCity")
	public String addCity(@ModelAttribute("newCity") City city) {
		cityService.addCity(city);
		return "redirect:/admin/dashboard";
		
	}
	
	@PostMapping("/admin/dashboard/addCategory")
	public String addCategory(@ModelAttribute("newCategory") WorkCategory newCategory) {
		workCategoryService.addCategory(newCategory);
		return "redirect:/admin/dashboard";
		
	}
	
	
	
	
	

}
