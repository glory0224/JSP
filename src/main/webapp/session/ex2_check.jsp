<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex2_check</title>
</head>
<body>
	<%
		String id = (String)session.getAttribute("id");
		String[] hobbys = (String[])session.getAttribute("hobbys");
		out.print("아이디 : " + id + "<br>");
		out.print("취미 : " + Arrays.toString(hobbys) + "<br>");
		
		int sessionTimeOut = session.getMaxInactiveInterval();
		out.print("<h3>세션 유효 시간 </h3>");
		out.print(session.getMaxInactiveInterval() + "초<br>");
		
		// 한 개의 세션 속성:데이터 삭제
		session.removeAttribute("id");
		
		// 특정 클라이언트의 모든 세션 속성 삭제
		session.invalidate();
	%>
</body>
</html>