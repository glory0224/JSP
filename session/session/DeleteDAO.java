package session;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class DeleteDAO {

	public static void main(String[] args) {
	Connection con = null;
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "oracle";
		String password = "oracle";
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		Scanner sc = new Scanner(System.in);
		System.out.println("삭제 할 아이디 :"); String id = sc.next();
		
		String sql = "DELETE FROM test WHERE id=?";
		PreparedStatement ps = null;
		
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			
			int result = ps.executeUpdate();
			
			if(result != 0) 
				System.out.println("삭제가 완료 되었습니다.");
			else
				System.out.println("삭제가 실패했습니다. 아이디를 확인하세요.");
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
