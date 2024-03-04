<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
CallableStatement st;
ResultSet rs;
try{
	Class.forName("org.mariadb.jdbc.Driver");
	Connection cn =  DriverManager.getConnection("jdbc:mariadb://localhost:3306/hello", "root", "maria");
	String uid = request.getParameter("uid");
	int u = Integer.parseInt(uid);
	st= cn.prepareCall("{call display(?)}");
	st.setInt(1, u);
	
	rs=st.executeQuery();
	while(rs.next()){
		out.print(rs.getString("name")+ " " + rs.getString("role")+ " " +rs.getString("city")+ " " +rs.getString("country"));
	}
	
	
}
catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>
