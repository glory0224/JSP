<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- logout.jsp -->
<%
		session.invalidate();
%>
<script type="text/javascript">
	alert("�α׾ƿ� �Ǿ����ϴ�.")
	location.href="<%=request.getContextPath()%>/index.jsp"	
</script>