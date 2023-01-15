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
			msg = dto.getName()+"��, �ݰ����ϴ�.";
			url = request.getContextPath()+"/index.jsp";
			break;
		case LoginCheck.NOT_ID :
			msg = "�ش��ϴ� ���̵� �����ϴ�. �ٽ� Ȯ�� �� �α����� �� �ּ���";
			url = "login.jsp";
			break;
		case LoginCheck.NOT_PWD :
			msg = "��й�ȣ�� Ʋ�Ƚ��ϴ�. �ٽ� Ȯ�� �� �α����� �� �ּ���";
			url = "login.jsp";
			break;
		case LoginCheck.ERROR :
			msg = "DB ���� �߻�!! �����ڿ��� ������ �ּ���";
			url = request.getContextPath()+"/index.jsp";
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>

