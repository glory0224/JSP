<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex4</title>
</head>
<body>
		<%--
			변수에 데이터를 입력하고 출력하기.
			이름 : 변수데이터
			나이 : 변수데이터 
		 --%>
		 <%
		 	String name = "김변수";
		 	int age = 20;
		 %>
		 이름 : <%=name %> <br>
		 나이 : <%=age %> <br>
</body>
</html>