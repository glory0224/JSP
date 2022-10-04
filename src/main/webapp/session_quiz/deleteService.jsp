<%@page import="session_quiz.MemberDTO"%>
<%@page import="session_quiz.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String id = (String)session.getAttribute("id");
	if(id == null){
		out.print("<script>alert('로그인 후 이용하세요.'); location.href='login.jsp';</script>");
		return;
	}
	
	request.setCharacterEncoding("UTF-8");
	String pw = request.getParameter("pw");
	String confirm = request.getParameter("confirm");
	
	if(pw == ""){
		response.sendRedirect("delete.jsp");
		return;
	}
	if(pw.equals(confirm) == false){
		response.sendRedirect("delete.jsp");
		return;
	}
	
	MemberDAO memberDao = new MemberDAO();
	MemberDTO member = memberDao.selectId(id);
	String msg = "", path = "";
	if(member.getPw().equals(pw)){
		memberDao.delete(id);
		session.invalidate();
		msg = "회원 삭제 완료";
		path = "index.jsp";
	}else{
		msg = "입력 정보를 확인하세요.";
		path = "delete.jsp";
	}
%>    
<script>alert('<%=msg%>'); location.href='<%=path %>';</script>













