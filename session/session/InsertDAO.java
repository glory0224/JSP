package session;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;


public class InsertDAO {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		Connection con = null;
		PreparedStatement ps = null;
		
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "oracle";
		String password = "oracle";
		String sql = "INSERT INTO test VALUES(?,?,?)";
		
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection(url, user, password);
			
			System.out.print("아이디 : "); String id = sc.next();
			System.out.print("비밀번호 : "); String pw = sc.next();
			System.out.print("이름 : "); String name = sc.next();
			
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, pw);
			ps.setString(3, name);
			
			// SELECT 명령이 아닌 것들 INSERT, UPDATE, DELETE는 executeUpdate 사용
			// return 값을 받아서 출력을 둘 경우 
			int result = ps.executeUpdate();
			
			if(result != 0) 
				System.out.println("데이터 입력이 완료 되었습니다.");
			else
				System.out.println("데이터 입력에 문제가 발생했습니다. 관리자에게 문의하세요.");
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
