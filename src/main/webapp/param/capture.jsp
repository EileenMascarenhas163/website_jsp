<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1 style="text-align:center; color:blue"> Registration Details are given below :  </h1>
<% 

Enumeration e = request.getParameterNames();
String[] gen = request.getParameterValues("gender");// it stores the name of the input but not the content eg; course 
while(e.hasMoreElements()){
	
	
	String vari = (String)e.nextElement();
	String value = request.getParameter(vari);
	out.print( " <h1> " + value);
	
	
	
}


%>
</body>
</html>