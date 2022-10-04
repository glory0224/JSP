<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex5_A</title>
</head>
<body>
	<h3>ex5_A.jsp 페이지 입니다.</h3>
	<%
		//setAttribute() : 속성 : 값을 쌍으로 저장하는 기능
		pageContext.setAttribute("id", "pageId"); 
		request.setAttribute("id", "requestId");
		session.setAttribute("id", "sessionId"); // 세션을 로그인 정보와 같은 여러 페이지에서 사용할 정보를 담아서 쓸 예정
		application.setAttribute("id", "applicationId");
		
		String path = "ex5_B.jsp";
		// 페이지를 실행 한 후 결과를 전달
		request.getRequestDispatcher(path).forward(request, response);
	%>
</body>
</html>