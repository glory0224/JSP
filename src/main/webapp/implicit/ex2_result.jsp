<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// POST 방식일 때 한글깨짐이 발생(전달된 데이터의 인코딩과 데이터를 갖고 올때 인코딩이 서로 다르기에 깨짐)
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
%>
아이디 : <%=id %><br>
비밀번호 : <%=pw %>
