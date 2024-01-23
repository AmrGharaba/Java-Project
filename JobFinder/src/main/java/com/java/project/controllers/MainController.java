package com.java.project.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.java.project.models.City;
import com.java.project.models.Company;
import com.java.project.models.LoginCompany;
import com.java.project.models.LoginUser;
import com.java.project.models.User;
import com.java.project.models.Vacancy;
import com.java.project.models.WorkCategory;
import com.java.project.services.CityService;
import com.java.project.services.CompanyService;
import com.java.project.services.UserService;
import com.java.project.services.VacancyService;
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
	@Autowired
	private VacancyService vacancyService;
	
	
	
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

			return "redirect:/";
		}

	}
	
	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("user") LoginUser newLogin, BindingResult result, Model model,
			HttpSession session) {

		// Add once service is implemented:
		User user = userService.login(newLogin, result);

		if (result.hasErrors()) {
			model.addAttribute("newUser", new User());

			return "login.jsp";
		} else {
			session.setAttribute("loginId", user.getId());
			
			if(user.getAccessLevel() == 1) {
				return "redirect:/admin/dashboard";
			}

			return "redirect:/";

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

			return "redirect:/companyDashboard";
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

			return "redirect:/companyDashboard";
		}
	}
	///////////// end of company login and registration	
	
	////////// user dashboard
	
	@GetMapping("/")
	public String index(HttpSession session, Model model) {
		List<City> cities = cityService.listCities();
		List<WorkCategory> categories = workCategoryService.listWorkCategories();
		List<Vacancy> vacancies = vacancyService.listVacancy();
		
		if(session.getAttribute("loginId") == null) {
			return "redirect:/login";
		}
		User user = userService.find_User((Long)session.getAttribute("loginId"));
		
		model.addAttribute("cities", cities);
		model.addAttribute("categories", categories);
		model.addAttribute("vacancyFilter", new Vacancy());
		model.addAttribute("user", user);
		model.addAttribute("vacancies", vacancies);
		return "user/dashboard.jsp";
	}
//////////user dashboard
	
	/////////////// vacancy filter for user dashboard
	@PostMapping("/vacancy/filter")
	public String vacancyFilter(@ModelAttribute("vacancyFilter") Vacancy vacancyFilter, HttpSession session,Model model,
			@RequestParam(value="categoryId") Long categoryId) {
		WorkCategory category = workCategoryService.findWorkCategory(categoryId);
//		List<Vacancy> vacancies = vacancyService.findByCategory(category);
		
		List<Vacancy> vacancies = vacancyService.filterVacancies(vacancyFilter, category);
		System.out.println(vacancies);
		
		System.out.println(category.getTitle());
		System.out.println(vacancyFilter.getDescription());
		System.out.println(vacancyFilter.getCity().getName());
//		System.out.println(vacancyFilter.getWorkCategories());
		
		
		
		
		
		List<City> cities = cityService.listCities();
		List<WorkCategory> categories = workCategoryService.listWorkCategories();
		model.addAttribute("cities", cities);
		model.addAttribute("categories", categories);
		model.addAttribute("vacancies", vacancies);
//		model.addAttribute("vacancyFilter", vacancies);
		return "user/dashboard.jsp";
		
	}
	
	
/////////////// vacancy filter for user dashboard


	
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
	
	@GetMapping("/companyDashboard")
	public String cdashboard(HttpSession session, Model model) {
		List<WorkCategory> categories = workCategoryService.listWorkCategories();
		Long comapanyId = (Long) session.getAttribute("loginId");
		Company company = companyService.find_Company(comapanyId);
		List<City> cities = cityService.listCities();
		List<Vacancy> vacancies = company.getVacancies();
		model.addAttribute("company",company);
		model.addAttribute("categories", categories);
		model.addAttribute("cities", cities);
		model.addAttribute("newVacancy", new Vacancy());
		model.addAttribute("company", company);
		model.addAttribute("vacancies", vacancies);
		return "companydashboard.jsp";
	}
	
	@PostMapping("/submitVacancy")
	public String createVacancy(HttpSession session, Model model, @RequestParam(value = "selected") String[] categories, 
			@ModelAttribute("newVacancy") Vacancy newVacancy) {
		vacancyService.saveVacancy(newVacancy);
		Vacancy vacancy = vacancyService.findVacancy(newVacancy.getId());
		for(String categoryId : categories) {
			
			Long id = Long.parseLong(categoryId);
			WorkCategory category = workCategoryService.findWorkCategory(id);
			workCategoryService.addVacancy(category, vacancy);
		}
		
		return "redirect:/companyDashboard";
		
	}
	
	
	
	
	@GetMapping("/contactus")
	public String contactus() {
		return "contactus.jsp";
	}
	
	@GetMapping("/vacancy")
	public String vacancy() {
		return "companydashboard.jsp";
	}
	
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login";
	}
	
	@GetMapping("/aboutus")
	public String aboutus() {
		return "about.jsp";
	}
	
	@GetMapping("/fetchvacancy")
	public String getVacancyTofiller(@RequestParam("category") String category,Model model,HttpSession session) {
		System.out.println("Helllo"+ category);
		Long userId = (Long) session.getAttribute("loginId");
		User user = userService.find_User(userId);
		if (category.equals("All")) {
			List<Vacancy> vacancy = vacancyService.listVacancy();
			model.addAttribute("vacancies",vacancy);
			model.addAttribute("user", user);
			return "updatedCard/card.jsp";
		}
		else {
			System.out.println("***********************************");
			List<Vacancy> vacancy = vacancyService.filterdVacancy(category);
			model.addAttribute("vacancies",vacancy);
			System.out.println(vacancy);
			model.addAttribute("user", user);
			return "updatedCard/card.jsp";
		}
//		System.out.println("***********************************");
//		List<Vacancy> vacancy = vacancyService.filterdVacancy(category);
//		model.addAttribute("vacancies",vacancy);
//		System.out.println(vacancy);		
	
	}
	
	@GetMapping("/apply/{id}")
	public String applyJob(@PathVariable("id") Long id, HttpSession session) {
		Long userId = (Long) session.getAttribute("loginId");
		User user = userService.find_User(userId);
		Vacancy vacancy = vacancyService.findVacancy(id);
		System.out.println(vacancy.getName());
		System.out.println(user.getFirstName());
		userService.addJob(vacancy, user);
		System.out.println(user.getVacancies().contains(vacancy));
		return "redirect:/";
	}
	

}
