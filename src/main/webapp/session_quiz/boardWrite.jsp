<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardWrite</title>
</head>
<body>
<%@ include file="/session_quiz/header.jsp" %>
	<form action="boardWriteService.jsp" method="post" enctype="multipart/form-data">
		<table border=1 align="center">
			<caption>
				<font size=5><b>게시글 등록</b></font>
			</caption>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" style="width:98%"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="50" name="content"></textarea></td>
			</tr>
			<tr>
				<th>파일첨부</th>
				<td><input type="file" name="upfile"></td>
			</tr>
			<tr align="center">
				<td colspan=2>
					<input type="submit" value="글쓰기">
					<input type="button" value="목록" onclick="location.href='boardForm.jsp'">
				</td>
			</tr>
		</table>
	</form>
	<%@ include file="/session_quiz/footer.jsp" %>
</body>
</html>