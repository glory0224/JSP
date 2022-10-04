<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>quiz1</title>
</head>
<body>
	<h2> 구구단(2~9단) </h2>
	<%
		for(int i = 2; i <= 9; i++){
			for(int j = 1; j <= 9; j++){
				out.print(i + " x " + j + " = " + (i*j) + "<br>");
			}
			out.print("<br>");
		}
	%>
</body>
</html>