<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="session_quiz.BoardDAO"%>
<%@page import="session_quiz.BoardDTO"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*   
<form  enctype="multipart/form-data">
파일 전송 시 multipart/form-data 방식으로 데이터 전달하기에 내장객체 request로 데이터를 인식하지 못함.

String title = request.getParameter("title");
out.print("제목 : " + title + "<br>"); 
*/
	String id = (String)session.getAttribute("id");
	if(id == null){
		response.sendRedirect("login.jsp");
		return;
	}
	String saveDir = "C:\\jsps\\upload\\" + id;
	File file = new File(saveDir);
	//file.exists() : 파일 또는 폴더의 존재유뮤를 확인 후 true or false
	if(file.exists() == false){
		file.mkdir(); // 폴더 또는 디렉토리 생성
	}
	// 1024byte == 1kB
	// 1024kb == 1mb
	// 1024mb == 1gb
	int maxPostSize = 1024 * 1024 * 10; // 10mb
	MultipartRequest mRequest = new MultipartRequest(request, saveDir, maxPostSize, "UTF-8");
	
	String title = mRequest.getParameter("title");
	String content = mRequest.getParameter("content");
	String fileName = mRequest.getOriginalFileName("upfile");
	/* 
	String upfile = mRequest.getParameter("upfile");
	out.print("파일이름 : " + upfile + "<br>");  	
	 */
	 
	 BoardDTO board = new BoardDTO();
	 board.setTitle(title);
	 board.setContent(content);
	 board.setFileName(fileName);
	 board.setHit(0);
	 board.setId(id);
	 Date date = new Date();
	 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	 board.setWriteTime(sdf.format(date));
	 
	 BoardDAO boardDao = new BoardDAO();
	 boardDao.write(board);
	 boardDao.disconnection();
%>
<script>alert('게시글 등록 완료'); location.href='boardForm.jsp';</script>






