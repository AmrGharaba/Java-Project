<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/style/styleindex.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

</head>
<style>
.cards {
width:100%;
display: flex;
}
</style>
<div class="cards" id="vacancies-container">
<c:if  test="${empty vacancies}">
    <p class="EmptyMessage">No vacancies available now.</p>
</c:if>
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

<script >
$(document).ready(function() {
    $('input[name="categories"]').change(function() {
        const selectedCategory = $('input[name="categories"]:checked').val();

        $.ajax({
            type: 'GET',
            url: '/fetchvacancy?category=' + selectedCategory,
            success: function(data) {
                // Replace the existing content inside the #vacancies-container with the newly received fragment
                $('#vacancies-container').html(data);
            },
            error: function(error) {
                console.error('Error fetching data:', error);
            }
        });
    });
});
</script>