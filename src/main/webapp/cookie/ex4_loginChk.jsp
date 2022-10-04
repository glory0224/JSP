<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String remember = request.getParameter("remember");

	if("admin".equals(id) && "1234".equals(pw)){
		if(remember != null && remember.equals("true")){
			Cookie cookie = new Cookie("rememberId", "admin");	
			cookie.setMaxAge(30);
			response.addCookie(cookie);
		}
	}
	response.sendRedirect("ex4_login.jsp");
%>