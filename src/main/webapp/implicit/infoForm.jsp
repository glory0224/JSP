<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>infoForm</title>
</head>
<body>
	<form action="infoResult.jsp" method="post">
		ID : <input type="text" name="id"><br>
		Password : <input type="password" name="pass"><br>
		자기소개 <br>
		<textarea rows="5" cols="50" name="intro"></textarea><br>
		<input type="submit" value="전송"> <input type="reset" value="취소">
	</form>
</body>
</html>