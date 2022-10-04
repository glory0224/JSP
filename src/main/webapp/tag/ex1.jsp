<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex1</title>
</head>
<body>
<!-- http://localhost:8085/jspExam/tag/ex1.jsp -->
	<h3>JSP 태그 종류</h3>
	<%--
		JSP 주석
	 --%>
	  <!–- HTML주석 -->
	  
	  
	 
	 
	 <% %> : Scriptlet(스크립트릿) : 자바의 코드를 작성하는 영역(메서드 안에 작성하는 태그)
	 <%! %> : Declaration(선언문) : 자바의 코드를 작성하는 영역(클래스 안에 작성하는 태그), 
	 								자바파일안에 클래스를 구성하는 방법이 있기에 사용빈도가 낮음
	 <%@ %> : Directive(지시자, 지시어) : JSP의 환경 설정을 담는 태그
	 <%= %> : Expression(표현식) : 화면에 출력하는 태그, print()
	 
	 <%
	 	int data;
	 /* 메서드 정의는 할 수 없음
	 	public void inner(){
	 		
	 	}
	 */
	 %>
	 public void exam(){
	 	int data;
	 		public void inner(){
	 		
	 		}
	 }
	 ====================================
	 <%!
	 	int data;
	 	public void exam(){
	 		
	 	}
	 %>
	 public Class Exam{
	 	int data;
	 	public void exam(){
	 		
	 	}
	 }
</body>
</html>