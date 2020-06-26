<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html class="no-js">
<!--<![endif]-->
<head>

	<meta http-equiv="refresh"
		CONTENT="<%= session.getMaxInactiveInterval() %>; URL='${contextPath}/expired'" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="description" content="#">
	<meta name="author" content="#">
	
	<title>${title}</title>
	
	<!-- Mobile Specific Meta-->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- Favicon -->
	<link rel="shortcut icon" type="image/x-icon" href="static/static/images/favicon.png" />
	
	<!-- Themefisher Icon font -->
	<link rel="stylesheet" href="static/plugins/themefisher-font/style.css"> 
	
	<!-- bootstrap.min css -->
	<link rel="stylesheet" href="static/plugins/bootstrap/css/bootstrap.min.css">
		
	<!-- Main Stylesheet -->
	<link rel="stylesheet" href="static/css/style.css">

</head>

<body id="body">
	<!-- Start Top Header Bar -->
	<jsp:include page="header.jsp" />

<!-- Page bar & menu section -->
	<section class="page-header">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="content">
						<h1 class="page-name">My Profile</h1>
						<ol class="breadcrumb">
							<li><a href="index">Home</a></li>
							<li class="active">My Profile</li>
							<li class="active">Account Details</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</section>
	
<!-- ACCOUNT DETAILS & ACTIONS -->
	
	<section class="user-dashboard page-wrapper">
		<div class="container">
			<div class="row">
				<div class="col-md-9">
				
<!-- Messages & primary buttons -->
					<h4>
						${msg} ${success} <span class="text-danger">${error}</span>
					</h4>
					<div class="tabCommon mt-20">
						<ul class="nav nav-tabs">
							<li class="active"><a data-toggle="tab" href="#info" aria-expanded="false">My Contact Info</a></li>
							<li><a data-toggle="tab" href="#details" aria-expanded="true">Update Address</a></li>
							<li><a href="#cards" data-toggle="tab"> Credit Card</a></li>
						</ul>
					</div>

<!-- Update contact dropdown & form -->					
					<div class="tab-content patternbg">
						<div id="details" class="tab-pane fade">
							<div class="container">
								<div class="row">
									<div class="col-md-6">
										<div class="block text-center">
											<form:form action="updatecontact" modelAttribute="contact_info" method="post" class="text-left clearfix">
												<form:input class="form-control sm" type="hidden" path="id" value="${user_account.id}" />
												<div class="form-group">
													<form:input class="form-control" path="phone" value="" placeholder="Enter phone" />
												</div>
												<div class="form-group">
													<form:input class="form-control" path="street" value="" placeholder="Enter Address" />
												</div>
												<div class="form-group">
													<form:input class="form-control" path="city" value="" placeholder="Enter City" />
												</div>
												<div class="form-group">
													<form:input class="form-control" path="zip" value="" placeholder="Enter ZIP" />
												</div>
												<div class="form-group">
													<form:select class="form-control" path="state" id="state" required="true">
														<c:choose>
															<c:when
																test="${empty user_account.getContactInfo().state}">
																<option value="">Select State</option>
															</c:when>
															<c:otherwise>
																<option value="${user_account.getContactInfo().state}">
																	${user_account.getContactInfo().state}</option>
															</c:otherwise>
														</c:choose>
														<c:forEach items="${states}" var="state">
															<option value="${state}">${state.id}</option>
														</c:forEach>
													</form:select>
												</div>
												<div class="text-left">
													<button type="submit" class="btn btn-main btn-small btn-round">Submit</button>
												</div>
											</form:form>
										</div>
									</div>
								</div>
							</div>
						</div>
						
