<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="jspMember.*"%>
<!-- top.jsp -->
<html>
<head>
	<title>ȸ������</title>
	<script type="text/javascript">
		function checkMember(){
			window.open("<%=request.getContextPath()%>/jspMember/memberSsn.jsp", "", "width=640, height=400")
		}
	</script>
</head>
<body>
<%
	MemberDTO dto = (MemberDTO) session.getAttribute("member");
	boolean isLogin = false;
	if (dto != null){
		isLogin = true;
	}
%>

	<div align="center">
		<h2>ȸ �� �� �� �� �� �� ��</h2>
		<table border="1" width="800" height="600">
			<tr height="50">
				
				<th><%if (isLogin){ %>
					<a href="<%=request.getContextPath()%>/login/logout.jsp">�α׾ƿ�</a>
				<%}else { %>
					<a href="<%=request.getContextPath()%>/login/login.jsp">�α���</a>
				<%} %>	</th>
				<th><a href="javascript:checkMember()">ȸ������</a></th>
				<th><a href="<%=request.getContextPath()%>/jspMember/memberAll.jsp">ȸ������</a></th>
				<th><a href="<%=request.getContextPath()%>/jspMember/memberAll.jsp?mode=find">ȸ��ã��</a></th>
			</tr>
			<tr height="80%">
				<td colspan="4">