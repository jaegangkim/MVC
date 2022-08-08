package kr.board.dao;
//jdbc
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import kr.board.entity.Board;
public class BoardDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public Connection getConnect() {
		// ojdvc6.jar를 webapp/web-inf/lib에 넣기
		String url="jdbc:oracle:thin:@127.0.0.1:1521:XE";
		String username="scott";
		String password="tiger";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, username, password);
		} catch (Exception e) {
			e.printStackTrace();
		}return conn;
	}
	
	// 게시판 전체 리스트를 리턴 해주는 메서드
	public List allList() {
		conn = getConnect();
		String SQL="select * from board";
		List<Board> list = new ArrayList<Board>();
		try {
			ps = conn.prepareStatement(SQL);
			rs = ps.executeQuery();
			while(rs.next()) {
				int num = rs.getInt("num");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String writer = rs.getString("writer");
				String indate = rs.getString("indate");
				int count = rs.getInt("count");
				Board vo = new Board(num,title,content,writer,indate,count);
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		} return list;
	}
	
	//boardWrite(Board vo)
	public int boardWrite(Board vo) {
		String SQL="insert into board(num,title,content,writer) values(board_num.nextval,?,?,?)";
		conn = getConnect();
		int cnt=-1;
		try {
			ps = conn.prepareStatement(SQL);
			ps.setString(1, vo.getTitle());
			ps.setString(2, vo.getContent());
			ps.setString(3, vo.getWriter());
			cnt = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}return cnt;
	}
	
	public int boardDelete(int num) {
		String SQL = "delete from board where num=?";
		Connection conn = getConnect();
		int cnt=-1;
		try {
			ps = conn.prepareStatement(SQL);
			ps.setInt(1, num);
			cnt = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		} return cnt;
	}
	
	public Board boardView(int num) {
		String SQL = "select * from board where num=?";
		Connection conn = getConnect();
		Board vo = null;
		try {
			ps = conn.prepareStatement(SQL);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			if(rs.next()) {
				num = rs.getInt("num");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String writer = rs.getString("writer");
				String indate = rs.getString("indate");
				int count = rs.getInt("count");
				vo = new Board(num,title,content,writer,indate,count);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	finally {
			dbClose();
		} 
		return vo;
	}
	
	public int boardUpdate(Board vo) {
		String SQL ="update board set title=?,content=? where num=?";
		int cnt =-1;
		conn = getConnect();
		try {
			ps = conn.prepareStatement(SQL);
			ps.setString(1, vo.getTitle());
			ps.setString(2, vo.getContent());
			ps.setInt(3,vo.getNum());
			cnt = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		} return cnt;
	}
	
	public void countUpdate(int num) {
		String SQL="update board set count=count+1 where num=?";
		conn = getConnect();
		try {
			ps =conn.prepareStatement(SQL);
			ps.setInt(1, num);
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
	}
	
	public void dbClose() {
		try{if(rs!=null) rs.close();
		if(ps!=null) ps.close();
		if(conn!=null) conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}		
	}
	
}