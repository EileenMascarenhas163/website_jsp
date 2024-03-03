<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String u = (String)session.getAttribute("username");

if(u==null)
	response.sendRedirect("http://localhost:5000/prac2/database/data.jsp");


%>
</body>
</html>