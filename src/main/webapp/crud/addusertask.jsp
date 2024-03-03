<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  import="java.sql.DriverManager, java.sql.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
PreparedStatement ps = null;
ResultSet rs = null;

try{
	Class.forName("org.mariadb.jdbc.Driver");
	Connection cn =  DriverManager.getConnection("jdbc:mariadb://localhost:3306/mydb", "root", "maria");
	String uid = request.getParameter("uid");
	int u = Integer.parseInt(uid);
	String pwd = request.getParameter("pwd");
	String role = request.getParameter("role");
	String nm = request.getParameter("name");
	
	ps= cn.prepareStatement("insert into usertable values(?,?,?,?)");
	ps.setInt(1, u);
	ps.setString(2, pwd);
	ps.setString(3, role);
	ps.setString(4, nm);
	ps.execute();
	
	out.print("records added");
}

catch(Exception e){
	e.printStackTrace();
}




%>
</body>
</html>