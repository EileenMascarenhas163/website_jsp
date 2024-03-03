<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  import="java.sql.DriverManager, java.sql.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
  <table border="3">

<%
PreparedStatement ps = null;
ResultSet rs = null;

try{
	
    
	Class.forName("org.mariadb.jdbc.Driver");
	Connection cn =  DriverManager.getConnection("jdbc:mariadb://localhost:3306/mydb", "root", "maria");
	String cb = request.getParameter("cb");
	
    if (cb==null){
    	
    	String uid = request.getParameter("uid");
        int u = Integer.parseInt(uid);
    	ps = cn.prepareStatement("delete from usertable where uid=?");
    	ps.setInt(1, u);
    	
    	rs = ps.executeQuery();
    	ps = cn.prepareStatement("select * from usertable ");
    	rs = ps.executeQuery();
    	
    	
    }
   
    else if(cb != null){
    	
        ps = cn.prepareStatement("select * from usertable ");
    	
    }
   
   // ps = cn.prepareStatement("select * from usertable where u == uid");
   // ps.setInt(1, u);
    rs = ps.executeQuery();
    
    while(rs.next()){
    %>
    
    <tr>
    <td><%= rs.getInt("uid")%></td>
    <td><%=rs.getString("role")%></td>
    <td><%= rs.getString("name")%> </td>
    <%
    }
}
    
catch(Exception e){
	e.printStackTrace();
}
%>

</tr></table>
</body>
</html>