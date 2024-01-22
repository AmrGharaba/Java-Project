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
<title>User dashboard</title>
<link rel="stylesheet" href="/style/styleindex.css">

<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">

</head>

<body class="body">
	<header>
	<div class="container">
  <nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">Navbar</a>
    </div>
  </nav>
</div>
</header>

	<!--  end Header -->

	<!--  form -->
	<section class="main-form">
		<h1>FIND THE JOB THAT FITS YOUR LIFE</h1>
		<h3>We offer thousands of jobs vacancies right now</h3>

		<form:form class="row gy-2 gx-3 align-items-center" action="/vacancy/filter" method="post" modelAttribute="vacancyFilter">
			<div class="col-auto">
				<label class="visually-hidden" for="autoSizingInput">Key Word</label> 
				<form:input type="text" path="description" class="form-control" id="autoSizingInput" placeholder="Key Word"/>
			</div>
			<div class="col-auto">
				<label class="visually-hidden" for="autoSizingSelect">Category</label>
				<select class="form-select" id="autoSizingSelect" name="categoryId" >
					<option selected>Category</option>
					<c:forEach var="category" items="${categories}">
					<option value="${category.id}">${category.title}</option>
					</c:forEach>
				</select>
			</div>
			
			<div class="col-auto">
				<label class="visually-hidden" for="autoSizingSelect">Location</label>
				<form:select class="form-select" id="autoSizingSelect" path="city">
					<option selected>Location</option>
					<c:forEach var="city" items="${cities}">
					<form:option path="city" value="${city}">${city.name}</form:option>
					</c:forEach>

				</form:select>
			</div>
			<div class="col-auto">
				<button type="submit" class="btn btn-primary">Submit</button>
			</div>
		</form:form>
	</section>
	<!--  end form -->

	<section class="section-job">
		<h3 class="job-font">Find the right job Sectors</h3>
		<div class="job-form">
			<div class="card" style="width: 18rem;">
				<div class="card-body">
					<h5 class="card-title">Special title treatment</h5>
					<p class="card-text">With supporting text below as a natural
						lead-in to additional content.</p>
					<a href="#" class="btn btn-primary">Apply Now</a>
				</div>
			</div>

			<div class="card" style="width: 18rem;">
				<div class="card-body">
					<h5 class="card-title">Special title treatment</h5>
					<p class="card-text">With supporting text below as a natural
						lead-in to additional content.</p>
					<a href="#" class="btn btn-primary">Apply Now</a>
				</div>
			</div>

			<div class="card" style="width: 18rem;">
				<div class="card-body">
					<h5 class="card-title">Special title treatment</h5>
					<p class="card-text">With supporting text below as a natural
						lead-in to additional content.</p>
					<a href="#" class="btn btn-primary">Apply Now</a>
				</div>
			</div>

		</div>
	</section>

	<section class="user-apply">
		<div class="card mb-3" style="max-width: 540px;">
			<div class="row g-0">
				<div class="col-md-4">
					<img src="/images/career.jpg" class="img-fluid rounded-start" alt="..."/>	
				</div>
				<div class="col-md-8">
				<div  class="cardbody">
					<div class="card-body" class="cardbody">
						<h5 class="card-title">Advance your career with job finder.</h5>
						<p class="card-text">Create a free account, complete your profile, and get matched with your dream job.</p>
						<button type="button" class="btn btn-outline-danger">Get Started</button>
						<p class="card-text">
							<small class="text-body-secondary">Get seen by employers.</small></p>
					</div>
					</div>
				</div>
			</div>
		</div>
	</section>












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