<%@page import="session_quiz.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    // boardModifyService.jsp
    request.setCharacterEncoding("utf-8");

    String n = request.getParameter("num");
	if(n == null || n == ""){
		response.sendRedirect("boardForm.jsp");
		return;
	}
		
	int num = 0;
	try{
		num = Integer.parseInt(n);
	} catch(Exception e){
		response.sendRedirect("boardForm.jsp");
		return;
	}
	
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	if(title.isEmpty() || content.isEmpty()){
		// 해당 수정 페이지로 글번호를 같이 넘겨주면서 수정페이지에 유지시킨다.
		out.print("<script>alert('제목과 내용을 입력하셔야합니다.'); location.href='boardModify.jsp?num="+num+"'</script>");
		return;
	}
	
	BoardDAO boardDao = new BoardDAO();
	boardDao.modify(num, title, content);
	boardDao.disconnection();
%>
<script>alert('게시글 수정이 완료되었습니다.'); location.href='boardForm.jsp'</script>











