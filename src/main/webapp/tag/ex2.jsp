<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex2</title>
</head>
<body>
	<%
		int data = 10;
		System.out.println("data : " + data);
		out.print("<h2>" + data + "</h2>");
	%>
	
	<%="<h2>" + data + "</h2>" %>
	<h2> <%=data %> </h2>
</body>
</html>