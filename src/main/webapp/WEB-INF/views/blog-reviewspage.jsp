<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>

<html class="no-js"> 
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="description" content="Aviato E-Commerce Template">
  
  <meta name="author" content="Themefisher.com">

  <title>${title}</title>

  <!-- Mobile Specific Meta-->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <!-- Favicon -->
  <link rel="shortcut icon" type="image/x-icon" href="images/favicon.png" />
  
  <!-- Themefisher Icon font -->
  <link rel="stylesheet" href="static/plugins/themefisher-font/style.css">

  <!-- bootstrap.min css -->
  <link rel="stylesheet" href="static/plugins/bootstrap/css/bootstrap.min.css">
    
  <!-- Main Stylesheet -->
  <link rel="stylesheet" href="static/css/style.css">

</head>

<body id="body">

	<jsp:include page="header.jsp" />

	<section class="img-page-header" >
		<div class="container">
			<div class="row">
			<div class="col-md-2">
				<img src="static/images/art/writer.jpg" height="150px" width="150px">
			</div>			
				<div class="col-md-10">
					<div class="">
						<h1 class="bar-title">Blog - Member Reviews</h1>
					</div>
				</div>
			</div>
		</div>
	</section>


	<div class="page-wrapper">
		<div class="container">
		<div class="row">
			<div class="col-md-12">
				<a href="newpost"><button class="btn btn-info pull-right">Add Post</button></a>
			</div>
		</div>
 			<c:forEach var="post" items="${posts}">
				<div class="row">
					<div class="col-md-12">
						<div class="post">
							<div class="post-media post-thumb">
								<a href="blog-single.html"> <img
									src="images/blog/blog-post-1.jpg" alt="">
								</a>
							</div>

							<h3 class="posttitle">${post.postTitle}</h3>
							<div class="post-meta">
								<ul>
									<li><i class="tf-ion-ios-calendar"></i><b> ${post.postDate}</b></li>
									<li><i class="tf-ion-android-person"></i><b> ${post.postAuthor}</b></li>
								</ul>
							</div>
							<c:if test="${post.quote != 	null}">
							<div class="post-quote">
								<p style="font-family: 'Palatino Linotype', 'Book Antiqua', Palatino, serif;">"${post.quote}"</p>
							</div>
							</c:if>
							<div>
								<p>${post.postContent}</p>
							</div>

						</div>
					</div>
				</div>
			</c:forEach>
 		</div>
	</div>


	<footer class="footer section text-center">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<ul class="social-media">
					<li>
						<a href="">
							<i class="tf-ion-social-facebook"></i>
						</a>
					</li>
					<li>
						<a href="">
							<i class="tf-ion-social-instagram"></i>
						</a>
					</li>
					<li>
						<a href="">
							<i class="tf-ion-social-twitter"></i>
						</a>
					</li>
					<li>
						<a href="">
							<i class="tf-ion-social-pinterest"></i>
						</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
</footer>

    <!-- 
    Essential Scripts
    =====================================-->
    
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
    
    <!-- Google Mapl -->
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCC72vZw-6tGqFyRhhg5CkF2fqfILn2Tsw"></script>
  <script type="text/javascript" src="static/plugins/google-map/gmap.js"></script>

    <!-- Main Js File -->
    <script src="static/js/script.js"></script>
    


  </body>
  </html>