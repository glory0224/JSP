package sessionDB;

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
			System.out.println("jdbc 연결이 안됩니다.");
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
		String sql = "SELECT * FROM sessionDB WHERE id = ?";

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
				member.setName(rs.getString("name"));
				member.setEmail(rs.getString("email"));
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
		String sql = "INSERT INTO sessionDB VALUES(?, ?, ?, ?)";
		
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, member.getId());
			ps.setString(2, member.getPw());
			ps.setString(3, member.getName());
			ps.setString(4, member.getEmail());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<MemberDTO> list(){
		String sql = "SELECT * FROM sessionDB";
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<MemberDTO> members = new ArrayList<>();
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				MemberDTO member = new MemberDTO();
				member.setId(rs.getString("id"));
				member.setPw(rs.getString("pw"));
				member.setName(rs.getString("name"));
				member.setEmail(rs.getString("email"));
				members.add(member);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return members;
	}
	
	public void update(MemberDTO member) {
		String sql = "UPDATE sessionDB SET pw=?, name=?, email=? WHERE id=?";
		PreparedStatement ps = null;
		
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, member.getPw());
			ps.setString(2, member.getName());
			ps.setString(3, member.getEmail());
			ps.setString(4, member.getId());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void delete(String id) {
		String sql = "DELETE FROM sessionDB WHERE id=?";
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













