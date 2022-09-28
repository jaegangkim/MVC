package kr.dao;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.entity.Board;


public class BoardMyBatisDAO {
	private static SqlSessionFactory sqlSessionFactory; // connection을 빼야함
	static { // 초기화 블럭(프로그램 실행 시 딱 한번만 실행)
		try {		
			String resource = "kr/dao/mybatis-config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource); // 빨대 생성 || api에서 객체를 받아온다
			sqlSessionFactory =
			  new SqlSessionFactoryBuilder().build(inputStream); //build 가 빨대를 받아 xml을 읽어들여 Connection POOL 생성
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	// 게시판 전체리스트 가져오기 메서드
	public List<Board> allList() {
		// connection을 pool에서 꺼내와야함(메서드를 사용함)
		SqlSession session= sqlSessionFactory.openSession(); // openSession = 세션을 꺼내온다
		// mapper파일에 있는 select문 실행 (SQL연결)		
		// SQL 쿼리를 알아야 한다
		List<Board> list = session.selectList("allList"); // 여러개를 가져오는 selectList / id이름을 찾아간다
		session.close(); // 세션 반납
		return list;
	}
	
	public void boardWrite(Board vo) {
		SqlSession session= sqlSessionFactory.openSession();
		session.insert("boardWrite", vo); // 왼쪽 : 쿼리문 insert id를 찾아감, 오른쪽 : vo > insert할 데이터
		session.commit(); // 실행 완료 // 위에서는 select이기에 commit을 안해도 된다
		session.close();
	}

	public void countUpdate(int num) {
		SqlSession session= sqlSessionFactory.openSession(); // Connection을 Pool에서 꺼내온다
		session.update("countUpdate", num);
		session.commit();
		session.close();
	}

	public Board boardView(int num) {
		SqlSession session= sqlSessionFactory.openSession();
		Board vo = session.selectOne("boardView", num); // select할 num
		session.close();
		return vo;
	}

	public void boardUpdate(Board vo) {
		SqlSession session= sqlSessionFactory.openSession();
		session.update("boardUpdate", vo);
		session.commit();
		session.close();
	}

	public void boardDelete(int num) {
		SqlSession session= sqlSessionFactory.openSession();
		session.delete("boardDelete", num);
		session.commit();
		session.close();
	}
	public List<Board> topList() {
		SqlSession session = sqlSessionFactory.openSession();
		List<Board> list = session.selectList("topList"); // select * from board oder by count
		session.close();
		return list;
	}
	public Board rescent() {
		SqlSession session = sqlSessionFactory.openSession();
		Board vo = session.selectOne("rescent"); 
		session.close();
		return vo;
	}
	public void likesUpdate(int num) {
		SqlSession session= sqlSessionFactory.openSession();
		session.update("likesUpdate", num);
		session.commit();
		session.close();
	}
	public void likesCancel(int num) {
		SqlSession session= sqlSessionFactory.openSession();
		session.update("likesCancel", num);
		session.commit();
		session.close();
	}
	public void commentCount(int num) {
		SqlSession session= sqlSessionFactory.openSession();
		session.update("commentCount", num);
		session.commit();
		session.close();
	}
	
}