<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex3_login</title>
</head>
<body>
	<%
		/*
		0. ex3_login -> ex3_loginChk
	
		1. 체크박스를 클릭하고 로그인 시 ID/PW가 일치하면 
		ex3_login.jsp 에서 아이디의 값을 출력해주세요.
	
		2. 체크박스를 클릭하고 로그인 시 ID/PW가 틀리면 
		ex3_login.jsp 에서 아이디의 값을 출력하지 않아요.
	
		3. 체크박스를 클릭하지 않고 로그인 성공/실패 두 경우 모두 
		ex3_login.jsp 에서 아이디의 값을 출력하지 않아요.
		*/
		String id = "";
		id = (String)session.getAttribute("id");
		if(id == null)
			id = "";
	%>
	<form action="ex3_loginChk.jsp" method="post">
		<input type="text" placeholder="아이디" name="id" value="<%=id %>"> <br>
		<input type="password" placeholder="비밀번호" name="pw" ><br> 
		<input type="checkbox" value="true" name="remember" > 아이디 기억하기 <br>
		<input type="submit" value="로그인" >
		<input type="reset" value="취소" >	
	</form>
</body>
</html>