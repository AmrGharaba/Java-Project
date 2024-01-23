<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Formatting (dates) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/style/styleindex.css">
</head>

<body class="body">
	<header>
		<div class="container">
			<nav class="navbar navbar-expand-lg bg-body-tertiary">
				<div class="container-fluid">
					<a class="navbar-brand" href="/">JobFinder</a>

					<!-- Button for mobile navigation toggle -->
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarNav" aria-controls="navbarNav"
						aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>

					<!-- Navigation links -->
					<div class="collapse navbar-collapse" id="navbarNav">
						<ul class="navbar-nav ml-auto">
							<li class="nav-item"><a class="nav-link" href="/">Home</a></li>
							<li class="nav-item"><a class="nav-link" href="/contactus">Contact
									Us</a></li>
							<li class="nav-item"><a class="nav-link" href="/aboutus">About
									Us</a></li>
						</ul>
					</div>

					<div>
					  <a id="login" href="/login" class="btn"> Login</a>
					  <a id="login" href="/logout" class="btn"> LogOut</a>
					</div>
				</div>
			</nav>
		</div>
	</header>


	<!--  end Header -->





	<main>


		<section class="main-form">
			<div class="nested-card p-4">
				<h1>Wellcome ${company.name}</h1>
				<h3>add your Vacancies here!</h3>
			</div>
		</section>

		<form:form class="mx-auto text-center w-50 mb-5 mt-5"
			action="/submitVacancy" method="post" modelAttribute="newVacancy">
			<!-- Hidden field for ID (for update operation) -->
			<form:input type="hidden" path="company" value="${company.id}"></form:input>

			<div class="form-group">
				<!-- Vacancy Name -->
				<label for="name">Vacancy Name:</label>
				<form:input type="text" class="form-control" id="name" path="name"></form:input>
			</div>

			<div class="form-group">
				<!-- Description -->
				<label for="description">Description:</label>
				<form:textarea class="form-control" id="description"
					path="description" rows="4"></form:textarea>
			</div>

			<div class="form-group">
				<!-- City -->
				<label for="city">City:</label>
				<form:select class="form-control" id="city" path="city">
					<!-- Populate this dropdown with city options from your database -->
					<c:forEach var="city" items="${cities}">
						<form:option path="city" value="${city}">${city.name}</form:option>
					</c:forEach>
					<!-- Add more options as needed -->
				</form:select>
			</div>

			<div class="form-group">
				<!-- Work Categories -->
				<label class="col-form-label">Work Categories:</label>
				<div class="form-row">
					<!-- Populate this checkbox list with work category options from your database -->
					<c:forEach var="category" items="${categories}">
						<div class="form-check col-md-3">
							<input class="form-check-input" type="checkbox" id="category1"
								name="selected" value="${category.id}"> <label
								class="form-check-label" for="category1">${category.title}</label>
						</div>
					</c:forEach>

				</div>
			</div>

			<!-- Add more fields as needed -->

			<!-- Submit Button -->
			<button type="submit" class="btn btn-primary">Add Vacancy</button>
		</form:form>






		<section class="section-border m-1">
			<h3>Vacancy List</h3>
		</section>


		
	<div class="container-company d-flex mx-auto">
		<c:forEach var="vacancy" items="${vacancies}">
			<div class="col-auto">
			<div class="card-company">
				<div class="card-header">
					<img
						src="https://previews.123rf.com/images/arcady31/arcady311508/arcady31150800034/44235258-job-vacancy-rubber-stamp.jpg"
						alt="rover" />
				</div>
				<div class="card-body">
					<div class="d-flex">
						<c:forEach var="cat" items="${vacancy.workCategories}">
							<span class="tag tag-teal pr-1">${cat.title}</span>
						</c:forEach>
					</div>
					<h4>${vacancy.name}</h4>
					<p>${vacancy.description}</p>


					<p>
						<button class="btn btn-primary" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapse${vacancy.id}"
							aria-expanded="false" aria-controls="collapse${vacancy.id}">
							Toggle Applicants</button>
					</p>
					<div class="collapse" id="collapse${vacancy.id}">
						<div>
							<table class="table table-striped border">
								<c:forEach var="user" items="${vacancy.users}">
								<tr>
									<td>${user.id}</td>
									<td>${user.firstName} ${user.lastName}</td>	
								</tr>
								</c:forEach>
							</table>
							</div>
					</div>
				</div>
			</div>
			</div>
			
		</c:forEach>
	</div>
		
	</main>





