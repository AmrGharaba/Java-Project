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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css">
<Link rel="stylesheet" href="style/style.css">
</head>
<body>

		<header>
        <nav class="navbar navbar-expand-lg navbar-light bg-transparent border-bottom">
            <div class="container">
                <a class="navbar-brand text-white" href="#"><h1>Job Finder PS</h1></a>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active">
                            <a class="nav-link text-white" href="#">Home</a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link text-white" href="#">Categories</a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link text-white" href="#">Vacancies</a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link text-white" href="/login">Log In</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>
	<!--  end Header -->
	
	
	
	<!-- main Section -->
	<main>
	
	
	
	
	</main>
	
	
	
	
<!-- Footer -->
		<footer class="text-center text-lg-start bg-body-tertiary border-top">
		
		  <!-- Section: Links  -->
		  <section class="">
		    <div class="container text-center text-md-start mt-5">
		      <!-- Grid row -->
		      <div class="row mt-3">
		        <!-- Grid column -->
		        <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
		          <!-- Content -->
		          <h6 class="text-uppercase fw-bold mb-4">
		            <i class="fas fa-gem me-3"></i>Job Finder PS
		          </h6>
		          <p>
		            job finder is your path to success Lorem ipsum
		            dolor sit amet, consectetur adipisicing elit.
		          </p>
		        </div>
		        <!-- Grid column -->
		
		        <!-- Grid column -->
		        <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
		          <!-- Links -->
		          <h6 class="text-uppercase fw-bold mb-4">
		            Products
		          </h6>
		          <p>
		            <a href="#!" class="text-reset">Home</a>
		          </p>
		          <p>
		            <a href="#!" class="text-reset">Categories</a>
		          </p>
		          <p>
		            <a href="#!" class="text-reset">Vacancies</a>
		          </p>
		          <p>
		            <a href="#!" class="text-reset">Contact Us</a>
		          </p>
		        </div>
		        <!-- Grid column -->
		
		        <!-- Grid column -->
		        <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
		          <!-- Links -->
		          <h6 class="text-uppercase fw-bold mb-4">
		            Useful links
		          </h6>
		          <p>
		            <a href="#!" class="text-reset">FaceBook</a>
		          </p>
		          <p>
		            <a href="#!" class="text-reset">Github</a>
		          </p>
		          <p>
		            <a href="#!" class="text-reset">LinkedIn</a>
		          </p>
		          <p>
		            <a href="#!" class="text-reset">Youtube</a>
		          </p>
		        </div>
		        <!-- Grid column -->
		
		        <!-- Grid column -->
		        <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
		          <!-- Links -->
		          <h6 class="text-uppercase fw-bold mb-4">Contact</h6>
		          <p><i class="fas fa-home me-3"></i> Ramallah, WB 10012, PS</p>
		          <p>
		            <i class="fas fa-envelope me-3"></i>
		            info@jobfinder.ps
		          </p>
		          <p><i class="fas fa-phone me-3"></i> + 022976508</p>
		          <p><i class="fas fa-print me-3"></i> + 022976508</p>
		        </div>
		        <!-- Grid column -->
		      </div>
		      <!-- Grid row -->
		    </div>
		  </section>
		  <!-- Section: Links  -->
		
		  <!-- Copyright -->
		  <div class="text-center p-4" style="background-color: rgba(0, 0, 0, 0.05);">
		    © 2024 Copyright:
		    <a class="text-reset fw-bold" href="https://mdbootstrap.com/">JobFinder.ps</a>
		  </div>
		  <!-- Copyright -->
		</footer>
		<!-- Footer -->

</body>
</html>