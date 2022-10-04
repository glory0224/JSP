<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!--jsp useBean 생성  -->
<jsp:useBean id="member" class="beanEx.MemberDTO"/>

<!-- MemberDTO에 속성 값들을 모두 member에 담는다는 의미  -->
<jsp:setProperty property="*" name="member"/>


<!-- 위의 '*' 설정이 아래 속성 하나하나 넣어준 것과 동일한 의미를 지닌다.
 
<jsp:setProperty property="id" name="member"/>
<jsp:setProperty property="pw" name="member"/>
<jsp:setProperty property="confirm" name="member"/>
<jsp:setProperty property="userName" name="member"/> 
<jsp:setProperty property="address" name="member"/> 
<jsp:setProperty property="mobile" name="member"/> 

-->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bean 출력</title>
</head>
<body>
	<!-- jsp Bean 데이터 출력 -->
	id : <jsp:getProperty property="id" name="member"/> <br>
	pw : <jsp:getProperty property="pw" name="member"/><br>
	confirm : <jsp:getProperty property="confirm" name="member"/><br>
	userName : <jsp:getProperty property="userName" name="member"/> <br>
	address : <jsp:getProperty property="address" name="member"/> <br>
	mobile : <jsp:getProperty property="mobile" name="member"/> <br>
	

</body>
</html>