<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex4</title>
</head>
<body>
	<%
		String location = "bmiForm.jsp";
		/*
			response : 서버가 클라이언트에게 데이터를 응답하는 객체
			sendRedirect() : 응답의 내용은 경로, 클라이언트가 이동할 경로를 제공함.
			sendRedirect() 응답을 받은 클라이언트는 응답받은 경로를 서버에 요청해서 페이지를 전달받아 실행함.
		*/
		location = "http://www.google.com";
		response.sendRedirect(location);
	%>
</body>
</html>