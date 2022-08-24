package kr.login.dao;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.login.entity.Board;

public class BoardMyBatisDAO {
	private static SqlSessionFactory sqlSessionFactory;// 여기에 들어있는 connection을 꺼내서 쓴다.
	// 초기화 블럭(프로그램 실행시 딱 한번만 실행)
	static {
		try {
			String resource = "kr/login/dao/mybatis-board-config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory =
			  new SqlSessionFactoryBuilder().build(inputStream);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
		// 게시판 전체리스트 가져오기 메서드
		public List<Board> allList() { 
			SqlSession session = sqlSessionFactory.openSession();
			List<Board> list = session.selectList("allList"); // select * from board oder by num
			session.close();
			return list;
		}
		
		
		public Board boardView(int num) {
			SqlSession session =sqlSessionFactory.openSession();
			Board vo=session.selectOne("boardView", num);
			session.close(); 
			return vo;
		}


		public List<Board> topList() {
			SqlSession session = sqlSessionFactory.openSession();
			List<Board> list = session.selectList("topList"); // select * from board oder by count
			session.close();
			return list;
		}
		
}
