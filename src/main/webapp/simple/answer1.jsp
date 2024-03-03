<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

int num1= Integer.parseInt(request.getParameter("num1"));
int num2= Integer.parseInt(request.getParameter("num2"));
int num3= Integer.parseInt(request.getParameter("num3"));


int[] Arr = new int[]{num1,num2,num3};
Arrays.sort(Arr);
int minn = Arr[0];
int maxx = Arr[2];

int ten_place_min = minn/10;
int ten_place_max = maxx/10;

int differencee = ten_place_max - ten_place_min;
out.print("<h1>"+ differencee);



%>
</body>
</html>