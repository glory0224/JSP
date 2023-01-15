<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- member_delete.jsp -->
<%
		String no = request.getParameter("no");
		if (no == null || no.trim().equals("")){
			response.sendRedirect("memberAll.jsp");
			return;
		}
%>
<jsp:useBean id="mbdao" class="jspMember.MemberDAO" />
<%
		int res = mbdao.deleteMember(Integer.parseInt(no));
		if (res>0){%> 
			<script type="text/javascript">
				alert("회원삭제 성공!! 회원목록페이지로 이동합니다")
				location.href="memberAll.jsp"
			</script>
<%	}else { %>	
			<script type="text/javascript">
			alert("회원삭제 실패!! 회원목록페이지로 이동합니다")
			location.href="memberAll.jsp"
			</script>	
<%	}%>	









