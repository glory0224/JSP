package test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import memo.MemoDAOEx;
import memo.MemoDTO;

public class MemoInsertServlet extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("EUC-KR");
		resp.setContentType("text/html; charset=EUC-KR");
		
		MemoDTO dto = new MemoDTO();
		dto.setId(req.getParameter("id"));
		dto.setEmail(req.getParameter("email"));
		dto.setMemo(req.getParameter("memo"));
		
		MemoDAOEx dao = new MemoDAOEx();
		int res = dao.insertMemo(dto);
		PrintWriter pw = resp.getWriter();
		if (res>0) {
			pw.println("<script type='text/javascript'>");
			pw.println("alert('메모 등록 성공!! 메모보기페이지로 이동합니다.')");
			pw.println("location.href='memolist.do'");
			pw.println("</script>");
		}else {
			pw.println("<script type='text/javascript'>");
			pw.println("alert('메모 등록 실패!! 메모등록페이지로 이동합니다.')");
			pw.println("location.href='memo.jsp'");
			pw.println("</script>");
		}
	}
	
}












