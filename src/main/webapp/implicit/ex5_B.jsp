<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex5_B</title>
</head>
<body>
	<h3>ex5_B.jsp 페이지 입니다.</h3>
	페이지 : <%=pageContext.getAttribute("id") %> <br>
	요청 : <%=request.getAttribute("id") %><br>
	세션 : <%=session.getAttribute("id") %><br>
	어플리케이션 : <%=application.getAttribute("id") %><br>
	<a href="ex5_C.jsp"> C 페이지로 이동</a>
</body>
</html>