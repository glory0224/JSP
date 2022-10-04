<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
String s = "jstl test 입니다.";
%>

<c:set var="num" value = "<%=s %>" />

<c:out value="${num }"></c:out>