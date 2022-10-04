<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// POST 방식일 때 한글깨짐이 발생(전달된 데이터의 인코딩과 데이터를 갖고 올때 인코딩이 서로 다르기에 깨짐)
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String address = request.getParameter("address");
	String[] likes = request.getParameterValues("like");
%>
이름 : <%=name %><br>
주소 : <%=address %><br>
좋아하는 것 : <%=Arrays.toString(likes) %><br>

