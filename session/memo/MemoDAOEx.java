package memo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MemoDAOEx {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	String url, user, pass;
	
	public MemoDAOEx() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		url = "jdbc:oracle:thin:@localhost:1521:xe";
		user = "web01";
		pass = "web01";
	}
	
	public int insertMemo(MemoDTO dto) {
		try {
			con = DriverManager.getConnection(url, user, pass);
			String sql = "insert into memo values(?, ?, ?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getEmail());
			ps.setString(3, dto.getMemo());
			int res = ps.executeUpdate();
			return res;
		}catch(SQLException e) {
			System.out.println("insert 메소드 실행 중 오류 발생!!");
			e.printStackTrace();
		}finally {
			try {
				if (ps != null) ps.close();
				if (con != null) con.close();
			}catch(SQLException e) {}
		}
		return 0;
	}
	
	public List<MemoDTO> listMemo() {
		try {
			con = DriverManager.getConnection(url, user, pass);
			String sql = "select * from memo";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			List<MemoDTO> list = new ArrayList<>();
			while(rs.next()) {
				MemoDTO dto = new MemoDTO();
				dto.setId(rs.getString("id"));
				dto.setEmail(rs.getString("email"));
				dto.setMemo(rs.getString("memo"));
				list.add(dto);
			}
			return list;
		}catch(SQLException e) {
			System.out.println("list 메소드 실행 중 오류 발생!!");
			e.printStackTrace();
		}finally {
			try {
				if (rs != null) rs.close();
				if (ps != null) ps.close();
				if (con != null) con.close();
			}catch(SQLException e) {}
		}
		return null;
	}
}

















