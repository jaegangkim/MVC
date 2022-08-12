package kr.board.dao;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.board.entity.Board;

// MyBatis Framework : Java <---------> SQL(XML파일)
public class BoardMyBatisDAO {
	private static SqlSessionFactory sqlSessionFactory;
	// 초기화 블럭(프로그램 실행 시 딱 한번만 실행)
	static {
		try {
		String resource = "kr/board/dao/mybatis-config.xml";
		InputStream inputStream = Resources.getResourceAsStream(resource);
		sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	// 게시판 전체 리스트 가져오기 메서드
	public List<Board> allList() {
		SqlSession session =sqlSessionFactory.openSession();
		List<Board> list = session.selectList("allList");
		session.close();
		return list;
	}
	public int boardWrite(Board vo) {
		SqlSession session =sqlSessionFactory.openSession();
		int cnt=session.insert("boardWrite", vo);
		session.commit(); // 완료
		session.close(); 
		return cnt;
	}
	public int boardDelete(int num) {
		SqlSession session =sqlSessionFactory.openSession();
		int cnt=session.delete("boardDelete", num);
		session.commit(); // 완료
		session.close(); 
		return cnt;
	}
	public Board boardView(int num) {
		SqlSession session =sqlSessionFactory.openSession();
		Board vo=session.selectOne("boardView", num);
		session.close(); 
		return vo;
	}
	public int boardUpdate(Board vo) {
		SqlSession session =sqlSessionFactory.openSession();
		int cnt=session.update("boardUpdate", vo);
		session.commit();
		session.close(); 
		return cnt;
	}
	public void countUpdate(int num) {
		 SqlSession session=sqlSessionFactory.openSession();
		 session.update("countUpdate", num);
		 session.commit();
		 session.close();		
	 }
}
