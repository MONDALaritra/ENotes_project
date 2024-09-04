<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Your Notes</title>
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
	<div class="container mt-5">
		<div class="row">
			<div class="col-md-10 offset-md-1">
				<div class="card">
				
					<div class="card-header">
						<h3 class="text-center">Add Your Notes here</h3>
					</div>
					
					<div class="card-body">
						<form action="savenotes" method="post">
							<div class="mb-3">
								<label>Enter Title</label>
								<input type="text" name="title" class="form-control">
							</div>
						
							<div class="mb-3">
								<label>Enter Description</label>
								<textarea rows="6" cols="" class="form-control" name="description"></textarea>
							</div>
							<button class="btn btn-dark col-md-12">Save Note <i class="fa-solid fa-pen-nib"></i></button>
							
							
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

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
</html>