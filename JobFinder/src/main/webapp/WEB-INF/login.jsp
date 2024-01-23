<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/style/styleindex.css">

</head>
<body class=body>


	<header>
    <div class="container">
        <nav class="navbar navbar-expand-lg bg-body-tertiary">
            <div class="container-fluid">
                <a class="navbar-brand" href="/">JobFinder</a>

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
                            <a class="nav-link" href="/aboutus">About Us</a>
                        </li>
                    </ul>
                </div>
                
                <div>
					  <a id="login" href="/login" class="btn"> Login</a>
					</div>			                	
            </div>
        </nav>
	    </div>
	</header>

	<!--  end Header -->
	




		
		<!-- Main Content -->
	<main class="mb-4">
	
	
	<section class="main-form">
	<div class="nested-card p-4">
		<h1>Wellcome </h1>
		<h3>Login as User!</h3>
	</div>
	</section>
	
	
	
	    <div class="row justify-content-around">
	
	        <div class="col-md-4">
	            <!-- Registration Form -->
	            <h2 class="mb-4">Registration</h2>
	            <form:form action="/register" method="post" modelAttribute="newUser">
	                <!-- Form elements with Bootstrap styling -->
	                <div class="form-group">
	                    <form:label path="firstName">First Name:</form:label>
	                    <form:errors path="firstName"/>
	                    <form:input path="firstName" class="form-control"/>
	                </div>
	                <div class="form-group">
	                    <form:label path="lastName">Last Name:</form:label>
	                    <form:errors path="lastName"/>
	                    <form:input path="lastName" class="form-control"/>
	                </div>
	                <div class="form-group">
	                    <form:label path="email">Email:</form:label>
	                    <form:errors path="email"/>
	                    <form:input type="email" path="email" class="form-control"/>
	                </div>
	                <div class="form-group">
	                    <form:label path="password">Password:</form:label>
	                    <form:errors path="password"/>
	                    <form:input type="password" path="password" class="form-control"/>
	                </div>
	                <div class="form-group">
	                    <form:label path="confirm">Confirm PW:</form:label>
	                    <form:errors path="confirm"/>
	                    <form:input type="password" path="confirm" class="form-control"/>
	                </div>
	                <input type="submit" value="Submit" class="btn btn-primary"/>
	            </form:form>
	        </div>
	
	        <div class="col-md-4">
	            <!-- Login Form -->
	            <h2 class="card-title mb-4 text-center">Login</h2>
	            <form:form action="/login" method="post" modelAttribute="user">
	                <!-- Form elements with Bootstrap styling -->
	                <div class="form-group">
	                    <form:label path="email">Email:</form:label>
	                    <form:errors path="email"/>
	                    <form:input type="email" path="email" class="form-control"/>
	                </div>
	                <div class="form-group">
	                    <form:label path="password">Password:</form:label>
	                    <form:errors path="password"/>
	                    <form:input type="password" path="password" class="form-control"/>
	                </div>
	                <input type="submit" value="Submit" class="btn btn-primary"/>
	            </form:form>
	        </div>
	    </div>
	    <div class="text-center mt-4">
        <a href="/loginEmployer" id="login" class="btn">Login As Employer</a>
    </div>
	</main>

	
	
	
	
	
	
	
	
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
							<i class="fas fa-gem me-3"></i>JobFinder</h6>
						<p class="text-light">We provide a user-friendly interface with advanced search features, 
						empowering users to explore a diverse range of job listings.</p>
					</div>
					<!-- Grid column -->

					<!-- Grid column -->
					<div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
						<!-- Links -->
						<h6 class="text-uppercase text-light fw-bold mb-4">Home</h6>
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