package test;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import memo.MemoDAO;
import memo.MemoDTO;

public class MemoServlet extends HttpServlet{
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("post 매핑 성공");
		
		
		String id = req.getParameter("id");
		String email = req.getParameter("email");
		String memo = req.getParameter("memo");
		
		System.out.println("id : " + id);
		System.out.println("email : " + email);
		System.out.println("memo : " + memo);
		
		MemoDTO mem = new MemoDTO();
		MemoDAO memoDao = new MemoDAO();
		
		
		mem.setId(id);
		mem.setEmail(email);
		mem.setMemo(memo);
		
		
		
		try {
			memoDao.insertMemo(mem);
			resp.sendRedirect("/jspExam/");
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
			
			
	
	}
}
