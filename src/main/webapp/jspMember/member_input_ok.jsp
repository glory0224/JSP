<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- member_input_ok.jsp -->
<%
		request.setCharacterEncoding("utf-8");				
%>
<jsp:useBean id="mbdto" class="jspMember.MemberDTO"/>
<jsp:setProperty property="*" name="mbdto"/>
<jsp:useBean id="mbdao" class="jspMember.MemberDAO"/>
<%
		if (mbdto.getName() == null || mbdto.getName().trim().equals("")){
			response.sendRedirect("memberSsn.jsp");
			return;
		}

		int res = mbdao.insertMember(mbdto);
		if (res>0){%>
			<script type="text/javascript">
				alert("회원가입 성공!! 로그인을 해 주세요")
				self.close()
			</script>
<%	}else { %>	
			<script type="text/javascript">
				alert("회원가입 실패!! 회원가입페이지로 이동합니다")
				location.href="memberSsn.jsp"
			</script>	
<%	}%>








