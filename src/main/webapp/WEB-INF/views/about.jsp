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
<!-- 							<ol class="breadcrumb"> -->
<!-- 								<li><a href="#">Home</a></li> -->
<!-- 								<li class="active">About</li> -->
<!-- 							</ol> -->
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
						<br>
						<img class="img-responsive" src="static/images/about/books2.jpg">
					</div>
					<div class="col-md-6">
						<p>Home schooling parents and home schooled independent readers often have to grapple 
						with finding suitable, challenging and varied reading materials. When trying to discover 
						reading materials, they are typically on their own or only have access to a limited 
						number of other home schooling parents for recommendations. Even then, they normally 
						don't have access to those other parents at the time when they need the advice.</p>
						<br>
						<p>This application, The Family Reader, provides a curated list of titles that will cover 
						all reading levels and many useful genres/subject categories. It is available online so 
						users will never be constrained by time or by availability of access to resource persons.</p>
						<br>
						<p>The idea for this web-based reading list came from a printed list of recommended books 
						prepared and circulated by home schooling families. It was not available online initially, and 
						few knew about it. Although it was subsequently put online in the mid-90's, it was non-interactive
						and has never been updated. </p>
						<br>
						<p>Recommendations for titles to be included in the collection can be made using the 
						<a href="contact" style="color: blue;">Contact Form</a>.</p>
						<br>
						<p>Thanks for stopping by to visit The Family Reader! We hope you find this a useful and valuable 
						reference when trying to make decisions about what reading materials to select for your family!</p>
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