<%-- 
	<section class="section-job w-75 mx-auto text-center mb-4">
			<h3 class="job-font">History of Vacancies</h3>
			<div class="row">
				<c:forEach var="vacancy" items="${vacancies}">
					<div class="col-sm-4 p-2">
						<div class="card">
							<div class="card-body">
								<h5 class="card-title">${vacancy.name}</h5>
								<p class="card-text">${vacancy.description}</p>
								<p>
									<button class="btn btn-primary" type="button"
										data-bs-toggle="collapse"
										data-bs-target="#collapse${vacancy.id}" aria-expanded="false"
										aria-controls="collapse${vacancy.id}">Toggle
										Applicants</button>
								</p>
								<div class="collapse" id="collapse${vacancy.id}">
									<div class="card card-body">Some placeholder content for
										the collapse component. This panel is hidden by default but
										revealed when the user activates the relevant trigger.</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>


			</div>
		</section> --%>





	<!-- Footer -->
	<footer
		class="text-center text-lg-start bg-body-tertiary footer-general">
		<!-- Section: Social media -->

		<!-- Section: Social media -->

		<!-- Section: Links  -->
		<section>
			<div class="container text-center text-md-start mt-5">
				<!-- Grid row -->
				<div class="row mt-3">
					<!-- Grid column -->
					<div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
						<!-- Content -->
						<h6 class="text-uppercase fw-bold mb-4 text-light">
							<i class="fas fa-gem me-3"></i>JobFinder
						</h6>
						<p class="text-light">We provide a user-friendly interface
							with advanced search features, empowering users to explore a
							diverse range of job listings.</p>
					</div>
					<!-- Grid column -->

					<!-- Grid column -->
					<div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
						<!-- Links -->
						<h6 class="text-uppercase text-light fw-bold mb-4">Site Map</h6>
						<p>
							<a href="#!" class="text-light">Home</a>
						</p>
						<p>
							<a href="#!" class="text-light">Log In</a>
						</p>
						<p>
							<a href="#!" class="text-light">About Us</a>
						</p>
						<p>
							<a href="#!" class="text-light">Contact Us</a>
						</p>
					</div>
					<!-- Grid column -->

					<!-- Grid column -->
					<div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
						<!-- Links -->
						<h6 class="text-uppercase fw-bold mb-4 text-light">Useful
							links</h6>
						<p>
							<a href="#!" class="text-light">FaceBook</a>
						</p>
						<p>
							<a href="#!" class="text-light">LinkedIn.com</a>
						</p>
						<p>
							<a href="#!" class="text-light">GitHub</a>
						</p>
						<p>
							<a href="#!" class="text-light">Help</a>
						</p>
					</div>
					<!-- Grid column -->

					<!-- Grid column -->
					<div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
						<!-- Links -->
						<h6 class="text-uppercase fw-bold mb-4 text-light">Contact</h6>
						<p class="text-light">
							<i class="fas fa-home me-3"></i> Ramallah, WB 10012, PS
						</p>
						<p class="text-light">
							<i class="fas fa-envelope me-3"></i> info@jopfinder.ps
						</p>
						<p class="text-light">
							<i class="fas fa-phone me-3"></i> + 09 299 633 93
						</p>
						<p class="text-light">
							<i class="fas fa-print me-3"></i> + 09 299 633 90
						</p>
					</div>
					<!-- Grid column -->
				</div>
				<!-- Grid row -->
			</div>
		</section>
		<!-- Section: Links  -->

		<!-- Copyright -->
		<div class="text-center p-4"
			style="background-color: rgba(0, 0, 0, 0.05);">

			<a class="text-reset fw-bold" href="#">www.jobfinder.ps</a>
		</div>
		<!-- Copyright -->
	</footer>
	<!-- Footer -->


</body>
</html>