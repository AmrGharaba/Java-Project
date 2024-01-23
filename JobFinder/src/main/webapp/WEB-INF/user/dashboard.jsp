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
<link rel="stylesheet" href="/style/card.css">
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

	<!--  form -->
	<section class="main-form">
	<div class="nested-card pb-4">
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
>
					<c:forEach var="category" items="${categories}">
					<option  value="${category.id}">${category.title}</option>
					</c:forEach>
				</select>
			</div>
			
			<div class="col-auto">
				<label class="visually-hidden" for="autoSizingSelect">Location</label>
				<form:select class="form-select" id="autoSizingSelect" path="city">
					<c:forEach var="city" items="${cities}">
					<form:option path="city" value="${city}">${city.name}</form:option>
					</c:forEach>

				</form:select>
			</div>
			<div class="col-auto">
				<button type="submit" class="btn btn-primary">Submit</button>
			</div>
		</form:form>
		</div>
	</section>
	<!--  end form -->
	
<div class="container">
    <input type="radio" id="All" name="categories" value="All" checked>
    <input type="radio" id="frontend" name="categories" value="frontend">
    <input type="radio" id="backend" name="categories" value="backend">
    <input type="radio" id="ui/ux" name="categories" value="ui/ux">
    <input type="radio" id="data scientist" name="categories" value="data scientist">
    <input type="radio" id="database" name="categories" value="database">

    <ol class="filters">
      <li>
        <label for="All">All</label>
      </li>
      <li>
        <label for="frontend">Frontend</label>
      </li>
      <li>
        <label for="backend">Backend</label>
      </li>
      <li>
        <label for="ui/ux">UI/UX</label>
      </li>
      <li>
        <label for="data scientist">Data Scientist</label>
      </li>
      <li>
        <label for="database">Database</label>
      </li>
    </ol>
  </div>
  
  
  	
	
	
	<div class="cards" id="vacancies-container">
    <c:forEach var="vacancy" items="${vacancies}">
        <div class="filter-card">
            <img src="https://i.pngimg.me/image_by_url?url=https://image.freepik.com/free-vector/job-vacancy-background-with-chair_23-2147868094.jpg" alt="Vacancy Image">
            <div class="container">
                <h4><b>${vacancy.name}</b></h4>
                <div class="categories">
                    <c:forEach var="category" items="${vacancy.workCategories}">
                        <span class="tag">${category.title}</span>
                    </c:forEach>
                </div>
                <p>${vacancy.description}</p>
            </div>
        </div>
    </c:forEach>
</div>

<!-- Include jQuery -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<!-- Your AJAX script -->
<script>
    $(document).ready(function() {
        $('input[name="categories"]').change(function() {
            const selectedCategory = $('input[name="categories"]:checked').val();

            $.ajax({
                type: 'GET',
                url: '/fetchvacancy?category=' + selectedCategory,
                success: function(data) {
                    // Replace the existing content inside the #vacancies-container with the newly received data
                    $('#vacancies-container').html(data);
                },
                error: function(error) {
                    console.error('Error fetching data:', error);
                }
            });
        });
    });
</script>
	
		






<!--  <section class="section-job w-75 mx-auto text-center">
		<h3 class="job-font">Find the right job Sectors</h3>
		<div class="row">
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
		</section>  -->
		
		<div class="wrapper">
        <div class="container">
            <div class="card border-top-yellow">
                <img src="https://t3.ftcdn.net/jpg/06/00/92/28/360_F_600922821_wWqDd3DPAuGxAwWK1Vh3cJ4kwbDv3pKq.jpg" alt="" >
                <h2>WordPress Website</h2>
                <p>Providing custom, user-friendly and visually appealing websites for businesses and individuals.</p>
                <br>
                <div class="explore-btn">
                <a href="#">Explore   <i class="fa fa-arrow-right"></i></a></div>
            </div>
            <div class="card border-top-green">
                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3wlpZkEcJqNNXEnucCpQtRHDxqkzcTa9sH6iZqmBGnQ&s" alt="" >
                <h2>Custom Website</h2>
                <p>I offer Custom coded, Pixel-Perfect, Creative and Professional Websites to drive success for your business.</p>
                <br>
                <div class="explore-btn">
                <a href="#">Explore   <i class="fa fa-arrow-right"></i></a></div>
            </div>
            <div class="card border-top-blue">
                <img src="https://img.freepik.com/premium-photo/male-hand-touching-service-concept_220873-7591.jpg" alt="" >
                <h2>Fillable PDF Forms</h2>
                <p>Simple PDFs into editable forms that can be easily filled and submitted digitally for improved efficiency.</p>
                <br>
                <div class="explore-btn">
                <a href="#">Explore   <i class="fa fa-arrow-right"></i></a></div>
            </div>
        </div>
    </div>






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

			<a class="text-reset fw-bold" href="https://mdbootstrap.com/">www.jobfinder.ps</a>
		</div>
		<!-- Copyright -->
	</footer>
	<!-- Footer -->


</body>
</html>