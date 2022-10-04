<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex3_index</title>
</head>
<body>
<h2>인덱스 페이지</h2>
<%
	boolean check = true;
	// 요청한 쿠키를 getCookies로 가져온다.
	Cookie[] cookies = request.getCookies();
	for(Cookie c : cookies){
		if(c.getName().equals("cookieName"))
			check = false;
	}
	// 처음에는 쿠키가 생성되지 않았기 때문에 이 if문을 실행하고 팝업창 처럼 페이지가 열린다. 
	if(check){
		out.print("<script>window.open('ex3_popup.jsp','', 'width=800, height=600')</script>");		
	}
%>
</body>

</html>