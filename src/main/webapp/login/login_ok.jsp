<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="jspMember.*"%>

<jsp:useBean id="bdao" class="jspMember.MemberDAO"/>
<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	if(id.isEmpty() || passwd.isEmpty()){
		
		response.sendRedirect("login.jsp");
		return;
	}
	
	MemberDTO getMember = bdao.getMember(id, passwd);
	
	if (id.equals(getMember.getId()) && passwd.equals(getMember.getPasswd())){
		session.setAttribute("member", getMember);
		%>
		<script type="text/javascript">
		alert("로그인 성공! 회원 관리 페이지로 이동합니다");
		</script>
	<%
		response.sendRedirect("/jspExam/jspMember/member_edit.jsp");
	}else {
		%>
		<script type="text/javascript">
		alert("아이디 또는 비밀번호를 확인하세요.")
		location.href="login.jsp";
		</script>
		<%
	}
	
%>