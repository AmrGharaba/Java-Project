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
                            <a class="nav-link" href="/login">Log In</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/vacancy">Vacancies</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/aboutus">About Us</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
	    </div>
	</header>
	<!--  end Header -->




	<!-- Main Section -->
	<main>
	
	
	
	<section class="main-form w-100">
		<h1>Wellcome </h1>
		<h3>Login as Employer!</h3>

		
	</section>
	
	
	
    <div class="row justify-content-around">
        <div class="col-lg-4">
            <h2 class="text-center mb-4">Registration</h2>
            <form:form action="/companyRegister" method="post" modelAttribute="newCompany">
                <div class="form-group">
                    <form:label path="name">Name:</form:label>
                    <form:errors path="name"/>
                    <form:input path="name" class="form-control"/>
                </div>
                <div class="form-group">
                    <form:label path="email">Email:</form:label>
                    <form:errors path="email"/>
                    <form:input path="email" class="form-control"/>
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
                <button type="submit" class="btn btn-primary">Submit</button>
            </form:form>
        </div>

        <div class="col-lg-4">
            <h2 class="text-center mb-4">Login</h2>
            <form:form action="/companyLogin" method="post" modelAttribute="company">
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
                <button type="submit" class="btn btn-primary">Submit</button>
            </form:form>
        </div>
    </div>

    <div class="text-center mt-4">
        <a href="/login" class="btn btn-link">Login As User</a>
    </div>
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