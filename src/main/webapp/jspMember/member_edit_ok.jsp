<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- member_edit_ok.jsp -->
<%
		request.setCharacterEncoding("EUC-KR");				
%>
<jsp:useBean id="mbdto" class="jspMember.MemberDTO"/>
<jsp:setProperty property="*" name="mbdto"/>
<jsp:useBean id="mbdao" class="jspMember.MemberDAO"/>
<%
		if (mbdto.getName() == null || mbdto.getName().trim().equals("")){
			response.sendRedirect("memberAll.jsp");
			return;
		} 

		int res = mbdao.updateMember(mbdto);
		if (res>0){%>
			<script type="text/javascript">
				alert("ȸ������ ����!! ȸ������������� �̵��մϴ�.")
				location.href="jspMember/memberAll.jsp"
			</script>
<%	}else { %>	
			<script type="text/javascript">
			alert("ȸ������ ����!! ȸ������������� �̵��մϴ�.")
			location.href="jspMember/memberAll.jsp"
			</script>	
<%	}%>