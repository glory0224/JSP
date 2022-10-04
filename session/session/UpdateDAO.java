package session;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class UpdateDAO {

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
		System.out.println("수정 할 아이디 :"); String id = sc.next();
		System.out.println("비밀번호 : "); String pw = sc.next();
		System.out.println("이름 : "); String name = sc.next();
		
		
		String sql = "UPDATE test SET pw=?, name=? WHERE id=?";
		PreparedStatement ps = null;
		
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, pw);
			ps.setString(2, name);
			ps.setString(3, id);
			
			int result = ps.executeUpdate();
			
			if(result != 0) 
				System.out.println("데이터 입력이 완료 되었습니다.");
			else
				System.out.println("데이터 입력에 문제가 발생했습니다. 관리자에게 문의하세요.");
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
