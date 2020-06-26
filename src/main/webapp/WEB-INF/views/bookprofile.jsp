<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html class="no-js">
<!--<![endif]-->
	<head>
		<meta http-equiv="refresh"
			CONTENT="<%= session.getMaxInactiveInterval() %>; URL='${contextPath}/expired'" />
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="description" content="#">
		<meta name="author" content="#">
		
		<title>${title}</title>
		
		<!-- Mobile Specific Meta-->
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<!-- Favicon -->
		<link rel="shortcut icon" type="image/x-icon" href="static/static/images/favicon.png" />
		
		<!-- Themefisher Icon font -->
		<link rel="stylesheet" href="static/plugins/themefisher-font/style.css"> 
		
		<!-- bootstrap.min css -->
		<link rel="stylesheet" href="static/plugins/bootstrap/css/bootstrap.min.css">
		
		<!-- Main Js File -->
		<script src="static/js/script.js"></script>
			
		<!-- Main Stylesheet -->
		<link rel="stylesheet" href="static/css/style.css">
	</head>
	
	<body>
	
		<jsp:include page="header.jsp" />
	
	<section class="img-page-header" >
		<div class="container">
			<div class="row">
			<div class="col-md-2">
				<img src="static/images/art/sargent1.jpg" height="150px" width="150px">
			</div>			
				<div class="col-md-10">
					<div class="">
						<h1 class="bar-title">Book Profile</h1>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<br><br><br>

	<section >
		<table class="table book-profile">
			<tr>
				<td><label>Title: </label></td>
				<td>${book.title}</td>
			</tr>
			<tr>
				<td><label>Author: </label></td>
				<td>${book.author}</td>
			</tr>
			<tr>
				<td><label>Level: </label></td>
				<td>${book.level.name}</td>
			</tr>
			<tr>
				<td><label>Category: </label></td>
				<td>${book.category.name}</td>
			</tr>
			<tr>
				<td><label>Description: </label></td>
				<td>${description}</td>
			</tr>
		</table>

		<div class="container" style="text-align: center;">
			<form action="addtolist?${book.id}" method="get">
				<input type="hidden" name="bookId" value="${book.id}" />
				<button class="btn btn-info" type="submit" >Add To My List</button>
				<button class="btn btn-info" type="button" onClick="goBack()">Back To Search</button>
			</form>
		</div>
	</section>
	
	<!-- *********************     SCRIPTS     *********************** -->
	<!-- Main jQuery -->
	<script src="static/plugins/jquery/dist/jquery.min.js"></script>
	
	<!-- Bootstrap 3.1 -->
	<script src="static/plugins/bootstrap/js/bootstrap.min.js"></script>
	
	<!-- Bootstrap Touchpin -->
	<script src="static/plugins/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.js"></script>
	
	<!-- Instagram Feed Js -->
	<script src="static/plugins/instafeed-js/instafeed.min.js"></script>
	
	<!-- Video Lightbox Plugin -->
	<script src="static/plugins/ekko-lightbox/dist/ekko-lightbox.min.js"></script>
	
	<!-- Count Down Js -->
	<script src="static/plugins/SyoTimer/build/jquery.syotimer.min.js"></script>
	
	<!-- JS, Popper.js, and jQuery -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
	
	<script>
		function goBack() {
  			window.history.back();
		}
	</script>
</body>

</html>