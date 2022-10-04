<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2> 입력한 정보는 다음과 같습니다.</h2>
	
	<%
		request.setCharacterEncoding("utf-8");
		String edu = request.getParameter("edu");
		String country = request.getParameter("country");
		String[] like = request.getParameterValues("like");
	%>
	
	학력 : <%=edu %> <br>
	국가 : <%=country %> <br>
	관심 분야 : <%=Arrays.toString(like) %> <br>
	
</body>
</html>