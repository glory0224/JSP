<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex2_make</title>
</head>
<body>
	<%
		Cookie cookie = new Cookie("CookieName", "CookieValue");
		cookie.setMaxAge(60*60*24); // setMaxAge 함수로 쿠키 기간 설정 가능, 기본 단위는 초이다. 
		cookie.setMaxAge(60); // 위에서 하루 설정한 것을 60초로 다시 초기화, 60초 동안 유지한다. 60초가 지나면 삭제됨.
		response.addCookie(cookie);
	%>
	
	<a href="ex2_index.jsp">쿠키 확인하러 가기</a>
</body>
</html>