<%@page import="java.io.File"%>
<%@page import="session_quiz.BoardDTO"%>
<%@page import="session_quiz.BoardDAO"%>
<%@page import="session_quiz.MemberDTO"%>
<%@page import="session_quiz.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	// boardDeleteService.jsp
	request.setCharacterEncoding("utf-8");

	String id = (String)session.getAttribute("id");
	if(id == null){
		out.print("<script>alert('로그인 후 이용하세요.'); location.href='login.jsp';</script>");
		return;
	}

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
	
	String pw = request.getParameter("pw");
	String confirm = request.getParameter("confirm");
	if(pw == "" || confirm == ""){
		out.print("<script>alert('서버에서 검증하고 있는 필수 입력 항목입니다.');location.href='boardDelete.jsp?num="+num+"'</script>");
		return;
	}
	
	if(pw.equals(confirm) == false){
		response.sendRedirect("boardDelete.jsp?num="+num);
		return;
	}
	
	MemberDAO memberDao = new MemberDAO();
	// 위에서 검증한 session의 id로 해당 멤버의 정보를 받아온다.
	MemberDTO member = memberDao.selectId(id);
	// 그 정보에 담긴 pw를 확인한다. 
	if(member.getPw().equals(pw) == false){
		out.print("<script>alert('비밀번호가 일치하지 않습니다.');location.href='boardDelete.jsp?num="+num+"'</script>");
		return;
	}
	
	BoardDAO boardDao = new BoardDAO();
	BoardDTO board = boardDao.selectNum(num);
	
	String writeId = board.getId();
	if(writeId.equals(id) == false){
		response.sendRedirect("boardForm.jsp");
		return;
	}
	
	//DataBase에서 정보 삭제
	boardDao.delete(num);
	boardDao.disconnection();
	
	// 파일 삭제
	String fileName = board.getFileName();
	String saveDir = "C:\\jsps\\upload\\" + id + "\\" + fileName;
	File file = new File(saveDir);
	if(file.exists() == true) // 파일이 존재할 경우 true
		file.delete();
%>

<script>alert('게시글 삭제 완료되었습니다.');location.href='boardForm.jsp';</script>







