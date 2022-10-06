<%@page import="session_quiz.BoardDTO"%>
<%@page import="session_quiz.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>content</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	<%
		String n = request.getParameter("num");
		int num = 0;
		try{
			num = Integer.parseInt(n);
		}catch(Exception e){
			response.sendRedirect("boardForm.jsp");
			return;
		}
		
		BoardDAO boardDao = new BoardDAO();
		BoardDTO board = boardDao.selectNum(num);
		if(board == null){
			response.sendRedirect("boardForm.jsp");
			return;
		}
		int hit = board.getHit();
		hit++;
		boardDao.incrementHit(num, hit);
		boardDao.disconnection();
	%>
	<table border="1" align="center">
		<caption>
				<font size=5><b>글 내용</b></font>
		</caption>
		<tr>
			<th width="100">작성자</th> 
			<td width="200"><%=board.getId() %></td>
			<th width="100">조회수</th> 
			<td width="200"> <%=hit%> </td>
	
		</tr>
		<tr>
			<th>작성일</th> <td><%=board.getWriteTime() %></td>
			<th>다운로드</th> 
			<!-- 파일 다운로드를 위한 식별자를 넘겨준다. -->
			<td onclick="location.href='fileDown.jsp?fileName=<%=board.getFileName()%>&writeId=<%=board.getId()%>'">
			<%=board.getFileName()%>
			</td>
	
		</tr>
		<tr>
			<th>제목</th> <td colspan=3><%=board.getTitle() %></td>
		</tr>
		<tr>
			<th>문서내용</th> <td colspan=3><%=board.getContent()%></td>
		</tr>
		<tr>
			<td colspan=4>
				<button type="button"  onclick="location.href='boardForm.jsp'">목록</button>
				<!-- 사용자의 id로 게시글을 들어갈 때만 보이게 if문 설정 -->
				<%if(board.getId().equals(session.getAttribute("id"))) {%>
				<!-- 게시글 수정 식별자로 게시글 번호인 num을 넘겨준다.  -->
				<button type="button"  onclick="location.href='boardModify.jsp?num=<%=board.getNum()%>'">수정</button>
				<button type="button"  onclick="location.href='boardDelete.jsp?num=<%=board.getNum()%>'">삭제</button>
			<%} %>
			
			</td>
		</tr>
	</table>
	<%@ include file="footer.jsp" %>
</body>
</html>