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
						<h1 class="bar-title">Blog - New Post</h1>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="addbook">
		<div class="form-group">
			<h5 style="color: red"><i>${msg} ${success}</i></h5>
			<h3 style="color: red"><i>${danger}</i></h3>

			<form class="text-center border border-light p-5" action="addpost" 
					id="" method="post" >

				<!-- Type -->
				<c:choose>
					<c:when test="${role ne 'USER'}">
						<div class="form-group row">
							Select type of post: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" id="pick" name="type" value="pick" checked>
							<label for="pick">Staff Pick</label> 
							&nbsp;&nbsp; | &nbsp;&nbsp;
							<input type="radio" id="review" name="type" value="review">
							<label for="review">Member Review</label><br>
						</div>
					</c:when>
					<c:otherwise>
						<input type="hidden" name="type" value="review">
					</c:otherwise>
				</c:choose>
				
				<!-- Title -->
				<div class="form-group row">
					<input type="text" id="title" name="title" class="form-control mb-4"
						placeholder="Post title"  />
				</div>
				
				<!-- Quote -->
				<div class="form-group row">
					<input type="text" id="quote" name="quote" class="form-control mb-4"
						placeholder="Quote from the book..."  />
				</div>
				
				<!-- Content -->
				<div class="form-group row">
					<input type="text" id="content" name="content" class="form-control mb-4"
						placeholder="Write your post here..." />
				</div>

				<!-- Send button -->
				<div id="outer">
					<div class="inner">
						<button type="submit" class="btn">Add Post</button> 
					</div>
					<div class="inner">
						<button type="reset" id="reset" class="btn" 
							onClick="clearform()">Clear Form</button>
					</div>
					<div class="inner">
						<a href="admin-books"><button type="button" class="btn">Exit Form</button></a>
					</div>
					
				</div>
			</form>		
		</div>
	</section>





    <!-- Essential Scripts =====================================-->
    
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