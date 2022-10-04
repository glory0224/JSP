<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	// 데이터베이스에서 아이디/패스워드 정보를 갖고 옴.
	
	if("admin".equals(id) && "1234".equals(pw)){
		// 로그인 성공
		session.setAttribute("id", "admin");
		session.setAttribute("name", "김변수");
		response.sendRedirect("ex4_index.jsp");
		return;
	}
	// 로그인 실패 시 
%>
<script>location.href='ex4_login.jsp'</script>