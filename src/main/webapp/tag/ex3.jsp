<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex3</title>
</head>
<body>
	<%
		int data1 = 10;
		int data2 = 20;
		int result = data1 + data2;
		out.print("<h3>출력 : " + data1 + " + " + data2 + " = " + result + "</h3>");
	%>
	<h3>출력 : <%=data1 + " + " + data2 + " = " + result %></h3>
	<h3>출력 : 10 + 20 = 30</h3>
</body>
</html>