<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex2</title>
</head>
<body>
<%
	/*
		세션에 데이터를 저장할 때 사용하는 메서드
		session.setAttribute("속성이름", "데이터");
	*/
	session.setAttribute("id", "admin");
	session.setAttribute("hobbys", new String[]{"멍때리기", "잠자기"});
	
	/*
		세션에 저장된 데이터를 이름을 이용해서 갖고 오는 메서드
		session.getAttribute("속성이름");
	*/
	
	String id = (String)session.getAttribute("id");
	String[] hobbys = (String[])session.getAttribute("hobbys");
	
	/*
		기본 유효시간 : 1800초(30분)
		session.setMaxInactiveInterval(초);
	*/
	session.setMaxInactiveInterval(60); //60초 동안 유지
%>
	<a href="ex2_check.jsp"> 세션 데이터 확인하러 가기 </a>
</body>
</html>