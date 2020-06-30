<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>

<html class="no-js">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="description" content="#">
	<meta name="author" content="Mark Brown">
	
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
							<h1 class="page-name">Staff Profiles</h1>
						</div>
					</div>
				</div>
			</div>
		</section>
	
		<section class="about section">
			<div class="container">
				<div class="row">
					<div class="col-md-2">
						<img class="img-responsive" src="static/images/team/mark.jpg" height="100px" width="100px">
					</div>
					<div class="col-md-10">
											<p>Aenean viverra sollicitudin posuere. Morbi aliquam metus eros, a venenatis est 
						rhoncus nec. Aenean semper pharetra bibendum. Nulla nec condimentum ligula. Proin 
						tincidunt, neque quis congue lobortis, dui erat rhoncus velit, nec facilisis metus 
						neque eget metus. Aenean porttitor dignissim ex vitae hendrerit. Vivamus elementum 
						efficitur neque vel pellentesque. Donec mattis, lectus quis tincidunt lobortis, 
						ligula ipsum luctus diam, vel feugiat metus orci vel ex. Nam rutrum ante a varius 
						euismod. Donec sed mi eu felis efficitur imperdiet at vitae orci.</p>
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-md-2">
						<img class="img-responsive" src="static/images/team/chloe3.jpg" height="100px" width="100px">
					</div>
					<div class="col-md-10">
						<p>Nunc finibus nibh sit amet 
						ligula porttitor, vel efficitur ante venenatis. Nullam semper facilisis leo et 
						tristique. Sed dui mi, accumsan in tempor sed, rutrum rutrum massa. Aliquam vel 
						elementum leo, ac aliquet sem. Sed semper, nunc a maximus lobortis, lacus massa 
						cursus dolor, in ornare turpis nunc a nibh. Lorem ipsum dolor sit amet, consectetur 
						adipiscing elit. Phasellus nec tempus turpis. Sed molestie, urna dignissim viverra 
						cursus, sapien tortor laoreet arcu, et mattis ante eros vel nisi. Morbi nec risus 
						vel ex imperdiet tristique ac in nisl. </p>
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-md-2">
						<img class="img-responsive" src="static/images/team/ilsa.jpg" height="150px" width="100px">
					</div>
					<div class="col-md-10">
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed facilisis, 
						urna id finibus tempor, leo risus finibus urna, a hendrerit odio lorem at 
						justo. Nunc mollis fermentum est. Vivamus malesuada est vitae mi lacinia, 
						id convallis justo commodo. Vestibulum nec dapibus lectus. Proin porttitor, 
						lorem nec viverra hendrerit, massa justo volutpat orci, sed hendrerit lorem 
						tortor sit amet arcu. Donec aliquet pharetra iaculis. In nec augue id tortor 
						tristique finibus sed ac nunc. Mauris eu sem vulputate, euismod nisl a, 
						sodales nulla.</p>
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-md-2">
						<img class="img-responsive" src="static/images/team/mary.jpg" height="150px" width="100px">
					</div>
					<div class="col-md-10">
						<p>Fusce sed nulla eget lorem sodales condimentum. Morbi euismod, nulla vel 
						venenatis pharetra, ex purus porttitor turpis, sed porta enim quam non velit. 
						Integer porttitor magna nec ultrices elementum. Vivamus eleifend tellus eros, 
						quis luctus lacus consequat sed. Vestibulum ante ipsum primis in faucibus orci 
						luctus et ultrices posuere cubilia curae; Donec pellentesque justo massa, id 
						facilisis sapien gravida a. Donec eu lorem ut sapien consectetur condimentum. 
</p>
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