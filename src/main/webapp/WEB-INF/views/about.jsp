<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="description" content="#">
	<meta name="author" content="#">
	
	<title>${title}</title>
	
	<!-- Mobile Specific Meta-->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- Favicon -->
	<link rel="shortcut icon" type="image/x-icon"
		href="static/static/images/favicon.png" />
	
	<!-- Themefisher Icon font -->
	<link rel="stylesheet" href="static/plugins/themefisher-font/style.css">
	<!-- bootstrap.min css -->
	<link rel="stylesheet"
		href="static/plugins/bootstrap/css/bootstrap.min.css">
	
	<!-- Main Stylesheet -->
	<link rel="stylesheet" href="static/css/style.css">
	
	</head>

	<body id="body">
		<!-- Start Top Header Bar -->
		<jsp:include page="header.jsp" />
	
		<!-- Main Menu Section -->
	
		<section class="page-header">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="content">
							<h1 class="page-name">About Us</h1>
							<ol class="breadcrumb">
								<li><a href="#">Home</a></li>
								<li class="active">About</li>
							</ol>
						</div>
					</div>
				</div>
			</div>
		</section>
	
		<section class="about section">
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						<img class="img-responsive" src="static/images/about/bookwheel.jpg">
					</div>
					<div class="col-md-6">
						<p>Home schooling parents and home schooled independent readers often have to grapple 
						with finding suitable, challenging and varied reading materials. When trying to discover 
						reading materials, they are typically on their own, or only have access to a limited 
						number of other home schooling parents for recommendations. Even then, they normally 
						don't have access to those other parents at the time when they need the advice.</p>
						
						<p>This application, The Family Reader, provides a curated list of titles that will cover 
						all reading levels and many useful genres/subject categories. It is available online so 
						users will never be constrained by time or by availability of access to resource persons.</p>
						
						<p>The idea for this web-based reading list came from a printed list of recommended books 
						prepared and circulated by home schooling families. It was not available online initially, and 
						few knew about it. Although it was subsequently put online in the mid-90's, it was non-interactive
						and has never been updated. </p>
						
						<p>Recommendations for titles to be included in the collection can be made using the 
						<a href="contact" style="color: blue;">Contact Form</a>.
					</div>
				</div>
			</div>
		</section>
	
		<section class="team-members ">
			<div class="container">
				<div class="row">
					<div class="title">
						<h2>Team Members</h2>
					</div>
				</div>
				<div class="row">
					<div class="col-md-3">
						<div class="team-member text-center">
							<img class="img-circle" src="static/images/team/mark.jpg" height=200px; width=200px;>
							<h4>Mark Brown</h4>
							<p>Curator</p>
						</div>
					</div>
					<div class="col-md-3">
						<div class="team-member text-center">
							<img class="img-circle" src="static/images/team/chloe2.jpg" height=200px; width=200px;>
							<h4>Chloe McKenzie</h4>
							<p>Reviewer</p>
						</div>
					</div>
					<div class="col-md-3">
						<div class="team-member text-center">
							<img class="img-circle" src="static/images/team/mary.jpg" height=200px; width=200px;>
							<h4>Mary Crawley</h4>
							<p>Reviewer</p>
						</div>
					</div>
					<div class="col-md-3">
						<div class="team-member text-center">
							<img class="img-circle" src="static/images/team/ilsa.jpg" height=200px; width=200px;>
							<h4>Ilsa Lund</h4>
							<p>Reviewer</p>
						</div>
					</div>
				</div>
			</div>
		</section>
		
		<footer class="footer section text-center">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<ul class="social-media">
							<li><a href="#"> <i class="tf-ion-social-facebook"></i>
							</a></li>
							<li><a href="#"> <i class="tf-ion-social-instagram"></i>
							</a></li>
							<li><a href="#"> <i class="tf-ion-social-twitter"></i>
							</a></li>
							<li><a href="#"> <i class="tf-ion-social-pinterest"></i>
							</a></li>
						</ul>
					</div>
				</div>
			</div>
		</footer>
	</body>
</html>