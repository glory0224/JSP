<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>
	<%
		String id = (String)session.getAttribute("id");
		if(id == null){
	%>
		<form action="loginService.jsp" method="post">
			<input type="text" placeholder="아이디" name="id"> <br>
			<input type="password" placeholder="비밀번호" name="pw" ><br> 
			<input type="submit" value="로그인" >
			<input type="reset" value="취소" >	
		</form>
	<%}else{ %>
		<%=id %>님 로그인 상태입니다. <br>
		<input type="button" value="index 페이지로 이동" onclick="location.href='index.jsp'">
	<%} %>
</body>
</html>