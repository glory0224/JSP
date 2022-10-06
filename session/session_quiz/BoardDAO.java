package session_quiz;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/*
INSERT INTO session_quiz_board VALUES(session_board_seq.nextval, 'admin', '게시글 제목1', '게시글 내용1', 'test1.txt', '2022-09-01', 0);
INSERT INTO session_quiz_board VALUES(session_board_seq.nextval, 'admin', '게시글 제목2', '게시글 내용2', 'test2.txt', '2022-09-02', 0);
INSERT INTO session_quiz_board VALUES(session_board_seq.nextval, 'user1', '게시글 제목3', '게시글 내용3', 'user1.txt', '2022-09-03', 0);
INSERT INTO session_quiz_board VALUES(session_board_seq.nextval, 'user1', '게시글 제목4', '게시글 내용4', 'user1.txt', '2022-09-04', 0);
INSERT INTO session_quiz_board VALUES(session_board_seq.nextval, 'user2', '게시글 제목5', '게시글 내용5', 'user2.txt', '2022-09-05', 0);
INSERT INTO session_quiz_board VALUES(session_board_seq.nextval, 'user2', '게시글 제목6', '게시글 내용6', 'user2.txt', '2022-09-06', 0);
INSERT INTO session_quiz_board VALUES(session_board_seq.nextval, 'test1', '게시글 제목7', '게시글 내용7', 'test1.txt', '2022-09-07', 0);
INSERT INTO session_quiz_board VALUES(session_board_seq.nextval, 'test1', '게시글 제목8', '게시글 내용8', 'test1.txt', '2022-09-08', 0);
INSERT INTO session_quiz_board VALUES(session_board_seq.nextval, 'test2', '게시글 제목9', '게시글 내용9', 'test2.txt', '2022-09-09', 0);
INSERT INTO session_quiz_board VALUES(session_board_seq.nextval, 'test2', '게시글 제목10', '게시글 내용10', 'test2.txt', '2022-09-10', 0);
 */
public class BoardDAO {
	private Connection con;
	
	public BoardDAO() {
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user= "oracle";
		String password=  "oracle";
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void disconnection() {
		try {
			if(con != null)
				con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<BoardDTO> list(int begin, int end){
//		String sql = "SELECT A.* FROM (SELECT ROWNUM rn, num, id, title, writetime, hit FROM session_quiz_board)A WHERE rn >= ? AND rn <= ?";
		String sql = "SELECT B.* FROM "
				+ "(SELECT ROWNUM rn, A.* FROM "
				+ "(SELECT num, id, title, writetime, hit FROM session_quiz_board ORDER BY num  DESC)A"
				+ ")B "
				+ "WHERE rn >= ? AND rn <= ?";
	
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<BoardDTO> boards = new ArrayList<>();
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, begin);
			ps.setInt(2, end);
			rs = ps.executeQuery();
			while(rs.next()) {
				BoardDTO board = new BoardDTO();
				board.setNum( rs.getInt("num") );
				board.setId(rs.getString("id") );
				board.setTitle(rs.getString("title"));
				board.setWriteTime(rs.getString("writetime"));
				board.setHit(rs.getInt("hit"));
				boards.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return boards;
	}
	
	public int count(){
		String sql = "SELECT count(*) as cnt FROM session_quiz_board";
	
		PreparedStatement ps = null;
		ResultSet rs = null;
		int cnt = 0;
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	public void write(BoardDTO board) {
		String sql = "INSERT INTO session_quiz_board VALUES(session_board_seq.nextval, ?,?,?, ?,?,?)";
		PreparedStatement ps = null;
	
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, board.getId());
			ps.setString(2, board.getTitle());
			ps.setString(3, board.getContent());
			ps.setString(4, board.getFileName());
			ps.setString(5, board.getWriteTime());
			ps.setInt(6, board.getHit());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}
	
//	INSERT INTO session_quiz_board VALUES(session_board_seq.nextval, 'admin', '게시글 제목1', '게시글 내용1', 'test1.txt', '2022-09-01', 0);
	public BoardDTO selectNum(int num) {
		String sql = "SELECT * FROM session_quiz_board WHERE num=?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			if(rs.next()) {
				BoardDTO board = new BoardDTO();
				board.setNum(num);
				board.setId(rs.getString("id"));
				board.setTitle(rs.getString("title"));
				board.setContent(rs.getString("content"));
				board.setFileName(rs.getString("filename"));
				board.setWriteTime(rs.getString("writetime"));
				board.setHit(rs.getInt("hit"));
				return board;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	
	public void incrementHit(int num, int hit) {
		String sql = "UPDATE session_quiz_board SET hit=? WHERE num=?";
		PreparedStatement ps = null;
	
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, hit);
			ps.setInt(2, num);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 게시글 수정 
	public void modify(int num, String title, String content) {
		String sql = "UPDATE session_quiz_board SET title=?, content=? WHERE num=?";
		PreparedStatement ps = null;
	
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, title);
			ps.setString(2, content);
			ps.setInt(3, num);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void delete(int num) {
		String sql = "DELETE FROM session_quiz_board WHERE num=?";
		PreparedStatement ps = null;
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}













