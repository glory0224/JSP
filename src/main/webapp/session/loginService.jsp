<%@page import="session.MemberDTO"%>
<%@page import="session.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	// 서버측 입력값 검증
	if(id == "" || pw == "" ){
		out.print("<script>alert('서버에서 검증하고 있는 필수 입력 항목입니다.');location.href='login.jsp'</script>");
		return;
	}
	
	// 데이터베이스에서 아이디/패스워드 정보를 갖고 옴.
	MemberDAO memberDao = new MemberDAO();
	MemberDTO member = memberDao.selectId(id);
	
	if(member != null && member.getPw().equals(pw)){
		// 로그인 성공
		session.setAttribute("id", member.getId());
		session.setAttribute("name", member.getName());
		session.setAttribute("email", member.getEmail());
		response.sendRedirect("index.jsp");
		return;
	}
	// 로그인 실패 시 
%>
<script>alert('아이디 또는 비밀번호를 확인하세요'); location.href='login.jsp'</script>