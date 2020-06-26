<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section class="menu">
	<nav class="navbar navigation">
		<div class="container">
			<div id="navbar" class="navbar-collapse collapse text-center">
				<ul class="nav navbar-nav">
					<li><a id="_index" href="index">Home</a></li>
					<li><a id="_about" href="about">About</a></li>
					<li><a id="_contact" href="contact">Contact</a></li>					
					
					<!-- Contingent Links -->
					<c:choose>
						<c:when test="${empty loggedInuser}">
							<li><a href="login">Login</a></li>
							<li><a href="register">Register</a></li>
						</c:when>
						<c:otherwise> <!-- i.e., there is a logged in user, so add this to the navbar -->
							<!-- Dropdown -->
							<li class="dropdown dropdown-slide">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" 
									data-delay="350" role="button" aria-haspopup="true" 
									aria-expanded="false">Blog<span class="tf-ion-ios-arrow-down"></span>
								</a>
								<div class="dropdown-menu">
									<div class="row">
										<div class="col-lg-12">
											<ul>
												<li><a href="blog-pickspage">Staff Picks</a></li>
												<li><a href="blog-reviewspage">Member Reviews</a></li>
											</ul>
										</div>
									</div>
								</div>
							</li>
							<!-- Dropdown -->

							<!-- Dropdown -->
							<li class="dropdown dropdown-slide">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" 
									data-delay="350" role="button" aria-haspopup="true" 
									aria-expanded="false">My Profile<span class="tf-ion-ios-arrow-down"></span>
								</a>
								<div class="dropdown-menu">
									<div class="row">
										<div class="col-lg-12">
											<ul>
												<li><a href="profile">Account Details</a></li>
												<li><a href="mylist">My Reading List</a></li>
											</ul>
										</div>
									</div>
								</div>
							</li><!-- end Dropdown -->
							<!-- Dropdown -->
							<li class="dropdown dropdown-slide">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" 
									data-delay="350" role="button" aria-haspopup="true" 
									aria-expanded="false">Search<span class="tf-ion-ios-arrow-down"></span>
								</a>
								<div class="dropdown-menu">
									<div class="row">
										<div class="col-lg-12">
											<ul>
												<li><a href="searchbooks-lc">Level / Category</a></li>
												<li><a href="searchbooks-ta">Title / Author</a></li>
											</ul>
										</div>
									</div>
								</div>
							</li><!-- end Dropdown -->
							
						<c:if test="${role eq 'ADMIN'}">
							<!-- Dropdown -->
							<li class="dropdown dropdown-slide">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" 
									data-delay="350" role="button" aria-haspopup="true" 
									aria-expanded="false">Admin<span class="tf-ion-ios-arrow-down"></span>
								</a>
								<div class="dropdown-menu">
									<div class="row">
										<div class="col-lg-12">
											<ul>
												<li><a href="admin-users">Manage Users</a></li>
												<li><a href="admin-books">Manage Library</a></li>
											</ul>
										</div>
									</div>
								</div>
							</li><!-- end Dropdown -->
							</c:if>
							<li><a href="logout">Logout</a></li>
						</c:otherwise>
					</c:choose>
					<!-- end contingent links -->
					
				</ul> <!-- end ul class="nav navbar-nav" -->
			</div> <!-- end div id="navbar" -->
		</div> <!-- end div class="container" -->
	</nav>
</section>
