<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page isELIgnored = "false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
 <%@include file = "/WEB-INF/resources/component/all_link.jsp"%>
</head>
<body>
	<%@include file = "/WEB-INF/resources/component/navbar.jsp" %>
	<div class="container-fluid">
		<img alt="notes_image" src="<c:url value="/resources/images/stickey-notes1.jpg"></c:url>" width="100%" height="650vh">
	</div>
</body>
</html>