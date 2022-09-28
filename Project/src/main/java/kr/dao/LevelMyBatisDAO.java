package kr.dao;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.entity.Mb_Level;
import kr.entity.Tbl_Level_Community;
import kr.entity.tbl_level_comment;

public class LevelMyBatisDAO {
	private static SqlSessionFactory sqlSessionFactory; // connection을 빼야함
	private Mb_Level vo;
	private Mb_Level vo2;
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
	
	public List<Tbl_Level_Community> levelList(int level) {
		// connection을 pool에서 꺼내와야함(메서드를 사용함)
		SqlSession session= sqlSessionFactory.openSession(); // openSession = 세션을 꺼내온다
		// mapper파일에 있는 select문 실행 (SQL연결)		
		// SQL 쿼리를 알아야 한다
		Tbl_Level_Community tb = new Tbl_Level_Community();
		tb.setLevel(level);
		List<Tbl_Level_Community> list = session.selectList("levelList", tb); // 여러개를 가져오는 selectList / id이름을 찾아간다
		session.close(); // 세션 반납
		return list;
	}
	//댓글 불러오기
	public List<Tbl_Level_Community> lv_comm_AllList(Tbl_Level_Community vo) {
		SqlSession session= sqlSessionFactory.openSession(); // openSession = 세션을 꺼내온다
		System.out.println(vo.getLv_seq());
		List<Tbl_Level_Community> list = session.selectList("lv_comm_AllList", vo); // 여러개를 가져오는 selectList / id이름을 찾아간다
		session.close(); // 세션 반납
		return list;
	}
	//댓글 쓰기 
	public void Tbl_Level_Community_comm(tbl_level_comment vo) {
		SqlSession session = sqlSessionFactory.openSession();
		session.insert("Tbl_Level_Community_comm",vo);
		session.commit();
		session.close();
	}
	
	public void levelWrite(Tbl_Level_Community vo) {
		SqlSession session= sqlSessionFactory.openSession();
		session.insert("levelWrite", vo); // 왼쪽 : 쿼리문 insert id를 찾아감, 오른쪽 : vo > insert할 데이터
		session.commit(); // 실행 완료 // 위에서는 select이기에 commit을 안해도 된다
		session.close();
	}

	public void levelCountUpdate(int level) {
		SqlSession session= sqlSessionFactory.openSession(); // Connection을 Pool에서 꺼내온다
		session.update("levelCountUpdate", level);
		session.commit();
		session.close();
	} 
	public Tbl_Level_Community levelView(Tbl_Level_Community vo1) {
		SqlSession session= sqlSessionFactory.openSession();
		Tbl_Level_Community vo = session.selectOne("levelView", vo1); // 왼쪽 : id / 오른쪽 : 데이터
		session.close();
		return vo;
	}

	public void levelUpdate(Tbl_Level_Community vo) {
		SqlSession session= sqlSessionFactory.openSession();
		session.update("levelUpdate", vo);
		session.commit();
		session.close();
	}

	public void levelDelete(Tbl_Level_Community haha) {
		SqlSession session= sqlSessionFactory.openSession();
		session.delete("levelDelete", haha);
		session.commit();
		session.close();
	}
	public Tbl_Level_Community levelrescent() {
		SqlSession session = sqlSessionFactory.openSession();
		Tbl_Level_Community vo = session.selectOne("levelrescent");
		session.close();
		return vo;
	}
	 public int levelMyChart(Mb_Level vo1) {
			SqlSession session= sqlSessionFactory.openSession();
			vo2 = new Mb_Level();
			System.out.println(vo1.getMb_id());
		    int avg = session.selectOne("levelMyChart", vo1); 
			System.out.println(avg);
			session.close(); // 세션 반납
			return avg;
		}
	   public int levelChart(Mb_Level vo1) {
			
			SqlSession session= sqlSessionFactory.openSession();
			vo = new Mb_Level();
			System.out.println(vo1.getMb_id());
		    int avg1 = session.selectOne("levelChart", vo1); 
			System.out.println(avg1);
			session.close(); // 세션 반납
			return avg1;
		}
	   
	   public List<Mb_Level> rankingList(int level){
		   SqlSession session= sqlSessionFactory.openSession(); 
		   Mb_Level mt = new Mb_Level();
		   mt.setMb_level(level);
		   List<Mb_Level> list = session.selectList("rankingList", mt); 
		   System.out.println(list.get(0).getMb_name());
			session.close(); // 세션 반납
			return list;
	   } 
	
}
