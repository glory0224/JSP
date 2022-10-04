<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이지 이동</title>
</head>
<body>
name : ${name} <p>
page 속성 : ${pageScope.name} <p>
request 속성 : ${requestScope.name} <p>
session 속성 : ${sessionScope.name} <p>
application 속성 : ${applicationScope.name} <p>
</body>
</html>