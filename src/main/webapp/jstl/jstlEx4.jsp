<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String [] hobby = {"스키", "스쿠버다이빙", "등산", "자전거", "낚시", "클라이밍"};
%>
<c:set var="hobby" value = "<%=hobby %>" />
<!-- 배열 반복문 출력 -->
<c:forEach var="hb" items="${hobby }">
${hb }<br>
</c:forEach>
