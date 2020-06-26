<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<c:if test="${role ne 'ADMIN'}">
	<c:redirect url="/login" />
</c:if>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="ISO-8859-1">
		<meta http-equiv="refresh"
		CONTENT="<%= session.getMaxInactiveInterval() %>; URL='${pageContext.request.contextPath}/expired'" />
		
		<title>${title}</title>
		
		<!-- Mobile Specific Meta-->
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<!-- Favicon -->
		<link rel="shortcut icon" type="image/x-icon"
			href="static/images/favicon.png" />
		
		<!-- Themefisher Icon font -->
		<link rel="stylesheet" href="static/plugins/themefisher-font/style.css">
		<!-- bootstrap.min css -->
		<link rel="stylesheet"
			href="static/plugins/bootstrap/css/bootstrap.min.css">
		
		<!-- Main Stylesheet -->
		<link rel="stylesheet" href="static/css/style.css">
	</head>
	
	<body id="body">
		<jsp:include page="header.jsp" />
	
	<section class="img-page-header" >
		<div class="container">
			<div class="row">
			<div class="col-md-2">
				<img src="static/images/art/copley29.jpg" height="150px" width="150px">
			</div>			
				<div class="col-md-10">
					<div class="">
						<h1 class="bar-title">Control Panel: Books</h1>
					</div>
				</div>
			</div>
		</div>
	</section>
	
		<section class="user-dashboard page-wrapper">
			<div class="container text-center">
				<h3>Manage Library</h3>
				<h4 class="msg success">${msg} ${success}</h4>
				<br>
				<div class="container" style="width: 50%">
					<div class="row" >
<!-- 						<div class="column">
							<a href="managelc"><button class="btn">Manage L & C</button></a>
						</div>
						&nbsp;&nbsp;&nbsp;
 -->					
 						<div class="col col-md-4">
							<a href="addbook" class="pull-right"><button class="btn">Add A Book</button></a>
						</div>

						<div class="col col-md-4" style="padding-left: 0; padding-right: 0;">
							<form action="getallbooks" method="get">
								<button class="btn pull-right" type="submit">Get All Books</button>
							</form>
						</div>
	
						<div class="col col-md-4">
							<div class="form-inline">
								<div class="form-group pull-left">
									<input 	type="search" name="keyword" id="searchnow"
											class="form-control" placeholder="Filter by keyword...">
								</div>
							</div>
						</div>	
					</div>
				</div>
			</div>
		</section>
		
		<section>
 			<c:if test="${books != null}"> 
			<table class="table allbookstable" >
				<tr>
					<th>Title</th>
					<th>Author</th>
					<th>Reading Level</th>
					<th>Category</th>
					<th>Action</th>
				</tr>
				
				<c:forEach var="book" items="${books}">
				<tr>
					<td>${book.title}</td>
					<td>${book.author}</td>
					<td>${book.level.toString()}</td>
					<td>${book.category.toString()}</td>
					<td>
						<a href="#" data-toggle="modal" data-target="#editbook${book.id}" 
							title="Edit ${book.title}"><i class="tf-pencil2"></i></a>
					 	&nbsp; | &nbsp; 
						<a href="deletebook?id=${book.id}" title="Delete ${book.title}" 
							onclick="confirmed(); return false;"> <i class="tf-ion-close"></i>
						</a>
											
						<div class="modal fade" id="editbook${book.id}">
							<div class="modal-dialog modal-md">
								<div class="modal-content">
									<!-- Modal body -->
									<div class="modal-body">
										<section class="forget-password-page account">
											<div class="container">
												<div class="row col-md-6">
													<h2 class="text-center">Edit Book</h2>
													<form action="editbook" method="post" class="text-left clearfix">
														<div>
															<input type="hidden" name="id" value="${book.id}" />
														</div>
																<div class="form-group">
																<input type="text" id="title" name="title"
																	class="form-control" value="${book.title}" />
															</div>
															<div class="form-group">
																<input type="text" id="author" name="author"
																	class="form-control" value="${book.author}" />
															</div>
															<div class="form-group">
																<select value="${book.level.id}" class="custom-select mb-4 myselect" name="level">
																	<c:forEach var="level" items="${levels}">
																		<c:choose>
																			<c:when test="${book.level.id == level.id }">
																				<option value="${level.id}" selected>${level.name}</option>
																			</c:when>
																			<c:otherwise>
																				<option value="${level.id}">${level.name}</option>
																			</c:otherwise>
																		</c:choose>
																	</c:forEach>
																</select>
															</div>
															
															<div class="form-group">
																<select value="${book.category.id}" class="custom-select mb-4 myselect" name="category">
																	<c:forEach var="category" items="${categories}">
																	<c:choose>
																		<c:when test="${book.category.id == category.id }">
																			<option value="${category.id}" selected>${category.name}</option>
																		</c:when>
																		<c:otherwise>
																			<option value="${category.id}">${category.name}</option>
																		</c:otherwise>
																	
																	</c:choose>
																	</c:forEach>
																</select>
															</div>
															<div class="form-group">
																<input type="text" id="isbn" name="isbn"
																	class="form-control" placeholder="isbn ${book.isbn}" />
															</div>

															<div id="outer">
																<div class="inner">
																	<button type="submit" class="btn">Update</button>
																</div>
																<div class="inner">
																	<button type="reset" class="btn">Clear</button>
																</div>
																<div class="inner">
																	<button class="btn">
																		<a href="admin-books">Exit</a>
																	</button>
																</div>
															</div>


													</form>
												</div>
											</div>
										</section>
									</div>
								</div>
							</div>
						</div>
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