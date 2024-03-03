<%@page import="java.sql.*"%>
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
PreparedStatement pst;
ResultSet rs;
try {
Class.forName("org.mariadb.jdbc.Driver");
Connection cn =DriverManager.getConnection("jdbc:mariadb://localhost:3306/mydb","root","maria");
String uid=(String) request.getParameter("uid");
int u=Integer.parseInt(uid);
String pwd=(String) request.getParameter("pwd");
pst=cn.prepareStatement("select * from usertable where uid=? and password=?");
pst.setInt(1, u);
pst.setString(2, pwd);
rs=pst.executeQuery();
boolean found=false;
String role=null;
String nm = null;
while (rs.next()) {
role=rs.getString("role");
nm=rs.getString("name");
found = true;
break;
}
if (found == false)
out.print("user not in db");
else{
out.print("user exist with name and role <br>");
out.print("Name : "+ nm + "<br>Role : " + role);
}
session.setAttribute("username", nm);
} catch (Exception e) {
// Block of code to handle errors
e.printStackTrace();
} finally {
//out.print("It worked");
}
%>
</body>
</html>