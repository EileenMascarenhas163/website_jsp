<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Data</title>
</head>
<body>
<%
//System.out.print("process called");
//String mystring="itsdelete";
//out.print(mystring);
//out.flush();//very imp. goes to 


PreparedStatement pst;
ResultSet rs;

try{
//Class.forName("com.mysql.jdbc.Driver");
Class.forName("org.mariadb.jdbc.Driver");

Connection cn=DriverManager.getConnection("jdbc:mariadb://localhost:3306/mydb","root","maria");
String uid=request.getParameter("uid");
String mystring;

if(uid!=null){
	int uid1 = Integer.parseInt(request.getParameter("uid"));
	//mystring="Valid inputs GOOD!"+uid;
	
	
	pst=cn.prepareStatement("delete from usertable where uid=?");
	pst.setInt(1,uid1);
	
	pst.execute();
	mystring="record deleted successfully";
	//out.print("record added successfully ");
}
else{
	mystring="invalid input";
}


out.print(mystring);
out.flush();
}
catch(Exception e){
	e.printStackTrace();
}



%>
</body>
</html>