<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String id = (String)session.getAttribute("id");
	if(id == null){
		out.print("<script>alert('로그인 후 이용하세요.'); location.href='login.jsp';</script>");
		return;
	}

	String n = request.getParameter("num");
	if(n == null || n == ""){
		response.sendRedirect("boardForm.jsp");
		return;
	}
		
	int num = 0;
	try{
		num = Integer.parseInt(n);
	} catch(Exception e){
		response.sendRedirect("boardForm.jsp");
		return;
	}


%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardDelete</title>
</head>
<body>
	<%@ include file="/session_quiz/header.jsp" %>
	<div align="center">
		<h1>게시글 삭제</h1>
		<table>
		<tr><td>
			<form action="boardDeleteService.jsp" method="post" id="f">
				<!-- Service로 넘겨주기 위한 num hidden 처리 -->
				<input type="hidden" name="num" value="<%=num %>">
				<input type="text" value="<%=session.getAttribute("id") %>" readonly="readonly"> <br>
				<input type="password" name="pw" placeholder="비밀번호"><br>
				<input type="password" name="confirm" placeholder="비밀번호 확인" ><br>
				<input type="submit" value="게시글 삭제"><br>
			</form>
		</td></tr>
		</table>
	</div>
	<%@ include file="/session_quiz/footer.jsp" %>
</body>
</html>
