<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String id = (String)session.getAttribute("id");
	if(id == null){
		out.print("<script>alert('로그인 후 이용하세요.'); location.href='login.jsp';</script>");
		return;
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete</title>
</head>
<body>
	<%@ include file="/session_quiz/header.jsp" %>
	<div align="center">
		<h1>회원 탈퇴</h1>
		<table>
		<tr><td>
			<form action="deleteService.jsp" method="post" id="f">
				<input type="text" value="<%=session.getAttribute("id") %>" readonly="readonly"> <br>
				<input type="password" name="pw" placeholder="비밀번호"><br>
				<input type="password" name="confirm" placeholder="비밀번호 확인" ><br>
				<input type="submit" value="탈퇴"><br>
			</form>
		</td></tr>
		</table>
	</div>
	<%@ include file="/session_quiz/footer.jsp" %>
</body>
</html>