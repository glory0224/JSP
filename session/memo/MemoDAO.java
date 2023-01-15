package memo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class MemoDAO {
	
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	String url, user, pass;
	
	public MemoDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		url = "jdbc:oracle:thin:@localhost:1522:xe";
		user = "web01";
		pass = "web01";
	}
	
	public void insertMemo(MemoDTO dto) throws SQLException {
		try {
			con = DriverManager.getConnection(url, user, pass);
			String sql = "insert into memo values(?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getEmail());
			ps.setString(3, dto.getMemo());		
			ps.executeUpdate();
		}catch(SQLException e) {
			// jsp는 예외 처리를 자동으로 해주지만 servlet은 그런 기능이 없어서 따로 여기서 잡아준다.
		System.out.println("insert중 오류 발생 ");
		e.printStackTrace();
		
		}finally {
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}

}