<!-- Display user info -->						
						<div id="info" class="tab-pane fade active in">
							<div class="dashboard-wrapper dashboard-user-profile">
								<div class="media">
									<div class="pull-left text-center">
										<c:if test="${not empty user_account.image}">
											<img class="media-object user-img"
												src="static/images/users/${user_account.id}/profile/${user_account.image}"
												style="width: 150px; height: 150px;" alt="Image">
										</c:if>
									</div>
									<div class="media-body">
										<ul class="user-profile-list">
											<li><span>Full Name:</span>
												<i class="tf-ion-android-person"></i> ${user_account.fname} ${user_account.lname}
											</li>
											<li><span>Address:</span>
												<i class="tf-ion-ios-home"></i>
												${user_account.getContactInfo().city}
												${user_account.getContactInfo().state}
												${user_account.getContactInfo().zip}
											</li>
											<li><span>Email:</span>
												<i class="tf-ion-android-mail"></i> ${user_account.email}
											</li>
											<li><span>Phones:</span>
												<i class="tf-ion-android-phone-portrait"></i> ${user_account.getContactInfo().phone} 
												<a href="#" data-toggle="modal" 
															data-target="#add-tel" 
															class="btn btn-link" 
															title="Add new phone numbers"> <i class="tf-ion-ios-plus"></i>
												</a>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						
