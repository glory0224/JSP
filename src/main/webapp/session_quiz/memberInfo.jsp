<%@page import="session_quiz.MemberDAO"%>
<%@page import="session_quiz.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberInfo</title>
</head>
<body>
	<%@ include file="/session_quiz/header.jsp" %>
	<div align="center">
		<h1>회원 목록</h1>
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
		
			// 한 페이지에 출력할 회원 최대수 
			int pageBlock = 3;
			
			/*
				currentPage = 1;
				end = currentPage(1) * pageBlock(3);
				begin = end(3) - pageBlock(3) + 1;
				
				currentPage = 2;
				end = currentPage(2) * pageBlock(3);
				begin = end(6) - pageBlock(3) + 1;
			*/
			
			int end = currentPage * pageBlock;
			int begin = end - pageBlock + 1;
			
			
			MemberDAO memberDao = new MemberDAO();
			ArrayList<MemberDTO> members = memberDao.list(begin, end);
			if(members.isEmpty() == true){
				out.print("<h1> 등록된 데이터가 존재하지 않습니다. </h1>");
				return;
			}else{
		%>
				<table border=1>
					<thead>
						<tr>
							<th>아이디</th>
							<th>이름</th>
							<th>전화번호</th>
						</tr>
					</thead>
					<tbody>
					<%for(MemberDTO member : members){ %>
						<tr>
							<td onclick="location.href='userInfo.jsp?id=<%=member.getId()%>'">
								<%=member.getId() %>
							</td>
							<td><%=member.getUserName() %></td>
							<td><%=member.getMobile() %></td>
						</tr>
					<%} %>
					</tbody>
				</table>
				<%
					int totalCount = memberDao.count();
				 	int  totalPage = totalCount / pageBlock;
					if(totalCount % pageBlock > 0) 
						totalPage++;
					
					if(currentPage <= 1){
						out.print("<a href='#'>[이전] </a>");
					}else{
						int tmp = currentPage - 1;
						out.print("<a href='memberInfo.jsp?currentPage="+tmp+"'>[이전] </a>");
					}
					/*
						총 데이터의 수 : 10
						한 페이지에 출력할 데이터의 수 : 3
						총 페이지 : 10 / 3 = 3, 3 + 1 = 4pages
						
						총 데이터의 수 : 9
						한 페이지에 출력할 데이터의 수 : 3
						총 페이지 : 9 / 3 = 3, 3pages
						
						
						총 데이터의 수 : DB에서 조회한 결과를 totalCount 변수에 담아서 사용
						한 페이지에 출력할 데이터의 수 : pageBlock(3)	
						총 페이지의 수 
						: totalPage = totalCount / pageBlock
						: if(totalCount % pageBlock > 0) totalPage++;
					*/
				
					for(int i = 1; i <= totalPage; i++){
						if(i == currentPage){
							out.print("<b> " + i + "</b>");
						}else{
							out.print("<a href='memberInfo.jsp?currentPage=" + i + "'> " + i + " </a>");
						}
							
					}
					
					if(currentPage >= totalPage){
						out.print("<a href='#'> [다음] </a>");
					}else{
						int tmp = currentPage + 1;
						out.print("<a href='memberInfo.jsp?currentPage="+tmp+"'> [다음] </a>");
					}
				%>

				
		<%} %>
	</div>
	<%@ include file="/session_quiz/footer.jsp" %>
</body>
</html>






























