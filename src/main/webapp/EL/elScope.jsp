<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL 내장 객체</title>
</head>
<body>
<%
pageContext.setAttribute("name", "page man");
request.setAttribute("name", "request man");
session.setAttribute("name", "session man");
application.setAttribute("name", "application man");
%>
name : ${name} <p>
page 속성 : ${pageScope.name} <p>
request 속성 : ${requestScope.name} <p>
session 속성 : ${sessionScope.name} <p>
application 속성 : ${applicationScope.name} <p>
<a href="scopeTest.jsp">이동</a>

</body>
</html>