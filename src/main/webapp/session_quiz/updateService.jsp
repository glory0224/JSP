<%@page import="session_quiz.MemberDAO"%>
<%@page import="session_quiz.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String id = (String)session.getAttribute("id");
	if(id == null){
		out.print("<script>alert('로그인 후 이용하세요.'); location.href='login.jsp';</script>");
		return;
	}
	
	request.setCharacterEncoding("utf-8");
	String pw = request.getParameter("pw");
	String confirm = request.getParameter("confirm");
	String userName = request.getParameter("userName");
	String address = request.getParameter("address");
	String mobile = request.getParameter("mobile");
	
	if(pw == "" || userName == ""){
		response.sendRedirect("update.jsp");
		return;
	}
	if(pw.equals(confirm) == false){
		response.sendRedirect("update.jsp");
		return;
	}
	
	MemberDTO member = new MemberDTO();
	member.setId(id);
	member.setPw(pw);
	member.setConfirm(confirm);
	member.setUserName(userName);
	member.setAddress(address);
	member.setMobile(mobile);
	
	MemberDAO memberDao = new MemberDAO();
	memberDao.update(member);
%>
<script>alert('회원 수정 완료'); location.href='index.jsp';</script>
