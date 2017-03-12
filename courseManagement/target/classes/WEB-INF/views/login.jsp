<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="t" uri="http://www.springframework.org/tags"%>   

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
    	<script src="<c:url value="/static/js/materialize.js" />"></script>
    	
    	<!-- Menu -->
    	<script src="<c:url value="/static/js/menu.js" />"></script>
    	
    	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    	
    	<script type="text/javascript">
			
		</script>
		
</head>

<body>

	<!-- Background image -->
	<div class="mdc-login-background">
	</div>

	<!-- Middle page -->
	<div class="container">
		<div class="mdc-login-container">
			<div class="row center">

				<!-- Icon -->
				<div class="col s12">
					<div class="mdc-login-logo"></div>
				</div>

				<c:url var="loginUrl" value="/login" />
				<form action="${loginUrl}" method="post" class="form-horizontal">
				
					<!-- Username-->
					<div class="col s12">
						<div class="input-field invalid white-text mdc-login-form-size">
							<div class="material-icons mdc-login-icon-position prefix">account_circle</div>
								<input type="text" id="username" name="username" placeholder="Username" class="validate">
						</div>
					</div>
	
					<!-- Password -->
					<div class="col s12">
						<div class="input-field invalid white-text mdc-login-form-size">
							<div class="material-icons mdc-login-icon-position prefix">lock_outline</div>
								<input type="password" id="password" name="password" placeholder="Password" class="validate">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						</div>
					</div>
	
					<!-- Login Button -->
					<div class="col s12">
						<div class="mdc-login-button-position">
							<button id="login" type="submit" class="btn-large mdc-btn-huge waves-effect waves-light blue"  name="action">
								Login
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>

</html>