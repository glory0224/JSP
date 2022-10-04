<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:forward page="yellow.jsp">
	<!-- 파라미터 전달  -->
	<jsp:param name="url" value="red.jsp"/>
	<jsp:param name="news" value="Hello, Action Tag!"/>
</jsp:forward>

</body>
</html>