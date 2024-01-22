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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

</head>

<body class="body">
	<header>
	<div class="container">
  <nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
	<div class="navbar">
	  <a class="active" href="#"><i class="fa fa-fw fa-home"></i> Home</a>
	  <a href="#"><i class="fa fa-fw fa-envelope"></i> Contact</a>
	   <a href="#services"><i class="fa fa-fw fa-wrench"></i> Services</a>
  <a href="#clients"><i class="fa fa-fw fa-user"></i> Clients</a>
	
	</div>
	<div>
	  <a id="login" href="#"><i class="fa fa-fw fa-user"></i> Login</a>
	</div>
    </div>
  </nav>
</div>
</header>

	<!--  end Header -->

	<!--  form -->
	<section class="main-form">
	<div class="nested-card">
	
		<h1>FIND THE JOB THAT FITS YOUR LIFE</h1>
		<h3>We offer thousands of jobs vacancies right now</h3>
		<form class="row gy-2 gx-3 align-items-center">
			<div class="col-auto">
				<label class="visually-hidden" for="autoSizingInput">Key
					Word</label> <input type="text" class="form-control" id="autoSizingInput"
					placeholder="Key Word">
			</div>
			<div class="col-auto">
				<label class="visually-hidden" for="autoSizingSelect">Category</label>
				<select class="form-select" id="autoSizingSelect">
					<option selected>Category</option>
					<option value="1">One</option>
					<option value="2">Two</option>
					<option value="3">Three</option>
				</select>
			</div>
			<div class="col-auto">
				<label class="visually-hidden" for="autoSizingSelect">Location</label>
				<select class="form-select" id="autoSizingSelect">
					<option selected>Location</option>
					<option value="1">One</option>
					<option value="2">Two</option>
					<option value="3">Three</option>
				</select>
			</div>
			<div class="col-auto">
				<button type="submit" class="btn btn-primary">Submit</button>
			</div>
		</form>
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
        <div class="card">
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
 <<%-- div class="cards">
    <c:forEach var="vacancy" items="${vacancies}">
        <div class="card">
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
    <div id="vacanciesContainer">
    </div>
    
    <script>
    $(document).ready(function() {
        $('input[name="categories"]').change(function() {
            const selectedCategory = $('input[name="categories"]:checked').val();

            $.ajax({
                type: 'GET',
                url: '/fetchvacancy?category=' + selectedCategory,
                success: function(data) {
                    // Append the received HTML content to the existing .cards container
                    $('.cards').html(data);
                },
                error: function(error) {
                    console.error('Error fetching data:', error);
                }
            });
        });
    });
</script> --%>
    
	
  <script>
   /*  $(document).ready(function() {
      const vacanciesContainer = $('#vacancies-container');

      $('input[name="categories"]').change(function() {
        const selectedCategory = $('input[name="categories"]:checked').val();
        console.log(selectedCategory)
        $.ajax({
          type: 'GET',
          url: '/fetchvacancy?category=' + selectedCategory,
          success: function(data) {
        	  //$('cards').append(data)
        	  //console.log('Received data:', data);
            vacanciesContainer.html(data);
            
          },
          error: function(error) {
            console.error('Error fetching data:', error);
          }
        });
      });
    }); */
  </script>
	
	
	
	
	
	

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
					<img src="images/career.jpg" class="img-fluid rounded-start" alt="..."/>	
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