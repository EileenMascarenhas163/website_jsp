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

String num=request.getParameter("num1");
int n = Integer.parseInt(num);
double sol=0;
String optio =request.getParameter("ques");
int option = Integer.parseInt(optio);
out.print(option);

if (option==1){
	sol = ((n*(n+1))/2);
	out.print("result: Sum of n numbers - " +sol );
	

}

else if (option==2){
	sol = (n*(n+1)*(2*n+1))/6;
	out.print("result : Sum of square of n - " +sol );
}

else if(option ==3){
	sol = Math.pow((n*(n+1)/2), 2);
	out.print("result: Sum of cubes of n -  " +sol );
}

else {
	out.print("invalid input");
}
%>



</body>
</html>