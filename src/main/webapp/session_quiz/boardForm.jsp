<%@page import="java.util.ArrayList"%>
<%@page import="session_quiz.BoardDAO"%>
<%@page import="session_quiz.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardForm</title>
</head>
<body>
<%@ include file="/session_quiz/header.jsp" %>
	<%
		String cp = request.getParameter("currentPage");
		int currentPage = 0;
		
		try{
			currentPage = Integer.parseInt(cp);
		}catch(Exception e){
			currentPage = 1;
		}
		
		if(currentPage < 1)
			currentPage = 1;

		int pageBlock = 3;
		int end = currentPage * pageBlock;
		int begin = end - pageBlock + 1;
		
		BoardDAO boardDao = new BoardDAO();
		ArrayList<BoardDTO> boards = boardDao.list(begin, end);
		if(boards.isEmpty() == true){
			out.print("<h1> 등록된 데이터가 존재하지 않습니다. </h1>");
			return;
		}else{
	%>
				<table border=1 align="center">
					<tr>
						<th width="50">No.</th>
						<th width="250">제목</th>
						<th width="100">작성자</th>
						<th width="100">작성일</th>
						<th width="50">조회수</th>
					</tr>
					<%for(BoardDTO board : boards){ %>
					<tr>
						<td><%=board.getNum() %></td>
						<td onclick="location.href='content.jsp?num=<%=board.getNum()%>'"> <%=board.getTitle() %></td>
						<td><%=board.getId() %></td>
						<td><%=board.getWriteTime() %></td>
						<td><%=board.getHit() %></td>
					</tr>
					<%} %>
					<tr>
						<td colspan=4>
						<%
					int totalCount = boardDao.count();
					boardDao.disconnection();
				 	int totalPage = totalCount / pageBlock;
					if(totalCount % pageBlock > 0) 
						totalPage++;
					
					if(currentPage <= 1){
						out.print("<a href='#'>[이전] </a>");
					}else{
						int tmp = currentPage - 1;
						out.print("<a href='boardForm.jsp?currentPage="+tmp+"'>[이전] </a>");
					}
			
					for(int i = 1; i <= totalPage; i++){
						if(i == currentPage){
							out.print("<b> " + i + "</b>");
						}else{
							out.print("<a href='boardForm.jsp?currentPage=" + i + "'> " + i + " </a>");
						}
					}
					
					if(currentPage >= totalPage){
						out.print("<a href='#'> [다음] </a>");
					}else{
						int tmp = currentPage + 1;
						out.print("<a href='boardForm.jsp?currentPage="+tmp+"'> [다음] </a>");
					}
				%>
						
						</td>
						<td>
							<input type="button" value="글쓰기" onclick="location.href='boardWrite.jsp'">
						</td>
					</tr>
				</table>
		<%} %>
<%@ include file="/session_quiz/footer.jsp" %>
</body>
</html>