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
			<div class="col-md-2">
				<img src="static/images/art/jones2.jpg" height="150px" width="150px">
			</div>			
				<div class="col-md-10">
					<div class="">
						<h1 class="bar-title">My Reading List</h1>
					</div>
				</div>
			</div>
		</div>
	</section>
	
		
	<section>
		<c:choose>
			<c:when test="${books != null}">
				<h4 style="text-align: center; font-style: italic; color: #5BC0DE;">${level}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${category}</h4>
				<h4 style="text-align: center; font-style: italic; color: red"><i>${danger}</i></h4>
				<table class="table mylisttable" >
					<tr >
						<th>Title</th>
						<th>Author</th>
						<th>Level</th>
						<th>Category</th>					
						<th style="text-align: center;">Action</th>
					</tr>
					<c:forEach var="book" items="${books}">
					<tr>
						<td><a href="#" >${book.title}</a></td>
						<td>${book.author}</td>
						<td>${book.level}</th>
						<td>${book.category}</th>					
						<td style="text-align: center;"> 
							<a href="deletemybook?bookId=${book.id}" title="Delete ${book.title}" 
								onclick="confirmed(); return false;"> <i class="tf-ion-close"></i>
							</a>
						</td>
					</tr>
					</c:forEach>
				</table>
			</c:when>
			<c:otherwise>
				<h4 style="text-align: center; font-style: italic; color: #5BC0DE;">${msg}</h4>
			</c:otherwise>
			</c:choose>
	</section>
	
	
<!-- *********************     SCRIPTS     *********************** -->
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

	<!-- Revolution Slider -->
	<script type="text/javascript"
		src="static/plugins/revolution-slider/revolution/js/jquery.themepunch.tools.min.js"></script>
	<script type="text/javascript"
		src="static/plugins/revolution-slider/revolution/js/jquery.themepunch.revolution.min.js"></script>

	<!-- Revolution Slider -->
	<script type="text/javascript"
		src="static/plugins/revolution-slider/revolution/js/extensions/revolution.extension.actions.min.js"></script>
	<script type="text/javascript"
		src="static/plugins/revolution-slider/revolution/js/extensions/revolution.extension.carousel.min.js"></script>
	<script type="text/javascript"
		src="static/plugins/revolution-slider/revolution/js/extensions/revolution.extension.kenburn.min.js"></script>
	<script type="text/javascript"
		src="static/plugins/revolution-slider/revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
	<script type="text/javascript"
		src="static/plugins/revolution-slider/revolution/js/extensions/revolution.extension.migration.min.js"></script>
	<script type="text/javascript"
		src="static/plugins/revolution-slider/revolution/js/extensions/revolution.extension.navigation.min.js"></script>
	<script type="text/javascript"
		src="static/plugins/revolution-slider/revolution/js/extensions/revolution.extension.parallax.min.js"></script>
	<script type="text/javascript"
		src="static/plugins/revolution-slider/revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
	<script type="text/javascript"
		src="static/plugins/revolution-slider/revolution/js/extensions/revolution.extension.video.min.js"></script>
	<script type="text/javascript"
		src="static/plugins/revolution-slider/revolution/js/extensions/revolution.extension.video.min.js"></script>
	<script type="text/javascript"
		src="static/plugins/revolution-slider/assets/warning.js"></script>

	<!-- Google Mapl -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCC72vZw-6tGqFyRhhg5CkF2fqfILn2Tsw"></script>
	<script type="text/javascript" src="static/plugins/google-map/gmap.js"></script>

	<!-- Main Js File -->
	<script src="static/js/script.js"></script>


	<script>
		function confirmed() {
			if (confirm('You are about to delete, Do you want to proceed?')) {
					document.getElementById("del").submit();
					return true;
			} else {
				return false;
			}
		}

		$("#searchnow").keyup(function() {
			var value = this.value.toLowerCase().trim();

			$("table tr").each(function(index) {
				if (!index)
					return;
				$(this).find("td").each(function() {
					var id = $(this).text().toLowerCase().trim();
					var not_found = (id.indexOf(value) == -1);
					$(this).closest('tr').toggle(!not_found);
					return not_found;
				});
			});
		});
	</script>
</body>
</html>