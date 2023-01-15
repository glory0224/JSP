package test;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import memo.MemoDAOEx;
import memo.MemoDTO;

public class MemoListServlet extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("EUC-KR");
		resp.setContentType("text/html; charset=EUC-KR");
		
		MemoDAOEx dao = new MemoDAOEx();
		List<MemoDTO> list = dao.listMemo();
		
		PrintWriter pw = resp.getWriter();
		
		pw.println("<html>");
		pw.println("<head><title>메모장</title></head>");
		pw.println("<body><div align='center'>");
		pw.println("<hr color='green' width='300'>");
		pw.println("<h2>메 모 장 보 기</h2>");  
		pw.println("<hr color='green' width='300'>");
		pw.println("<table border='1' width='500'>");
		pw.println("<tr bgcolor='yellow'>");
		pw.println("<th>아이디</th><th>이메일</th><th width='50%'>메모내용</th>");
		pw.println("</tr>");
		if (list==null || list.size() == 0) {
			pw.println("<tr><td colspan='3'>등록된 게시글이 없습니다.</td></tr>");
		}else {
			for(MemoDTO dto : list) {
				pw.println("<tr>");
				pw.println("<td>" + dto.getId() + "</td>");
				pw.println("<td>" + dto.getEmail() + "</td>");
				pw.println("<td>" + dto.getMemo() + "</td>");
				pw.println("</tr>");
			}
		}
		pw.println("</div></body></html>");
	}
	
}


