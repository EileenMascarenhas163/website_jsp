<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="solution1.jsp" method="post">
<h1 style="text-align:center; color:blue"> Set of questions </h1>
Enter number : <input type="text" name="num1"> <br>

<label for="hh">select an option from the given set:</label>

<select name="ques" id="ques">
  <option value="1">Sum of n numbers</option>
  <option value="2">Sum of square of n</option>
  <option value="3">Sum of cubes of n</option>

</select>

<input type="submit" value="done">

</form>
</body>
</html>