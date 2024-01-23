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
<link rel="stylesheet" href="/style/styleindex.css">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
</head>
<body>
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
					  <a id="login" href="/logout" class="btn"> LogOut</a>
					</div>				                	
            </div>
        </nav>
	    </div>
	</header>

	<!--  end Header -->




       
	

	<!-- Main Content -->
	<main class="container mt-4 mb-4" >
	<section class="section-border m-1 main-form">
		<h3>Control Panel</h3>
		</section>
		<!-- City card -->
		
		<div class="d-flex justify-content-around">
		<div class="col-md-3">

				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Cities</h5>
					
						
						<form:form action="/admin/dashboard/addCity" method="post"
							modelAttribute="newCity">
							<div class="form-group">
								<div class="d-flex justify-content-between align-items-center">
									<form:input path="name" type="text"
										class="form-control form-control-sm mr-2"
										placeholder="Enter city name"></form:input>
									<button type="submit" class="btn btn-sm btn-primary ">Add</button>
								</div>
							</div>
						</form:form>
					</div>
					
					<ul class="list-group list-group-flush scroll-admin-page">
						<ul class="list-group">
						<c:if test="${!cities.isEmpty()}">
							<c:forEach var="city" items="${cities}">
								<li class="list-group-item">
									<div class="d-flex justify-content-around align-items-center">${city.name}
									<button type="button" class="btn btn-sm btn-danger ml-2">Delete</button>
									</div>
								</li>
							</c:forEach>
							</c:if>

						</ul>
					</ul>
				</div>
			</div>
						<!-- end of city card -->
			
			  <!-- Work Category card -->
			<div class="col-md-3">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Work Catagory</h5>
						<form:form action="/admin/dashboard/addCategory" method="post"
							modelAttribute="newCategory">
							<div class="form-group">
								<div class="d-flex justify-content-between align-items-center">
									<form:input path="title" type="text"
										class="form-control form-control-sm mr-2"
										placeholder="Enter Category"></form:input>
									<button type="submit" class="btn btn-sm btn-primary ">Add</button>
								</div>
							</div>
						</form:form>
					</div>
					<ul class="list-group list-group-flush scroll-admin-page">
						<ul class="list-group">
						<c:if test="${!workCategories.isEmpty()}">
						<c:forEach var="category" items="${workCategories}">
							<li class="list-group-item">
								<div class="d-flex justify-content-between align-items-center">
									${category.title}
									<button type="button" class="btn btn-sm btn-danger ml-2">Delete</button>
								</div>
							</li>
							</c:forEach>
							</c:if>

						</ul>
					</ul>
				</div>
			</div>
			<!-- end of Work Category card -->
		  	<!-- Companies card -->
			<div class="col-md-3">
				<div class="card">
					<div class=" card-body">
						<h5 class="card-title">Companies</h5>

					</div>
					<ul class="list-group list-group-flush scroll-admin-page">
						<c:if test="${!companies.isEmpty()}">
							<c:forEach var="company" items="${companies}">
								<li class="list-group-item">
									<div class="d-flex justify-content-between align-items-center">
										<h6>${company.name}</h6>
										<div class="d-flex flex-row">
											<button type="button" class="btn btn-sm btn-warning ml-2">Remove</button>
										</div>
									</div>
								</li>
							</c:forEach>
						</c:if>

					</ul>
				</div>
			</div>
			<!-- end of Companies card -->
						
			</div>
			
			
			
			<section class="section-border m-1 main-form">
		   <h3>Users</h3>
		  </section>
		  <!-- users card -->
	<div class="mx-auto text-center">
		<c:if test="${!user.isEmpty()}">
	       <table class="table">
			  <tr>
			    <th>User Name:</th>
			    <th>Action Delete</th>
			    <th>Action promote</th>
			  </tr>
			  <c:forEach var="user" items="${users}">
			  
			  <tr>
			    <td><a href="">${user.firstName} ${user.lastName}</a></td>
			    <td><button type="button" class="btn btn-sm btn-danger mr-2">Delete</button></td>
			    <td><button type="button" class="btn btn-sm btn-warning">Make Admin</button></td>
			  </tr>
			 </c:forEach>
			</table>
	        </c:if>
		</div>       
			<!-- end of users card -->

		     
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
						<h6 class="text-uppercase fw-bold mb-4 text-light">Useful links</h6>
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