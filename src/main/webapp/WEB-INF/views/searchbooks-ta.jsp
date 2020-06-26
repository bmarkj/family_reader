<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>

<html class="no-js">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<title>${title}</title>
	
	<!-- Mobile Specific Meta-->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- Favicon -->
	<link rel="shortcut icon" type="image/x-icon" href="static/images/favicon.png" />
	
	<!-- Themefisher Icon font -->
	<link rel="stylesheet" href="static/plugins/themefisher-font/style.css">
	
	<!-- bootstrap.min css -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="stylesheet" href="static/plugins/bootstrap/css/bootstrap.min.css">
	
	<!-- Main Stylesheet -->
	<link rel="stylesheet" href="static/css/style.css">
	<style>
	.search-ta-form {
		padding-left: 100px;
	}
	
	</style>
	
</head>

<body id="body" >

	<jsp:include page="header.jsp" />

	<section class="img-page-header" >
		<div class="container">
			<div class="row">
				<img src="static/images/art/anker2.jpg" height="150px" width="150px">			
				<div class="col">
					<div class="">
						<h1 class="bar-title">Search Books:  Title & Author</h1>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<section class="user-dashboard page-wrapper">
		<div class="container">
			<h4 class="msg success">${msg}${success}</h4>
			<form class="form-inline col-md-12" action="search-ta", method="get">
				<div class="row" style="margin-left: auto; margin-right: auto;">
					<div class="column">
						<input type="search" name="keyword" id="searchnow"
							class="form-control" placeholder="Search title or author...">
						<button type="submit" class="btn btn-danger">
							<i class="tf-ion-ios-search-strong"></i></button>	
					</div>
					<div class="column" style="padding-left: 50px;">
						<a href="searchbooks-lc"><button type="button" class="btn btn-info">Level / Category</button></a>					
					</div>
				</div>
			</form>
		</div>
		
	</section>
	
	<section>
		<c:if test="${books != null}">
			<h4 style="text-align: center; font-style: italic; color: #5BC0DE;">${level}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${category}</h4>
			<table class="table searchbookstable" >
				<tr >
					<th>Title</th>
					<th>Author</th>
					<th style="text-align: center;">Action</th>
				</tr>
				<c:forEach var="book" items="${books}">
				<tr>
					<td><a href="#" >${book.title}</a></td>
					<td>${book.author}</td>
					<td style="text-align: center;"> 
						<a href="bookprofile?bookId=${book.id}" class="text-info">Book Details</a>						
						&nbsp;&nbsp; | &nbsp;&nbsp;
						<a href="addtolist?bookId=${book.id}" class="text-info">Add To My List</a>
					</td>
				</tr>
				</c:forEach>
			</table>
		</c:if>
	</section>
	
	
	<!-- *********************     SCRIPTS     *********************** -->
	<!-- Main jQuery -->
	<script src="static/plugins/jquery/dist/jquery.min.js"></script>
	
	<!-- Bootstrap 3.1 -->
	<script src="static/plugins/bootstrap/js/bootstrap.min.js"></script>
	
	<!-- Bootstrap Touchpin -->
	<script src="static/plugins/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.js"></script>
		
	<!-- Count Down Js -->
	<script src="static/plugins/SyoTimer/build/jquery.syotimer.min.js"></script>

	<!-- Google Mapl -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCC72vZw-6tGqFyRhhg5CkF2fqfILn2Tsw"></script>
	<script type="text/javascript" src="static/plugins/google-map/gmap.js"></script>

	<!-- Main Js File -->
	<script src="static/js/script.js"></script>
	
	<!-- JS, Popper.js, and jQuery -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>


</body>
</html>