
<!-- import : import할 패키지를 명시한다.  -->
<%@page import="java.util.Calendar"%>

<!-- 
language : JSP 페이지에서 사용되는 스크립트 언어 지정(Java)
contentType : JSP 페이지의 MIME, 문자 인코딩 타입을 지정한다. 
pageEncoding : 웹 컨테이너가 JSP 페이지를 분석 할 때 어떤 인코딩으로 작성되었는지 검사하여 JSP 페이지의 문자를 읽는다. 
	           이때, contetntType의 charset과 pageEncoding의 charset이 서로 다를 수 있다.
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>

<!-- 
info : JSP 페이지의 정보를 관리한다.
errorPage : JSP 페이지에서 에러가 발생할 경우 이동할 에러페이지 경로를 지정한다. 
isErrorPage : 이 페이지가 에러 페이지인지를 표시할 수 있다.
			  IE는 범용 에러에 대해 Tomcat에서 처리(Chrome으로 테스트 가능하다.)
			  web.xml 파일 에러에 대한 페이지의 우선순위를 지정해야한다. 
-->
<%@ page info="" errorPage="" isErrorPage="false" %>

<!-- 현재 JSP페이지에 사용할 파일을 포함한다. 이때 text, html, jsp, url 등을 지정할 수 있으며 url 지정 시, 상대경로를 사용한다. -->
<%-- <%@ include file="" %> --%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex8</title>
</head>
<body>
	<h2>합계 구하기</h2>
	<%!
		int total;
		int evenTotal;
		int oddTotal;
		
		void totalRange(int begin, int end){
			for(int i = begin; i <= end; i++){
				total += i;
				if(i % 2 == 0){
					evenTotal += i;
				}else
					oddTotal += i;
			}
		}
	%>

<!-- 선언문에서 변수와 메소드 선언 -->

	<% 
		int begin = 22;
		int end = 77;
		totalRange(begin, end); 
	%>
	
<!-- 스크립트릿 선언으로 html쪽에 자바 코드 삽입(변수 지정, 메소드 호출 -->

	<%=begin+" ~ "+end+"의 합 : "  + total%><br>
	<%=begin+" ~ "+end+"의 짝수의 합 : "  + evenTotal%><br>
	<%=begin+" ~ "+end+"의 홀수의 합 : "  + oddTotal%><br>
	
<!-- 표현식으로 클라이언트에서 호출할 변수들을 선언-->

</body>
</html>