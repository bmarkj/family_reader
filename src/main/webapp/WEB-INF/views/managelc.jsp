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
						<h1 class="page-name">Control Panel: Levels & Categories</h1>
						<ol class="breadcrumb">
							<li><a href="admin-books">Admin</a></li>
							<li class="active">Manage Library</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="user-dashboard page-wrapper">
		<div class="container text-center">
			<h3>Manage Levels & Categories</h3>
			<h4 class="msg success">${msg}${success}</h4>
			<div id="outer">
				<div class="inner">
					<a href="addlevel"><button class="btn">Add A Level</button></a>
				</div>
				<div class="inner">
					<form action="getalllevels" method="get">
						<button class="btn" type="submit">Edit Levels</button>
					</form>
				</div>
				&nbsp;&nbsp;
				<div class="inner">
					<a href="addcategory"><button class="btn">Add A Category</button></a>
				</div>
				<div class="inner">
					<form action="getallcategories" method="get">
						<button class="btn" type="submit">Edit Categories</button>
					</form>
				</div>
			</div>
		</div>
	</section>

	<section>
		<c:if test="${levels != null}">
			<table class=" table lctable">
				<tr>
					<th>Level</th>
					<th>Action</th>
				</tr>

				<c:forEach var="level" items="${levels}">
				<tr>
					<td>${level.name}</td>
					<td>
						<a href="#" data-toggle="modal"
							data-target="#editlevel${level.id}" title="Edit ${level.name}">
							<i class="tf-pencil2"></i>
						</a>
						
						<div class="modal fade" id="editlevel${level.id}">
							<div class="modal-dialog modal-md">
								<div class="modal-content">
									<!-- Modal body -->
									<div class="modal-body">
										<section class="forget-password-page account">
											<div class="container">
												<div class="row col-md-6">
													<h2 class="text-center">Edit Level</h2>
													<form action="editlevel" method="post"
														class="text-left clearfix">
														<div class="form-group">
															<input type="text" id="name" name="name"
																class="form-control" value="${level.name}" />
														</div>
														<div id="outer">
															<div class="inner">
																<button type="submit" class="btn">Update</button>
															</div>
															<div class="inner">
																<button type="reset" class="btn">Clear</button>
															</div>
															<div class="inner">
																<a href="managelc"><button type="button"
																		class="btn">Exit</button></a>
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
	
	<section>
		<c:if test="${categories != null}">
			<table class=" table lctable">
				<tr>
					<th>Category</th>
					<th>Action</th>
				</tr>

				<c:forEach var="category" items="${categories}">
				<tr>
					<td>${category.name}</td>
					<td>
						<a href="#" data-toggle="modal"
							data-target="#editcategory${category.id}" title="Edit ${category.name}">
							<i class="tf-pencil2"></i>
						</a>
						
						<div class="modal fade" id="editcategory${category.id}">
							<div class="modal-dialog modal-md">
								<div class="modal-content">
									<!-- Modal body -->
									<div class="modal-body">
										<section class="forget-password-page account">
											<div class="container">
												<div class="row col-md-6">
													<h2 class="text-center">Edit Category</h2>
													<form action="editcategory" method="post"
														class="text-left clearfix">
														<div class="form-group">
															<input type="text" id="name" name="name"
																class="form-control" value="${category.name}" />
														</div>
														<div id="outer">
															<div class="inner">
																<button type="submit" class="btn">Update</button>
															</div>
															<div class="inner">
																<button type="reset" class="btn">Clear</button>
															</div>
															<div class="inner">
																<a href="managelc"><button type="button"
																		class="btn">Exit</button></a>
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