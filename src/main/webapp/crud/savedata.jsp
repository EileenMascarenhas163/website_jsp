<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	PreparedStatement pst, check;
	ResultSet rs;
	String mystring;

	try {
		//Class.forName("com.mysql.jdbc.Driver");
		Class.forName("org.mariadb.jdbc.Driver");

		Connection cn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/mydb", "root", "maria");
		int uid = Integer.parseInt(request.getParameter("uid"));
		String pwd = request.getParameter("pwd");
		String role = request.getParameter("role");
		String name = request.getParameter("name");

		int uid1 = Integer.parseInt(request.getParameter("uid"));
		//mystring="Valid inputs GOOD!"+uid;

		
		pst=cn.prepareStatement("update usertable set password=?,role=?,name=? where uid=?;");
		pst.setString(1, pwd);
		pst.setString(2, role);
		pst.setString(3, name);
		pst.setInt(4, uid1);
		pst.execute();
		mystring = "\nrecord edited successfully";
		//out.print("record added successfully ");

		out.print(mystring);
		out.flush();
	} catch (Exception e) {
		e.printStackTrace();
	}

	//very imp. goes to
	%>
</body>
</html>