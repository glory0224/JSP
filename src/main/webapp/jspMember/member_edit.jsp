<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="jspMember.*"%>
<!-- member_edit.jsp -->
<%
		String no = request.getParameter("no");
		if (no == null || no.trim().equals("")){
			response.sendRedirect("memberAll.jsp");
			return;
		}
%>
<jsp:useBean id="mbdao" class="jspMember.MemberDAO" />
<%
		MemberDTO dto = mbdao.getMember(Integer.parseInt(no));
%> 
<html>
<head>
	<link rel="stylesheet" type="text/css" href="../style.css">
	<script type="text/javascript">
		function check(){
			if (f.passwd.value==""){
				alert("��й�ȣ�� �Է��� �ּ���!!")
				f.passwd.focus()
				return false
			}
			return true
		}
	</script>
</head>
<body>	
<div align="center">
	<form name="f" action="member_edit_ok.jsp" 
								method="post" onsubmit="return check()">
		<input type="hidden" name="no" value="<%=dto.getNo() %>">
		<table width="80%" class="outline">
			<tr>
				<td colspan="2" align=center class="m2">ȸ������</td>
			</tr>
			<tr>
				<th width="20%" class="m3">�̸�</th>
				<td><input type="text" class="box" name="name" value="<%=dto.getName()%>" readOnly></td>
			</tr>
			<tr>
				<th class="m3">���̵�</th>
				<td><input type="text" class="box" name="id" value="<%=dto.getId()%>" readOnly></td>
			</tr>
			<tr>
				<th class="m3">��й�ȣ</th>
				<td><input type="password" class="box" name="passwd" value="<%=dto.getPasswd()%>"></td>
			</tr>
			<tr>
				<th class="m3">�ֹι�ȣ</th>
				<td><input type="text" class="box" name="ssn1" value="<%=dto.getSsn1()%>" readOnly>
					- <input type="password" class="box" name="ssn2" value="<%=dto.getSsn2()%>" readOnly></td>
			</tr>
			<tr>
				<th class="m3">�̸���</th>
				<td><input type="text" class="box" name="email" value="<%=dto.getEmail()%>"></td>
			</tr>
			<tr>
				<th class="m3">��ȭ��ȣ</th>
				<td><input type="text" name="hp1" class="box" size="3" maxlength="3" value="<%=dto.getHp1()%>">
					-<input type="text" name="hp2" class="box" size="4" maxlength="4" value="<%=dto.getHp2()%>">
					-<input type="text" name="hp3" class="box" size="4" maxlength="4" value="<%=dto.getHp3()%>"></td>
			</tr>
			<tr>
				<td align="center" colspan="2" class="m2">
					<input type="submit" value="ȸ������">
					<input type="reset" value="�ٽ��Է�">
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>