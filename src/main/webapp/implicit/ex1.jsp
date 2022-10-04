<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex1</title>
</head>
<body>
	<%-- request 내장 객체에서 제공하는 메서드 --%>
	<!-- http://localhost:8085/jspExam/implicit/ex1.jsp -->
	웹 컨텍스트 패스  : <%=request.getContextPath() %><br>
	요청 방식 : <%=request.getMethod() %><br>
	요청 URL : <%=request.getRequestURL() %><br>
	요청 URI : <%=request.getRequestURI() %><br>
	요청 URI 다음에 오는 쿼리 스트링 : <%=request.getQueryString() %><br>
	지정 로컬 URL에 대한 RequestDispacher 객체 생성 : <%=request.getRequestDispatcher("ex2_form.jsp") %> <br>
	요청한 호스트의 완전한 이름 : <%=request.getRemoteHost() %><br>
	요청한 호스트의 네트워크 주소 : <%=request.getRemoteAddr() %><br>
	요청한 사용자의 이름 : <%=request.getRemoteUser() %><br>
	요청한 서버 이름 : <%=request.getServerName() %><br>
	요청 프로토콜 : <%=request.getProtocol() %><br>
</body>
</html>