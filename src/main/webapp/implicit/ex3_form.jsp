<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex3_form</title>
</head>
<body>
	<form action="ex3_result.jsp" method="get">
		<input type="text" name="name"><br>
		<input type="text" name="address"><br>
		<p>좋아하는 항목을 체크하세요.</p>
		<input type="checkbox" name="like" value="꿀잠자기"> 꿀잠자기<br>
		<input type="checkbox" name="like" value="멍때리기"> 멍때리기<br>
		<input type="checkbox" name="like" value="침대에서 누워있기 "> 침대에서 누워있기<br>
		<input type="submit" value="가입">
	</form>
</body>
</html>