
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page isELIgnored = "false" %>

<!-- -start Navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
  <div class="container-fluid">
    <a class="navbar-brand" href="#"><i class="fa-solid fa-book"></i> E-Notes</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <c:if test="${empty userObj}">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="home"><i class="fa-solid fa-house"></i> Home</a>
        </li>
         </c:if>
        <c:if test="${not empty userObj}">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="addnotes">Add Notes</a>
        </li>
       <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="viewnotes">View Notes</a>
        </li>
          </c:if> 
      </ul>
      
       <ul class="navbar-nav ms-2 mb-4 mb-lg-1">
       <c:if test="${empty userObj}">
       		<li class="nav-item">
          		<a class="nav-link btn btn-outline-warning me-2" aria-current="page" href="register">Register</a>
	        </li>
	        <li class="nav-item">
	          	<a class="nav-link btn btn-outline-success" aria-current="page" href="login">Login</a>
	        </li>
       </c:if>
        
      <c:if test="${not empty userObj}">
       		<li class="nav-item">
          		<a class="nav-link btn btn-dark me-2" aria-current="page" href="#"> <i class="fa-solid fa-user"></i> ${userObj.name}</a>
	        </li>
	        <li class="nav-item">
	          	<a class="nav-link btn btn-outline-danger" aria-current="page" href="logout">Logout</a>
	        </li>
       </c:if>
        
      </ul>
      
    </div>
  </div>
</nav>
<!-- End navbar -->