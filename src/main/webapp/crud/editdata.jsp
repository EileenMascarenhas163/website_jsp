<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit data</title>
</head>
<body>
<%
PreparedStatement pst;
ResultSet rs;

try{
	//Class.forName("com.mysql.jdbc.Driver");
	Class.forName("org.mariadb.jdbc.Driver");

	Connection cn=DriverManager.getConnection("jdbc:mariadb://localhost:3306/mydb","root","maria");
	String uid=request.getParameter("uid");
	String mystring;
	String search;

	if(uid!=null){
		int uid1 = Integer.parseInt(request.getParameter("uid"));
		String pwd= request.getParameter("pwd");
		//mystring="Valid inputs GOOD!"+uid;
		
		
		pst=cn.prepareStatement("select * from usertable where uid=?");
		String nm=null, role=null, pass=null; 
		Boolean found= false;
		String details=null;
		pst.setInt(1,uid1);
		//pst.setString(2,pwd);		
		rs=pst.executeQuery();
		while(rs.next()){
			found=true;
			nm=rs.getString("name");
			role=rs.getString("role");
			pass=rs.getString("password");
			break;
		}
		if(found==true){
			details=uid+":"+nm+":"+pass+":"+role;
			out.print(details);
			//out.print("Welcome "+nm+"<br>Uid: "+uid1+"<br>Role:"+role+"<br>Password:"+pass);
		}
		else{
			out.print("user not found");
		}
	}
	else{
		mystring="invalid input";
	}
	//out.print(search);
	out.flush();
	}
	catch(Exception e){
		e.printStackTrace();
	}

%>
</body>
</html>