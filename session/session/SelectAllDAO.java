package session;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Scanner;

public class SelectAllDAO {

	public static void main(String[] args) {
		Connection con = null;
		String url = "jdbc:oracle:thin:@localhost:1521:xe"; 
		String user = "oracle"; 
		String password = "oracle"; 
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			System.out.println("접근 실패");
		}
		
		
		String sql = "SELECT * FROM test";
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			// 모든 데이터를 while문으로 돌면서 출력한다. 값이 없으면 false로 종료 
			while(rs.next()) {
				System.out.println("아이디 : " + rs.getString("id"));
				System.out.println("비밀번호 : " + rs.getString("pw"));
				System.out.println("이름 : " + rs.getString("name"));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}

}
