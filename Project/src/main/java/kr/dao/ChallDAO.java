package kr.dao;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.entity.Board;
import kr.entity.sumMonthPay;
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
		
	
	public List<sumMonthPay> sumMonPay(String c) {
		SqlSession session= sqlSessionFactory.openSession(); // openSession = 세션을 꺼내온다
		
		List<sumMonthPay> list = session.selectList("sumMonPay", c); // 여러개를 가져오는 selectList / id이름을 찾아간다
		session.close();
		return list;
	}
	public List<sumMonthPay> sumItemPay(String c) {
		SqlSession session= sqlSessionFactory.openSession(); // openSession = 세션을 꺼내온다
		
		List<sumMonthPay> list = session.selectList("sumItemPay", c); // 여러개를 가져오는 selectList / id이름을 찾아간다
		session.close();
		return list;
	}
	
	
}
