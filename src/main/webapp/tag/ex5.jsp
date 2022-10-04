<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex5</title>
</head>
<body>
	<%
		boolean b = true;
		if(b == true){
			// 로그인 성공 출력	
			out.print("<b> 로그인 성공</b><br>");
		}else{
			// 로그인 실패 출력
			out.print("<b> 로그인 실패</b><br>");
		}
	%>
	
	<%
		boolean b2 = false;
		if(b2 == true){
	%>
			<b><%="로그인 성공" %></b><br>
	<% 
		}else{
	%>
			<b><%="로그인 실패" %></b><br>
	<%
		}
	%>
</body>
</html>