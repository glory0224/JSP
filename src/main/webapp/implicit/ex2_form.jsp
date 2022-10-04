<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex2_form</title>
</head>
<body>
<!-- 
	get 메서드 전달 시 URL에 데이터를 담아 전달
http://localhost:8085/jspExam/implicit/ex2_result.jsp?id=test&pw=1234

	post 메서드 전달 시 HTTP Body에 데이터를 담아 전달
http://localhost:8085/jspExam/implicit/ex2_result.jsp
 -->
	<form action="ex2_result.jsp" method="post">
		<input type="text" name="id"><br>
		<input type="text" name="pw"><br>
		<input type="submit" value="로그인">
		<input type="reset" value="취소"><br>
	</form>
</body>
</html>