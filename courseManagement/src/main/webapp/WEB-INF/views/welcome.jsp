<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Course Management</title>
		
		<!--Import Google Icon Font-->
		<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
		
		<!--Import CSS -->
		<link type="text/css" rel="stylesheet" media="screen,projection" href="<c:url value='/static/css/materialize.css' />"/>
		
		<!--Import JS -->
		<script src="<c:url value="/static/js/jquery-2.1.4.min.js" />"></script>
    	<script src="<c:url value="/static/js/materialize.min.js" />"></script>
    	
    	<!-- Menu -->
    	<script src="<c:url value="/static/js/menu.js" />"></script>
    	
    	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    	
    	<script type="text/javascript">
					
			
		</script>
		
</head>		
		
<body>
	
<!-- Nav Top - BEGIN -->
<div class="MDC-menu-fullWidth">
	<div class="MDC-center">
		<div class="MDC-max-size">
			<nav id="logo_nav" class="MDC-navbar-top-size MDC-navbar-style mdc-shadow-0 hide-on-small-and-down">
				<div class="nav-wrapper">
					<div class="row MDC-nav-top-container">
					
						<!-- Logo -->
						<div class="col s12 m3 l2">
							<div class="MDC-nav-logo-position">
								<img src="<c:url value="/static/images/default/logo.png"/>" class="MDC-nav-logo-size"/>
							</div>
						</div>

						<!-- Search -->
						<div class="col s12 m7 l7">
							<div class="MDC-nav-search-position">
								<form>
									<div class="input-field">
										<input id="search" type="search" class="MDC-nav-search-focus" required>
											<label for="search">
												<i class="material-icons MDC-nav-search-focus">search</i>
											</label>
												<i class="material-icons MDC-nav-search-focus">close</i>
									</div>
								</form>
							</div>
						</div>
						
						<!-- Avatar -->
						<div class="col s12 m2 l3">
							<div class="MDC-nav-account-position">
								<!-- Dropdown Trigger -->
								<a class="dropdown-button " data-beloworigin="true" 
									 href='#' data-activates='account-dropdown'>
									<div class="MDC-nav-account-option-position hide-on-med-and-down">
										<i class="material-icons MDC-icon-small MDC-color-grey-light">expand_more</i>
									</div>
									<span class="mdc-nav-account-username MDC-nav-account-text-position 
															 MDC-color-grey-light hide-on-med-and-down">
										davidbehan
									</span>
									<img src="<c:url value="/static/images/temp/man-profile-circle-2.png"/>" class="MDC-avatar-circle-small mdc-nav-avatar-position"/>
								</a>
								<!-- Dropdown Structure -->
								<ul id='account-dropdown' class='dropdown-content mdc-nav-account-dropdown-position 
																								 mdc-dropdown-style'>
									<li><a id="profile" class="modal-trigger" href="profile.html">Profile</a></li>
									<li><a href="#!">Report a Problem</a></li>
									<li class="divider"></li>
									<li><a href="<c:url value="/logout" />">Logout</a></li>
									
								</ul>
							</div>
						</div>
						<!-- Avatar - END -->
						
					<!-- ROW - END -->	
					</div>
				</div>
			</nav>
			
		</div>
	</div>
</div>
<!-- Nav Top - END -->
	
<!-- Nav Menu - BEGIN -->
<div class="mdc-shadow-bottom">
	<div class="MDC-menu-fullWidth mdc-shadow-bottom">
		<header class="mdc-shadow-bottom">
			<div class="MDC-center">
				<div class="MDC-max-size">

						<nav id="menu_nav" class="MDC-navbar-menu-size MDC-navbar-style mdc-shadow-0 ">
								<div class="nav-wrapper">
									<!-- MENU -->
									<div class="row">
										<div class="col">
											<div class="MDC-nav-menu-container">
												
												<ul id="nav-mobile" class="MDC-nav-menu-ul left">										
													<a href="#" id="mobile-icon" onclick="openNav()" class="left mdc-padding-mobile-0 
																											mdc-hover-none">
														<i class="material-icons MDC-nav-tabs-icon MDC-color-grey-light">
															menu
														</i>
													</a>
													<li class="MDC-navbar-menu"><a href="courses.html">My Courses</a></li>
													<li class="MDC-navbar-menu"><a class="active MDC-navbar-active" href="badges.html">Manage Team</a></li>
													<li class="MDC-navbar-menu"><a href="badges.html">Find Courses</a></li>
													<li class="MDC-navbar-menu"><a href="badges.html">News</a></li>
												</ul>
												
												<div id="mySidenav" class="MDC-sidenav">
													<a href="javascript:void(0)" class="MDC-closebtn" onclick="closeNav()">x</a>
													<a href="#">About</a>
													<a href="#">Services</a>
													<a href="#">Clients</a>
													<a href="#">Contact</a>
												</div>
												
											</div>
										</div>
										<!-- Menu COL - END -->
										<div id="fake-btn" class="MDC-fake">
											<a id="float-btn" class="btn-floating btn-large waves-effect waves-light
																mdc-btn-circle mdc-background-blue-dark
																mdc-border-blue-dark mdc-nav-FloatButton-position
																right">
												<i class="material-icons mdc-icon-medium">done</i>
											</a>
										</div>
										
									</div>
								</div>
						</nav>

				</div>
			</div>
		</header>
	</div>
</div>
<!-- Nav Menu - END -->


</body>
</html>