<!-- Add new credit card dropdown & form (NOTE: data-target: #add-card refers to a TARGET div with related code at bottom-->								
						<div id="cards" class="tab-pane fade">
							<p class="text-left">
								<a href="#" data-toggle="modal" data-target="#add-card" class="btn btn-default">Add New Card</a>
							</p>
							<c:if test="${not empty user_account.getPaymentMethod()}">
								<table class="table ">
									<tr class="text-success">
										<th>#</th>
										<th>Card Number</th>
										<th>Expires</th>
										<th>Type</th>
										<th>Manage</th>
									</tr>
									<tbody>
										<c:set var="count" value="0" />
										<c:forEach var="cards"
											items="${user_account.getPaymentMethod()}">
											<c:set var="count" value="${count+1}" />
											<tr>
												<td>${count}.</td>
												<td>${cards.cardNo}</td>
												<td>${cards.expiry}</td>
												<td>${cards.cardType}</td>
												<td>
													<a href="#" data-toggle="modal" data-target="#edit${cards.id}" 
														title="Edit ${cards.cardNo}"><i class="tf-pencil2"></i>
													</a>
													
													&nbsp; | &nbsp;
													
													<a href="deletecard?id=${cards.id}" title="Delete ${cards.cardNo}" 
														onclick="confirmed(); return false;"> <i class="tf-ion-close"></i>
													</a>
													<div class="modal fade" id="edit${cards.id}">
														<div class="modal-dialog modal-sm">
															<div class="modal-content">
																<!-- Modal body -->
																<div class="modal-body">
																	<section class="forget-password-page account">
																		<div class="container">
																			<div class="row col-md-3">
																				<h2 class="text-center">Edit Card</h2>
																				<form action="editcard" method="post"
																					class="text-left clearfix">
																					<div class="form-group">
																						<input type="text" name="id" class="form-control" value="${cards.id}" id="exampleInputEmail1">
																					</div>
																					<div class="form-group">
																						<select name="cardType" id="cardType">
																							<option value="Visa">Visa</option>
																							<option value="MasterCard">MasterCard</option>
																							<option value="American Express">American Express</option>
																							<option value="Discover">Discover</option>
																						</select>
																					</div>
																					<div class="form-group">
																						<input type="number" class="form-control" name="cardNo" placeholder="${cards.cardNo}" min="14" />
																					</div>
																					<div class="form-group">
																						<input type="number" class="form-control" name="secCode" placeholder="${cards.secCode}" min="3" />
																					</div>
																					<div class="form-group">
																						<input type="month" class="form-control" name="expiry" value="${cards.expiry}" />
																					</div>
																					
																					<div class="text-left">
																						<button type="submit"
																							class="btn btn-main text-center">Update</button>
																						<button type="button"
																							class="btn btn-main btn-medium btn-danger" data-dismiss="modal">Cancel</button>
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
									</tbody>
								</table>
							</c:if>
						</div>
					</div>
				</div>
				
<!-- Manage photos -->				
				
				<div class="col-sm-3 col-xs-12"
					class="d-flex justify-content-center">
					<h3 class="text-success">${user_account.fname} ${user_account.lname}</h3>
					<div class="pull-left text-center">
						<c:if test="${not empty user_account.image}">
							<img class="media-object user-img"
								src="static/images/users/${user_account.id}/profile/${user_account.image}"
								style="width: 200px; height: 200px;" alt="Image">
						</c:if>
						<a href="#" data-toggle="modal" data-target="#add-images" class="btn btn-transparent mt-20"> 
							<c:choose>
								<c:when test="${not empty user_account.image}">
									Change Image
								</c:when>
								<c:otherwise>
									Add Photo
								</c:otherwise>
							</c:choose>
						</a>
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

<!-- **************************************    TARGET DIVS     ************************************* -->

<!-- TARGET: #add-tel -->
	<div class="modal fade" id="add-tel">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<!-- Modal body -->
				<div class="modal-body">
					<form action="addphone" method="post" role="form"
						class="contactForm">
						<h4>Add Telephone Number</h4>
						<input type="hidden" name="id" value="${user_account.id}">
						<div class="form-group">
							<input type="text" name="tel" class="form-control" placeholder="Phone Number">
						</div>
						<div class="form-group">
							<select name="type" class="form-control">
								<option value="Select">Select Type</option>
								<option value="Mobile">Mobile</option>
								<option value="Home">Home</option>
								<option value="Work">Work</option>
							</select>
						</div>
						<div class="text-left">
							<button class="btn btn-main btn-small btn-round" type="submit">Add
							</button>
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

<!-- TARGET: #add-card -->
	<div class="modal fade" id="add-card">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<!-- Modal body -->
				<div class="modal-body">
					<h4>Add New Card</h4>
					<form action="addcard" method="post" role="form"
						class="contactForm">
						<div class="form-group">
							<input type="hidden" name="id" value="${user_account.id}" />
						</div>
						<div class="form-group">
							<select name="cardType" id="cardType">
								<option value="Visa">Visa</option>
								<option value="MasterCard">MasterCard</option>
								<option value="American Express">American Express</option>
								<option value="Discover">Discover</option>
							</select>
						</div>
						<div class="form-group">
							<input type="number" class="form-control" name="cardNo" placeholder="Card Number" min="14" />
						</div>
						<div class="form-group">
							<input type="number" class="form-control" name="secCode" placeholder="Card Security" min="3" />
						</div>
						<div class="form-group">
							<input type="month" class="form-control" name="expiry" placeholder="Expiry Date" />
						</div>
						<button class="btn btn-main btn-small btn-round" type="submit">Add
						</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</form>
				</div>
			</div>
		</div>
	</div>

<!-- TARGET: #add-images -->
	<div class="modal fade" id="add-images">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<!-- Modal body -->
				<div class="modal-body">
					<form method="POST" action="addimages"
						enctype="multipart/form-data">
						<h4>Add Image</h4>
						<img id="output_image" class="col-md-12" />
						<div class="control-group">
							<div class="controls">
								<input type="file" name="file" class="form-control" onchange="preview_image(event)"> 
								<input type="hidden" name="id" value="${user_account.id}">
							</div>
						</div>
						<div class="control-group">
							<br>
							<div class="controls">
								<button type="submit" class="btn btn-default">Upload</button>
								<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

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

	<!-- Google Mapl -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCC72vZw-6tGqFyRhhg5CkF2fqfILn2Tsw"></script>
	<script type="text/javascript" src="static/plugins/google-map/gmap.js"></script>

	<!-- Main Js File -->
	<script src="static/js/script.js"></script>

	<script type="text/javascript">
		function preview_image(event) {
			var reader = new FileReader();

			reader.onload = function() {
				var output = document.getElementById('output_image');
				output.classList.add("preview");
				output.src = reader.result;
			}

			reader.readAsDataURL(event.target.files[0]);
		}
	</script>

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
