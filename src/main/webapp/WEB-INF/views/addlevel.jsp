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

		<section class="page-header">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="content">
							<h1 class="page-name">Add Level</h1>
						</div>
					</div>
				</div>
			</div>
		</section>
		
		<section class="addlc">
			<div class="form-group">
			<br>
				<h5 style="color: red"><i>${msg} ${success}</i></h5>
	
				<form class="text-center border border-light p-5" action="addlevel" method="post">
	
					<!-- Name -->
					<div class="form-group row">
						<input type="text" id="name" name="name" class="form-control mb-4"
							placeholder="Level name">
					</div>
		
					<!-- Buttons -->
					<div id="outer">
						<div class="inner">
							<button type="submit" class="btn">Add</button> 
						</div>
						<div class="inner">
							<button type="reset" class="btn">Clear</button>
						</div>
						<div class="inner">
							<a href="managelc"><button type="button" class="btn">Back</button></a>
						</div>
					</div>
				</form>
			</div>
		</section>
		
		
		

	</body>
</html>