<%@page import="session.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="session.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
</head>
<body>
	<% 
		MemberDAO memberDao = new MemberDAO();
		ArrayList<MemberDTO>members = memberDao.list();
	%>
	
	<table border=1>
		<tr>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>이메일</th>
		</tr>
		<%
			for(MemberDTO m : members){
		%>		
			<tr>
				<td><%=m.getId() %></td>
				<td><%=m.getPw() %></td>
				<td><%=m.getName() %></td>
				<td><%=m.getEmail() %></td>
			</tr>
		<%} %>
	</table>
	<a href="index.jsp" style="text-decoration: none"> 인덱스 페이지로 이동합니다. </a>
</body>
</html>