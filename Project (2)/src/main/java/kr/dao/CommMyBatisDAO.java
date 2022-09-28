package kr.dao;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.entity.Comment;


public class CommMyBatisDAO {
	private static SqlSessionFactory sqlSessionFactory; // connectio을 빼야함
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
	
	public List<Comment> commAllList(int num) {
		// connection을 pool에서 꺼내와야함(메서드를 사용함)
		SqlSession session= sqlSessionFactory.openSession(); // openSession = 세션을 꺼내온다
		// mapper파일에 있는 select문 실행 (SQL연결)		
		// SQL 쿼리를 알아야 한다
		List<Comment> list = session.selectList("commAllList", num); // 여러개를 가져오는 selectList / id이름을 찾아간다
		session.close(); // 세션 반납
		return list;
	}
	
	public void commWrite(Comment cmt) {
		SqlSession session= sqlSessionFactory.openSession();
		session.insert("commWrite", cmt);
		session.commit();
		session.close();
	}

	public void commDelete(int num) {
		SqlSession session= sqlSessionFactory.openSession();
		session.delete("commDelete", num);
		session.commit();
		session.close();
	}
	
}
