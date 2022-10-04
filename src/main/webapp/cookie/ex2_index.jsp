<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex2_index</title>
</head>
<body>
	<%
		// 클라이언트의 요청에 쿠키가 있다면 쿠키 추출하기.
		Cookie[] cookies = request.getCookies();
		for(Cookie c : cookies){
			out.print("쿠키 이름 : " + c.getName() + "<br>");
			out.print("쿠키 값 : " + c.getValue() + "<br><br>");
		}
	%>
	
	<a href="ex2_make.jsp">쿠키 생성하기</a>
</body>
</html>