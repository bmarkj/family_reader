<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html class="no-js"> <!--<![endif]-->
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="description" content="Claim Academy capstone demo project">
  
  <meta name="author" content="Mark Brown">

  <title>${title}</title>

  <!-- Mobile Specific Meta-->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <!-- Favicon -->
  <link rel="shortcut icon" type="image/x-icon" href="static/images/favicon.png" />
  
  <!-- Themefisher Icon font -->
  <link rel="stylesheet" href="static/plugins/themefisher-font/style.css">
  <!-- bootstrap.min css -->
  <link rel="stylesheet" href="static/plugins/bootstrap/css/bootstrap.min.css">
  
  <!-- Revolution Slider -->
  <link rel="stylesheet" type="text/css" href="static/plugins/revolution-slider/revolution/fonts/pe-icon-7-stroke/css/pe-icon-7-stroke.css">
  <link rel="stylesheet" type="text/css" href="static/plugins/revolution-slider/revolution/fonts/font-awesome/css/font-awesome.css">

  <!-- REVOLUTION STYLE SHEETS -->
  <link rel="stylesheet" type="text/css" href="static/plugins/revolution-slider/revolution/css/settings.css">
  <link rel="stylesheet" type="text/css" href="static/plugins/revolution-slider/revolution/css/layers.css">
  <link rel="stylesheet" type="text/css" href="static/plugins/revolution-slider/revolution/css/navigation.css">
  
  <!-- Main Stylesheet -->
  <link rel="stylesheet" href="static/css/style.css">
  
</head>

<body id="body">

	<!-- Start Top Header Bar -->
	<jsp:include page="header.jsp" />


	<section class="bg-gray">
		<img class ="b-img" src="static/images/BookCollage-15.png" alt="" />
		<div class="img-overlay">
		<h1 class="text-overlay">The Family Reader</h1>
		<h3 class="text-overlay2">A content-curated library for home schoolers of all ages.</h3>
		</div>
	</section>

	<section class="call-to-action bg-gray section">
		<div class="container">
			<div class="row">
				<div class="col-md-12 text-center">
					<div class="title">
						<h2>SUBSCRIBE TO OUR NEWSLETTER</h2>
					</div>
					<div class="col-lg-6 col-md-offset-3">
					    <div class="input-group subscription-form">
					      <input type="text" class="form-control" placeholder="Enter Your Email Address">
					      <span class="input-group-btn">
					        <button class="btn btn-main" type="button">Subscribe Now!</button>
					      </span>
					    </div><!-- /input-group -->
				  </div><!-- /.col-lg-6 -->
	
				</div>
			</div> 		<!-- End row -->
		</div>   	<!-- End container -->
	</section>   <!-- End section -->


	<footer class="footer section text-center">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<ul class="social-media">
						<li>
							<a href=""><i class="tf-ion-social-facebook"></i></a>
						</li>
						<li>
							<a href=""><i class="tf-ion-social-instagram"></i></a>
						</li>
						<li>
							<a href="">
								<i class="tf-ion-social-twitter"></i>
							</a>
						</li>
						<li>
							<a href=""><i class="tf-ion-social-pinterest"></i></a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</footer>

    <!-- Essential Scripts  ====================================-->
    
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
    
    <!-- Revolution Slider -->
    <script type="text/javascript" src="static/plugins/revolution-slider/revolution/js/jquery.themepunch.tools.min.js"></script>
    <script type="text/javascript" src="static/plugins/revolution-slider/revolution/js/jquery.themepunch.revolution.min.js"></script>
    
    <!-- Revolution Slider -->
    <script type="text/javascript" src="static/plugins/revolution-slider/revolution/js/extensions/revolution.extension.actions.min.js"></script>
    <script type="text/javascript" src="static/plugins/revolution-slider/revolution/js/extensions/revolution.extension.carousel.min.js"></script>
    <script type="text/javascript" src="static/plugins/revolution-slider/revolution/js/extensions/revolution.extension.kenburn.min.js"></script>
    <script type="text/javascript" src="static/plugins/revolution-slider/revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
    <script type="text/javascript" src="static/plugins/revolution-slider/revolution/js/extensions/revolution.extension.migration.min.js"></script>
    <script type="text/javascript" src="static/plugins/revolution-slider/revolution/js/extensions/revolution.extension.navigation.min.js"></script>
    <script type="text/javascript" src="static/plugins/revolution-slider/revolution/js/extensions/revolution.extension.parallax.min.js"></script>
    <script type="text/javascript" src="static/plugins/revolution-slider/revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
    <script type="text/javascript" src="static/plugins/revolution-slider/revolution/js/extensions/revolution.extension.video.min.js"></script>
    <script type="text/javascript" src="static/plugins/revolution-slider/revolution/js/extensions/revolution.extension.video.min.js"></script>
    <script type="text/javascript" src="static/plugins/revolution-slider/assets/warning.js"></script>  


    <!-- Google Mapl -->
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCC72vZw-6tGqFyRhhg5CkF2fqfILn2Tsw"></script>
  <script type="text/javascript" src="static/plugins/google-map/gmap.js"></script>

    <!-- Main Js File -->
    <script src="static/js/script.js"></script>
    
  </body>
</html>