<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>register</title>
</head>
<body>
<!-- 간단한 회원 가입 폼 생성 -->
<jsp:include page="header.jsp"></jsp:include>
	<div align="center">
		<h1>회원 등록</h1>
		<table>
		<tr><td>
			<!-- Service 부분으로 보낸다. -->
			<form action="registerService.jsp" method="post" id="f">
				<input type="text" name="id" placeholder="아이디" id="id"> (*필수 항목) <br>
				<input type="password" name="pw" placeholder="비밀번호" id="pw"><br>
				<input type="password" name="confirm" placeholder="비밀번호 확인 " id="confirm">
				<label id="label">(*필수 체크)</label><br>
				<input type="text" name="userName" id="userName" placeholder="이름" ><br>
				<input type="text" name="address" placeholder="주소" ><br>
				<input type="text" name="mobile" placeholder="전화번호" ><br>
				<input type="submit" value="회원가입"><br>
			</form>
		</td></tr>
		</table>
	</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>