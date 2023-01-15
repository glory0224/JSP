<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="jspMember.*"%>
<!-- top.jsp -->
<html>
<head>
	<title>회원관리</title>
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
		<h2>회 원 관 리 프 로 그 램</h2>
		<table border="1" width="800" height="600">
			<tr height="50">
				
				<th><%if (isLogin){ %>
					<a href="<%=request.getContextPath()%>/login/logout.jsp">로그아웃</a>
				<%}else { %>
					<a href="<%=request.getContextPath()%>/login/login.jsp">로그인</a>
				<%} %>	</th>
				<th><a href="javascript:checkMember()">회원가입</a></th>
				<th><a href="<%=request.getContextPath()%>/jspMember/memberAll.jsp">회원보기</a></th>
				<th><a href="<%=request.getContextPath()%>/jspMember/memberAll.jsp?mode=find">회원찾기</a></th>
			</tr>
			<tr height="80%">
				<td colspan="4">