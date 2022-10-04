<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex4_index</title>
</head>
<body>
	<h3>Index 페이지 입니다.</h3>
	<%
		String id = (String)session.getAttribute("id");
		if(id == null){
			out.print("<h4>로그인은 되어있지 않습니다.</h4>");		
			out.print("<a href='ex4_login.jsp'>로그인 페이지로 이동합니다.</a>");
		}else{
	%>	
		<%=id %>님 안녕하세요!<br>
		홈페이지에 방문해주셔서 감사합니다.<br>
		즐거운 시간되세요<br>
		<input type="button" value="로그아웃" onclick="location.href='ex4_logout.jsp'">
		<input type="button" value="로그인" onclick="location.href='ex4_login.jsp'">
	<% } %>
</body>
</html>