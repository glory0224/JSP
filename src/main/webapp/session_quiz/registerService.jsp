<%@page import="session_quiz.MemberDTO"%>
<%@page import="session_quiz.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String confirm = request.getParameter("confirm");
	String userName = request.getParameter("userName");
	String address = request.getParameter("address");
	String mobile = request.getParameter("mobile");
	
	// 서버측 입력값 검증
	if(id == "" || pw == "" || userName == ""){
		out.print("<script>alert('서버에서 검증하고 있는 필수 입력 항목입니다.');location.href='register.jsp'</script>");
		return;
	}
	
	if(pw.equals(confirm) == false){
		out.print("<script>alert('서버에서 검증하고 있는 필수 입력 항목입니다.');</script>");
		response.sendRedirect("register.jsp");
		return;
	}
	
	// Data Access Object
	MemberDAO memberDao = new MemberDAO();
	MemberDTO check = memberDao.selectId(id);
	String message, path;
	if(check == null){
		// 가입하려고 하는 아이디가 없기에 회원가입을 진행함.
		MemberDTO member = new MemberDTO();

		member.setId(id);
		member.setPw(pw);
		member.setUserName(userName);
		member.setAddress(address);
		member.setMobile(mobile);
		
		memberDao.insert(member);
		message = "회원가입 완료";
		path = "index.jsp";
	}else{
		// 가입하려고 하는 아이디가 있기에 중복 계정으로 가입을 할 수 없음.
		message = "회원가입 실패";
		path = "register.jsp";
	}
%>
<script>alert('<%=message%>'); location.href='<%=path%>'</script>