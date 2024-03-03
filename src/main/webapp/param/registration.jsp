<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="capture.jsp">
<h1 style="text-align:center; color:blue"> Registration </h1>

Name: <input type="text" name="nm" ><Br>
gender: <input type="radio" name="gender" value="Male" > Male
        <input type="radio" name="gender" value="Female" >Female <Br>
        
Age : <input type="text" name="age"> <BR>
Course: <select name="course">

          <option value="arts"> Arts </option>
          <option value="Commerce"> Commerce </option>
          <option value="Science"> Science </option>



</select> <br>

<input type="submit" value="Done">



</form>
</body>
</html>