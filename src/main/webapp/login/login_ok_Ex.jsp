<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="login.*, jspMember.*"%>
<!-- login_ok.jsp -->
<jsp:useBean id="loginCheck" class="login.LoginCheck"/>
<jsp:setProperty property="*" name="loginCheck"/>
<jsp:useBean id="mbdao" class="jspMember.MemberDAO" />
<%
		String saveId = request.getParameter("saveId");

		int res = loginCheck.checkLogin();
		String msg = null, url = null;
		switch(res){
		case LoginCheck.OK :
			MemberDTO dto = mbdao.getMember(loginCheck.getId());
			session.setAttribute("member", dto);
			if(saveId != null && saveId.equals("true")){
				Cookie cookie = new Cookie("rememberId", loginCheck.getId());
				cookie.setMaxAge(60*60);
				response.addCookie(cookie);
			}
			msg = dto.getName()+"님, 반갑습니다.";
			url = request.getContextPath()+"/index.jsp";
			break;
		case LoginCheck.NOT_ID :
			msg = "해당하는 아이디가 없습니다. 다시 확인 후 로그인을 해 주세요";
			url = "login.jsp";
			break;
		case LoginCheck.NOT_PWD :
			msg = "비밀번호가 틀렸습니다. 다시 확인 후 로그인을 해 주세요";
			url = "login.jsp";
			break;
		case LoginCheck.ERROR :
			msg = "DB 오류 발생!! 관리자에게 문의해 주세요";
			url = request.getContextPath()+"/index.jsp";
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>

