<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page isELIgnored = "false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<%@include file = "/WEB-INF/resources/component/all_link.jsp"%>
<style>


#notification {
    position: fixed;
    top: 60px;
    right: -300px; /* Initially hidden off-screen */
    background-color: crimson;
    color: white;
    padding: 10px;
    border-radius: 5px;
    box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
    width: 250px;
    transition: right 0.5s ease-in-out;
}

#notification.show {
    right: 20px; /* Slide in to show */
}
	
</style>
</head>
<body style="background-color:aliceblue">
<%@include file = "/WEB-INF/resources/component/navbar.jsp" %>
<c:if test = "${not empty msg }">
		<div id="notification">
			<p>${msg}</p>
		</div>
		
		<c:remove var="msg"/>
	</c:if>
	<div class="container mt-5">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card">
				
					<div class="card-header">
						<h3 class="text-center">Login Page</h3>
					</div>
					
					<div class="card-body">
						<form action="loginUser" method="post">
							
							<div class="mb-3">
								<label>Enter Email</label>
								<input type="email" name="email" class="form-control">
							</div>
							
							<div class="mb-3">
								<label>Enter Password</label>
								<input type="password" name="password" class="form-control">
							</div>
							
							<button class="btn btn-dark col-md-12">Login</button>
							
							<div class="card-footer text-center">
								Don't have an account <a href="register" class="text-decoration-none">Create One</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script>
	document.addEventListener('DOMContentLoaded', function() {
	    const notification = document.getElementById('notification');
	    
	    // Show the notification
	    notification.classList.add('show');
	    
	    // Hide the notification after 5 seconds
	    setTimeout(function() {
	        notification.classList.remove('show');
	    }, 3000);
	});

	</script>
</body>
</html>