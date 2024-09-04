<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page isELIgnored = "false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Your Notes</title>
 <%@include file = "/WEB-INF/resources/component/all_link.jsp"%>
  <style>
#notification {
    position: fixed;
    top: 60px;
    right: -300px; /* Initially hidden off-screen */
    background-color: green;
    color: white;
    padding: 10px;
    border-radius: 5px;
    box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
    width: 250px;
    transition: right 0.5s ease-in-out;
    z-index:5;
}

#notification.show {
    right: 20px; /* Slide in to show */
}
	
</style>
</head>
<body>
<%@include file = "/WEB-INF/resources/component/navbar-login.jsp" %>
<c:if test = "${not empty msg }">
		<div id="notification">
			<p>${msg}</p>
		</div>
		
		<c:remove var="msg"/>
	</c:if>
	<div class="container-fluid p-4">
	<h3 class="text-center">View All Notes</h3>
		<div class="row">
		<c:forEach items="${list}" var="notes">
			<div class="col-md-10 offset-md-1 mt-2">
				<div class="card" style="background-color:aliceblue">
					<div class="card-body">
						<div class="text-center">
							<img alt="notes2" src="<c:url value="/resources/images/notes2.jpg"></c:url>" width="150px" height="150px">
						</div>
						
							<p>${notes.title}</p>
							<p>${notes.description}</p>
							<p>Publish Date : ${notes.date}</p> 
						
						<div class="text-center">
							<a href="editNotes?id=${notes.id}" class="btn btn-warning">Edit Notes</a>
							<a href="deleteNotes?id=${notes.id}" class="btn btn-danger">Delete Notes</a>
						</div>
					</div>
					
					
				</div>
			</div>
		</c:forEach>	
			
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