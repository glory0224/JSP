<%@page import="sessionDB.MemberDTO"%>
<%@page import="sessionDB.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");
	String id = (String)session.getAttribute("id");
	if(id == null){
		response.sendRedirect("login.jsp");
		return;
	}
	
	String pw = request.getParameter("pw");
	String confirmPw = request.getParameter("confirmPw");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	
	// 서버측 입력값 검증
	if(pw == "" || name == ""){
		out.print("<script>alert('서버에서 검증하고 있는 필수 입력 항목입니다.');location.href='update.jsp'</script>");
		return;
	}
	
	if(pw.equals(confirmPw) == false){
		out.print("<script>alert('서버에서 검증하고 있는 필수 입력 항목입니다.');</script>");
		response.sendRedirect("update.jsp");
		return;
	}
	
	// Data Access Object
	MemberDAO memberDao = new MemberDAO();

	// 수정하려고 하는 아이디가 있으면 MemberDAO에 데이터 전달해서 수정
	MemberDTO member = new MemberDTO();
	member.setEmail(email);
	member.setId(id);
	member.setName(name);
	member.setPw(pw);
	memberDao.update(member);
	String message = "회원 정보 수정 완료";
	String path = "index.jsp";
	memberDao.disconnection();
%>
<script>alert('<%=message%>'); location.href='<%=path%>'</script>