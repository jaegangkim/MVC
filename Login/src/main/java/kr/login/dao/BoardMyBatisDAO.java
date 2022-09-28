package kr.login.dao;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.login.entity.tbl_community;
import kr.login.entity.tbl_member;

public class BoardMyBatisDAO {
	private static SqlSessionFactory sqlSessionFactory;// 여기에 들어있는 connection을 꺼내서 쓴다.
	// 초기화 블럭(프로그램 실행시 딱 한번만 실행)
	static {
		try {
			String resource = "kr/login/dao/mybatis-config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory =
			  new SqlSessionFactoryBuilder().build(inputStream);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
		// 게시판 전체리스트 가져오기 메서드
		public List<tbl_community> allList() { 
			SqlSession session = sqlSessionFactory.openSession();
			List<tbl_community> list = session.selectList("allList"); // select * from board oder by num
			session.close();
			return list;
		}
		
		
		public tbl_community boardView(int num) {
			SqlSession session =sqlSessionFactory.openSession();
			tbl_community vo=session.selectOne("boardView", num);
			session.close(); 
			return vo;
		}


		public List<tbl_community> topList() {
			SqlSession session = sqlSessionFactory.openSession();
			List<tbl_community> list = session.selectList("topList"); // select * from board oder by count
			session.close();
			return list;
		}
		
		public int updateCount(int m) {
			SqlSession session = sqlSessionFactory.openSession();
			int cnt = session.update("updateCount", m);
			session.commit();
			session.close();
			return cnt;
		}
		
}
		
