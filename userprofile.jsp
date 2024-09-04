<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page isELIgnored = "false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user welcome</title>
<%@include file = "/WEB-INF/resources/component/all_link.jsp"%>
</head>
<body>
<%@include file = "/WEB-INF/resources/component/navbar.jsp" %>
	<h1>Welcome ${userObj.name}</h1>
</body>
</html>