<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String remember = request.getParameter("remember");

	if("admin".equals(id) && "1234".equals(pw)){
		if(remember != null && remember.equals("true")){
			session.setAttribute("id", "admin");
		}
	}
	response.sendRedirect("ex3_login.jsp");
%>