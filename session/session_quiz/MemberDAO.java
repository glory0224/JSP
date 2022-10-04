package session_quiz;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class MemberDAO {
	private Connection con;

	public MemberDAO() {
		// 생성자 호출 시 DB 연결을 함.
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "oracle";
		String password = "oracle";

		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void disconnection() {
		// DB 연결을 종료함.
		try {
			if(con != null)
				con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public MemberDTO selectId(String id) {
		String sql = "SELECT * FROM session_quiz WHERE id = ?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				MemberDTO member = new MemberDTO();
				member.setId(rs.getString("id"));
				member.setPw(rs.getString("pw"));
				member.setUserName(rs.getString("username"));
				member.setAddress(rs.getString("address"));
				member.setMobile(rs.getString("mobile"));
				return member;
			} else {
				System.out.println("입력한 데이터는 존재하지 않습니다.");
			}
		} catch (Exception e) {
		}
		// 사용자가 매개변수로 전달한 아이디가 데이터베이스에 없다는 의미.
		return null;
	}
	
	public void insert(MemberDTO member) {
		PreparedStatement ps = null;
		String sql = "INSERT INTO session_quiz VALUES(?, ?, ?, ?, ?)";
		
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, member.getId());
			ps.setString(2, member.getPw());
			ps.setString(3, member.getUserName());
			ps.setString(4, member.getAddress());
			ps.setString(5, member.getMobile());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	/*
	  INSERT INTO session_quiz VALUES('user1', '1111', '유저일', '서울시', '010-1111-1111');
	  INSERT INTO session_quiz VALUES('user2', '2222', '유저이', '서울시', '010-2222-2222');
	  INSERT INTO session_quiz VALUES('user3', '3333', '유저삼', '서울시', '010-3333-3333');
	  INSERT INTO session_quiz VALUES('user4', '4444', '유저사', '서울시', '010-4444-4444');
	  INSERT INTO session_quiz VALUES('user5', '5555', '유저오', '서울시', '010-5555-5555');
	  INSERT INTO session_quiz VALUES('user6', '6666', '유저육', '서울시', '010-6666-6666');
	  INSERT INTO session_quiz VALUES('user7', '7777', '유저칠', '서울시', '010-7777-7777');
	  INSERT INTO session_quiz VALUES('user8', '8888', '유저팔', '서울시', '010-8888-8888');
	  INSERT INTO session_quiz VALUES('user9', '9999', '유저구', '서울시', '010-9999-9999');
	 */
	
	
	public ArrayList<MemberDTO> list(int begin, int end){
//		String sql = "SELECT * FROM session_quiz";
		String sql = "SELECT A.* FROM (SELECT ROWNUM rn, id, username, mobile FROM session_quiz)A WHERE rn >= ? AND rn <= ?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<MemberDTO> members = new ArrayList<>();
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, begin);
			ps.setInt(2, end);
			rs = ps.executeQuery();
			while(rs.next()) {
				MemberDTO member = new MemberDTO();
				member.setId(rs.getString("id"));
				member.setUserName(rs.getString("username"));
				member.setMobile(rs.getString("mobile"));
				members.add(member);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return members;
	}
	
	public int count(){
		String sql = "SELECT count(*) as cnt FROM session_quiz";
	
		PreparedStatement ps = null;
		ResultSet rs = null;
		int cnt = 0;
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt(1);
//				cnt = rs.getInt("cnt");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	
	public void update(MemberDTO member) {
		String sql = "UPDATE session_quiz SET pw=?, username=?, address=?, mobile=? WHERE id=?";
		PreparedStatement ps = null;
		
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, member.getPw());
			ps.setString(2, member.getUserName());
			ps.setString(3, member.getAddress());
			ps.setString(4, member.getMobile());
			ps.setString(5, member.getId());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void delete(String id) {
		String sql = "DELETE FROM session_quiz WHERE id=?";
		PreparedStatement ps = null;
		
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
