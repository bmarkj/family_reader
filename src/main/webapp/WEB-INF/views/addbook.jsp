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
</head>

<body id="body" >

	<jsp:include page="header.jsp" />

	<section class="page-header">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="content">
						<h1 class="page-name">Add Book</h1>
							<ol class="breadcrumb">
								<li class="active">Admin</li>
								<li class="active">Manage Library</li>
								<li class="active">Add Book</li>
							</ol>
						
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="addbook">
		<div class="form-group">
			<h5 style="color: red"><i>${msg} ${success}</i></h5>
			<h3 style="color: red"><i>${danger}</i></h3>

			<form:form class="text-center border border-light p-5" action="addbook" 
					id="addbook" modelAttribute="book" method="post" autocomplete="on">

				<!-- Name -->
				<div class="form-group row">
					<form:input type="text" id="title" path="title" class="form-control mb-4"
						placeholder="Title"  />
						<form:errors path="title" class="text-danger text-center" />
				</div>

				<!-- Author -->
				<div class="form-group row">
					<form:input type="text" id="author" path="author" class="form-control mb-4"
						placeholder="Author" />
						<form:errors path="author" class="text-danger text-center" />
				</div>

				<!-- Reading Level -->
				<div class="form-group row">
					<form:select class="custom-select mb-4 myselect" path="level" >
						<option value="">Reading Level</option>
						<c:forEach var="level" items="${levels}" >
							<option value="${level.id}">${level.name}</option>
						</c:forEach>
				</form:select>
				<form:errors path="level" class="text-danger text-center" />
				</div>

				<!-- Category -->
				<div class="form-group row">
					<form:select class="custom-select mb-4 myselect" path="category" >
						<option value="">Category</option>
						<c:forEach var="category" items="${categories}" >
							<option value="${category.id}">${category.name}</option>
						</c:forEach>
					</form:select>
					<form:errors path="category" class="text-danger text-center" />
				</div>

				<!-- ISBN -->
				<div class="form-group row">
					<form:input type="text" id="isbn" path="isbn" class="form-control mb-4"
						placeholder="ISBN #" />
				</div>

				<!-- Send button -->
				<div id="outer">
					<div class="inner">
						<button type="submit" class="btn">Add Book</button> 
					</div>
					<div class="inner">
						<form:button type="reset" id="reset" class="btn" 
							onClick="clearform()">Clear Form</form:button>
					</div>
					<div class="inner">
						<a href="admin-books"><button type="button" class="btn">Exit Form</button></a>
					</div>
					
				</div>
			</form:form>		
		</div>
	</section>


	<!-- Essential Scripts =====================================-->

	<!-- Main jQuery -->
	<script src="static/plugins/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap 3.1 -->
	<script src="static/plugins/bootstrap/js/bootstrap.min.js"></script>
	<!-- Bootstrap Touchpin -->
	<script
		src="static/plugins/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.js"></script>

	<!-- Instagram Feed Js -->
	<script src="static/plugins/instafeed-js/instafeed.min.js"></script>

	<!-- Video Lightbox Plugin -->
	<script src="static/plugins/ekko-lightbox/dist/ekko-lightbox.min.js"></script>

	<!-- Count Down Js -->
	<script src="static/plugins/SyoTimer/build/jquery.syotimer.min.js"></script>

	<!-- Main Js File -->
	<script src="static/js/script.js"></script>
	
</body>
</html>
