package kr.dao;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.entity.tbl_member_challenge;



public class ChallDAO {
	private static SqlSessionFactory sqlSessionFactory;// 여기에 들어있는 connection을 꺼내서 쓴다.
	// 초기화 블럭(프로그램 실행시 딱 한번만 실행)
	static {
		try {
			String resource = "kr/dao/mybatis-config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory =
			  new SqlSessionFactoryBuilder().build(inputStream);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
		
	public int insertChall(tbl_member_challenge c) {
		SqlSession session = sqlSessionFactory.openSession();
		int cnt = session.insert("insertChall", c);
		session.commit();
		session.close();
		return cnt;
	}
		
		
}
