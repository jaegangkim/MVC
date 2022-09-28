package kr.dao;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.entity.tbl_member;


public class LoginMyBatisDAO {
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

		public tbl_member memberLogin(tbl_member m) {
			SqlSession session = sqlSessionFactory.openSession();
			tbl_member mvo = session.selectOne("memberLogin", m);
			session.close();
			return mvo;
		}

		public int memberSignUp(tbl_member m) {
			SqlSession session = sqlSessionFactory.openSession();
			int cnt = session.insert("memberSignUp", m);
			session.commit();
			session.close();
			return cnt;
		}
		public int updateMyPage(tbl_member m) {
			SqlSession session = sqlSessionFactory.openSession();
			int cnt = session.update("updateMyPage", m);
			session.commit();
			session.close();
			return cnt;
		}
		public int memberDelete(String mb_id) {
			SqlSession session = sqlSessionFactory.openSession();
			int cnt = session.delete("memberDelete", mb_id);
			session.commit();
			session.close();
			return cnt;
		}
}