<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>researchResult</title>
</head>
<body>
<h1>설문 조사 결과</h1>
	<%
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		String intro = request.getParameter("intro");
		String age = request.getParameter("age");
		String[] hobbys = request.getParameterValues("hobby");
	%>
	
	이름 : <%=name %><br> 
	소개 : <%=intro %><br> 
	나이 : <%=age %><br> 
	취미 : 
	<%
		if(hobbys != null){
			for(String hobby : hobbys)
				out.print(hobby + " ");
		}
	%>
	<br>
</body>
</html>



















