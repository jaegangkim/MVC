package kr.dao;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.entity.SavePoint;


public class SavePointMyBatisDAO {
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
	public List<SavePoint> savePointList() {
		SqlSession session= sqlSessionFactory.openSession();
		List<SavePoint> list = session.selectList("savePointAllList"); // 여러개를 가져오는 selectList / id이름을 찾아간다
		session.close(); // 세션 반납
		return list;
	}
	public SavePoint savePointView(int num) {
		SqlSession session= sqlSessionFactory.openSession();
		SavePoint vo = session.selectOne("savePointView", num);
		System.out.println(vo);
		session.close();
		return vo;
	}
	
}
