<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta name="_csrf" content="${_csrf.token}"/> 
		<meta name="_csrf_header" content="${_csrf.headerName}"/>
		
		<title>Course Management</title>
		
		<!--Import Google Icon Font-->
		<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
		
		<!--Import CSS -->
		<link type="text/css" rel="stylesheet" media="screen,projection" href="<c:url value='/static/css/materialize.css' />"/>
		
		<!--Import JS -->
		<script src="<c:url value="/static/js/jquery-2.1.4.min.js" />"></script>
    	<script src="<c:url value="/static/js/materialize.js" />"></script>
    	
    	<!-- Menu -->
    	<script src="<c:url value="/static/js/menu.js" />"></script>
    	
    	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    	
    	<script type="text/javascript">
			$(document).ready(function(){

				$('#profile-user_type').material_select();
				$('.modal-trigger').leanModal();

			});
			
			  //Function to remove a team
			function removeTeam(id){
				$.post("team/removeUserTeam", {'id' : id}, function(){
					$("#team_"+id).hide();	
				});
			}
			
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
									<li><a id="profile" class="modal-trigger" href="<c:url value="/profile" />">Profile</a></li>
									<li><a href="#!">Report a Problem</a></li>
									<li class="divider"></li>
									<li><a href="<c:url value="/logout" />">Logout</a></li>
								</ul>
							</div>
						</div>
						<!-- Avatar - END -->
					</div>
					<!-- ROW - END -->	
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
											<li class="MDC-navbar-menu"><a class="active MDC-navbar-active" href="<c:url value="/team" />">Manage Team</a></li>
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
								<a id="float-btn" class="modal-trigger btn-floating btn-large waves-effect waves-light
														modal-trigger	mdc-btn-circle mdc-background-blue-dark
														mdc-border-blue-dark mdc-nav-FloatButton-position
														right" href="#modalAdd">
									<i class="material-icons mdc-icon-medium">add</i>
								</a>
								
								<!-- Modal Add Structure -->
								<div id="modalAdd" class="modal MDC-margin-menuSize MDC-background-transparent mdc-shadow-0">
									<div class="modal-content">

										<!-- TEAM Modal - BEGIN -->
										<div onclick="location.href='<c:url value="/team/addTeam" />';" style="cursor: pointer;" 
										class="left MDC-team-cardModal-size mdc-modal-content-style mdc-card">
											<!-- Team Icon -->
											<div class="row">
												<div class="center MDC-margin-top-20">
													<a id="edit-avatar" class="btn-floating btn waves-effect 
																			   mdc-background-blue-dark mdc-border-blue-dark mdc-absolute
																			   mdc-profile-add-position mdc-modalTeam-icon-position right">
													  <i class="material-icons">add</i>
													</a>
													<img src="<c:url value="/static/images/default/team-default-2.png"/>"
														class="mdc-avatar-circle-large mdc-shadow-default"/>
												</div>
											</div>

											<!-- Team Name -->
											<div class="row">
												<div class="MDC-modal-info-position">
													<font class="truncate center-align MDC-font-username MDC-color-grey-dark">
														Add	Team
													</font>
												</div>
											</div>
										</div>
										<!-- TEAM Modal - END -->

										<!-- USER Modal - BEGIN -->
										<div onclick="location.href='<c:url value="/manager/adduser" />';" style="cursor: pointer;" 
										class="right MDC-team-cardModal-size mdc-modal-content-style mdc-card">

											<!-- Team Icon -->
											<div class="row">
												<div class="center MDC-margin-top-20">
													<a id="edit-avatar" class="btn-floating btn waves-effect
																			   mdc-background-blue-dark mdc-border-blue-dark mdc-absolute
																			   mdc-profile-add-position mdc-modalTeam-icon-position right">
													  <i class="material-icons ">add</i>
													</a>
													<img src="<c:url value="/static/images/default/avatar-default.png"/>"
														class="mdc-avatar-circle-large mdc-shadow-default"/>
												</div>
											</div>

											<!-- Team Name -->
											<div class="row">
												<div class="MDC-modal-info-position">
													<font class="truncate center-align MDC-font-username MDC-color-grey-dark">
														Add	User
													</font>
												</div>
											</div>
										</div>
										<!-- USER Modal  - END -->
								  	</div>
								</div>
								<!-- Add Modal - END -->
							</div>
						</div>
					</nav>
				</div>
			</div>
		</header>
	</div>
</div>
<!-- Nav Menu - END -->

<!-- Profile first row - Begin -->
<div class="MDC-fullWidth">
	<div class="MDC-center">
		<div class="MDC-max-size">
			<div class="row MDC-margin-top-20">
				<div class="MDC-default-container">
					<div class="col s12 m12 l6 left">
						<div class="MDC-explore-text-position left">
							<div class="MDC-title-font">
								<font class="MDC-color-grey-dark">Manage</font>
								<font class="MDC-color-grey-light2">/</font>
								<font class="MDC-color-grey-dark">Team</font>
								<i class="material-icons MDC-icon-small MDC-title-icon-position">
									<font class="MDC-color-grey-dark">expand_more</font>
								</i>
								<font class="MDC-color-grey-light2">/</font>
								<font class="MDC-color-blue-dark">All Teams</font>
								<font class="MDC-color-grey-light2">/</font>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Profile first row - End -->

<!-- Profile Content - Begin -->
<div class="MDC-fullWidth">
	<div class="MDC-center">
		<div class="MDC-max-size">
			<div class="row MDC-margin-top-12">
				<div class="MDC-default-container">
				
					<c:forEach items="${teams}" var="team">
					
					
					<!-- Teams - Begin -->
					<div class="col" id="team_${team.id}">
						<div class="MDC-team-card-size mdc-card">
							<a href="#"  onClick="removeTeam(${team.id})" 
								class="btn-floating btn waves-effect 
								mdc-background-black-light mdc-absolute 
								mdc-team-floatbtn-position right">
								<i class="material-icons">clear</i>
							</a>
							<!-- Team Icon -->
							<div class="row">
								<div class="center MDC-margin-top-20">
									<img src="<c:url value="/static/images/temp/team-${team.teamName}.png"/>" 
										class="mdc-avatar-circle-large mdc-shadow-default"/>
								</div>
							</div>
							
							<!-- Team Name -->
							<div class="row">
								<div class="MDC-profile-info-position">
									<font class="truncate center-align MDC-font-username MDC-color-grey-dark">
											${team.teamName}
									</font>
								</div>
							</div>

							<!-- Members -->
							<div class="row">
								<div class="MDC-profile-info-position">
									<font class="truncate center-align MDC-font-jobInfo MDC-color-grey">
										28 Members
									</font>
								</div>
							</div>
							
							<!-- Divider -->
							<div class="row">
								<div class="MDC-profile-info-position">
									<div class="mdc-divider MDC-margin-top-20">
									</div>
								</div>
							</div>
							
							<!-- Department -->
							<div class="row">
								<div class="MDC-team-deparment-position">
									<div class="truncate MDC-font-jobInfo">

										<font class="mdc-color-grey-dark">
											Department:
										</font>
										<font class="MDC-color-grey">
											Consulting
										</font>

									</div>
								</div>
							</div>
						</div>
					</div>
					</c:forEach>
					<!-- Teams - End -->
					
				</div>
			</div>
		</div>
	</div>
</div>



</body>
</html>