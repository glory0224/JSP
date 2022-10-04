package session;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Scanner;

public class SelectDAO {

	public static void main(String[] args) {
		Connection con = null;
		// JDBC : Java DataBase Connectivity
		// oracle: 연결할 데이터베이스 프로그램명
		// thin : 경량화
		// localhost : 데이터베이스 서버의 IP주소, localhost == 자기자신 IP주소
		String url = "jdbc:oracle:thin:@localhost:1521:xe"; // 오라클 위치
		String user = "oracle"; // 오라클 계정 아이디
		String password = "oracle"; // 오라클 계정 비밀번호
		try {
			// ojdbc6.jar 드라이버 실행
			Class.forName("oracle.jdbc.OracleDriver");
			
			// 데이터베이스에 접근 후 아이디/비밀번호 입력해서 인증 받고 연결정보를 반환한다.
			con = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			System.out.println("접근 실패");
		}
		System.out.println("접근 완료");
		
		
		// 데이터베이스로 명령문을 전달해 정보를 획득
		// ? : 변경할 데이터는 물음표로 표현
		Scanner sc = new Scanner(System.in);
		System.out.print("조회할 계정 아이디 : ");
		String id = sc.next();
		
		String sql = "SELECT * FROM test WHERE id = ?";
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			ps = con.prepareStatement(sql);
			// ps.setString(물음표의 위치(시작1), 교체할 데이터);
			ps.setString(1, id);
//			ps.setString(2, pw);
			//데이터베이스로 명령문 전달 후 결과를 반환
			rs = ps.executeQuery();
			//rs.next() : 반환된 결과에 데이터의 존재여부를 true or false
			// 반환된 결과값에 접근, 데이터는 여러 행으로 얻어오면 다음 행으로 이동
			if(rs.next()) {
				System.out.println("아이디 : " + rs.getString("id"));
				System.out.println("비밀번호 : " + rs.getString("pw"));
				System.out.println("이름 : " + rs.getString("name"));
			}else {
				System.out.println("입력한 데이터는 존재하지 않습니다.");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}

}
