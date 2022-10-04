<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>infoResult</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String intro = request.getParameter("intro");
	%>
	<p> 입력한 정보는 아래와 같습니다. </p>
	ID : <%=id%> <br>
	Password : <%=pass %><br>
	자기소개 : 
	<%=intro %>
</body>
</html>