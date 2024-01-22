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
                <a class="navbar-brand" href="#">JobFinder</a>

                <!-- Button for mobile navigation toggle -->
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                        aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <!-- Navigation links -->
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="/">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/contactus">Contact Us</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/login">Log In</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/vacancy">Vacancies</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
	    </div>
	</header>


	<!--  end Header -->





	<main>
	
	
	<section class="main-form">
		<h1>Wellcome ${company.name}</h1>
		<h3>add your Vacancies here!</h3>
	</section>
	
	
	
	
	
	
	<form:form class="mx-auto text-center w-50 mb-5 mt-5" action="/submitVacancy" method="post" modelAttribute="newVacancy">
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
	        <form:textarea class="form-control" id="description" path="description" rows="4"></form:textarea>
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
	            <input class="form-check-input" type="checkbox" id="category1" name="selected" value="${category.id}">
	            <label class="form-check-label" for="category1">${category.title}</label>
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
	
	
	<section class="section-job w-75 mx-auto text-center mb-4">
		<h3 class="job-font">History of Vacancies</h3>
		<div class="row">
		
			<!--  add for loop herererere -->
	  <div class="col-sm-4 p-2">
	    <div class="card">
	      <div class="card-body">
	        <h5 class="card-title">Special title treatment</h5>
	        <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
	        <a href="#" class="btn btn-primary">Go somewhere</a>
	      </div>
	    </div>
	  </div>
	  <!--  end foor loop -->
	 
	 
	 <div class="col-sm-4 p-2">
	    <div class="card">
	      <div class="card-body">
	        <h5 class="card-title">Special title treatment</h5>
	        <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
	        <a href="#" class="btn btn-primary">Go somewhere</a>
	      </div>
	    </div>
	  </div>
	  
	  <div class="col-sm-4 p-2">
	    <div class="card">
	      <div class="card-body">
	        <h5 class="card-title">Special title treatment</h5>
	        <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
	        <a href="#" class="btn btn-primary">Go somewhere</a>
	      </div>
	    </div>
	  </div>
	  
	  <div class="col-sm-4 p-2">
	    <div class="card">
	      <div class="card-body">
	        <h5 class="card-title">Special title treatment</h5>
	        <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
	        <a href="#" class="btn btn-primary">Go somewhere</a>
	      </div>
	    </div>
	  </div>
	  
	  <div class="col-sm-4 p-2">
	    <div class="card">
	      <div class="card-body">
	        <h5 class="card-title">Special title treatment</h5>
	        <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
	        <a href="#" class="btn btn-primary">Go somewhere</a>
	      </div>
	    </div>
	  </div> 
	  
	</div>
		</section>
	
	</main>
	











	<!-- Footer -->
	<footer
		class="text-center text-lg-start bg-body-tertiary footer-general">
		<!-- Section: Social media -->
		
		<!-- Section: Social media -->

		<!-- Section: Links  -->
		<section class="">
			<div class="container text-center text-md-start mt-5">
				<!-- Grid row -->
				<div class="row mt-3">
					<!-- Grid column -->
					<div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
						<!-- Content -->
						<h6 class="text-uppercase fw-bold mb-4">
							<i class="fas fa-gem me-3"></i>Company name
						</h6>
						<p>Here you can use rows and columns to organize your footer
							content. Lorem ipsum dolor sit amet, consectetur adipisicing
							elit.</p>
					</div>
					<!-- Grid column -->

					<!-- Grid column -->
					<div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
						<!-- Links -->
						<h6 class="text-uppercase fw-bold mb-4">Products</h6>
						<p>
							<a href="#!" class="text-reset">Angular</a>
						</p>
						<p>
							<a href="#!" class="text-reset">React</a>
						</p>
						<p>
							<a href="#!" class="text-reset">Vue</a>
						</p>
						<p>
							<a href="#!" class="text-reset">Laravel</a>
						</p>
					</div>
					<!-- Grid column -->

					<!-- Grid column -->
					<div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
						<!-- Links -->
						<h6 class="text-uppercase fw-bold mb-4">Useful links</h6>
						<p>
							<a href="#!" class="text-reset">Pricing</a>
						</p>
						<p>
							<a href="#!" class="text-reset">Settings</a>
						</p>
						<p>
							<a href="#!" class="text-reset">Orders</a>
						</p>
						<p>
							<a href="#!" class="text-reset">Help</a>
						</p>
					</div>
					<!-- Grid column -->

					<!-- Grid column -->
					<div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
						<!-- Links -->
						<h6 class="text-uppercase fw-bold mb-4">Contact</h6>
						<p>
							<i class="fas fa-home me-3"></i> New York, NY 10012, US
						</p>
						<p>
							<i class="fas fa-envelope me-3"></i> info@example.com
						</p>
						<p>
							<i class="fas fa-phone me-3"></i> + 01 234 567 88
						</p>
						<p>
							<i class="fas fa-print me-3"></i> + 01 234 567 89
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

			<a class="text-reset fw-bold" href="https://mdbootstrap.com/">MDBootstrap.com</a>
		</div>
		<!-- Copyright -->
	</footer>
	<!-- Footer -->


</body>
</html>