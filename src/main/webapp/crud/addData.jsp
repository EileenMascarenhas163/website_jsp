<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add data</title>
</head>
<body>
<%
PreparedStatement pst, check;
ResultSet rs;
String mystring;

try{
//Class.forName("com.mysql.jdbc.Driver");
Class.forName("org.mariadb.jdbc.Driver");

Connection cn=DriverManager.getConnection("jdbc:mariadb://localhost:3306/mydb","root","maria");
String uid=request.getParameter("uid");
String pwd = request.getParameter("pwd");
String role = request.getParameter("role");
String name = request.getParameter("name");

String uidn =request.getParameter("uid");
int value = Integer.parseInt(uidn);
int dbvalue=215000;

check = cn.prepareStatement("select * from usertable WHERE uid=?");
check.setInt(1,value);
rs=check.executeQuery();
while(rs.next()){
	dbvalue=rs.getInt("uid");
	break;
}
if (value==dbvalue){
	mystring = "UID already present in table ";
	out.print(mystring);
}

else{
	int uid1 = Integer.parseInt(request.getParameter("uid"));
	//mystring="Valid inputs GOOD!"+uid;
	
	
	pst=cn.prepareStatement("insert into usertable values(?,?,?,?)");
	pst.setInt(1,uid1);
	pst.setString(2, pwd);
	pst.setString(3,role);
	pst.setString(4,name);
	pst.execute();
	mystring="record added successfully";
	//out.print("record added successfully ");
}



out.print(mystring);
out.flush();
}
catch(Exception e){
	e.printStackTrace();
}



//very imp. goes to 


%>
</body>
</html>