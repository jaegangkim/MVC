package kr.level.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.board.controller.Controller;
import kr.dao.LevelMyBatisDAO;

import kr.entity.Mb_Level;
import kr.entity.Tbl_Level_Community;
import kr.entity.tbl_member;

public class LevelListController implements Controller {

	private Mb_Level vo1;

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		LevelMyBatisDAO dao = new LevelMyBatisDAO();
		
		HttpSession session = request.getSession();
		tbl_member mvo = (tbl_member) session.getAttribute("mvo");
		int level = mvo.getMb_level(); // num = 회원등급
		
		List<Tbl_Level_Community> list = dao.levelList(level);
		request.setAttribute("list", list);
	
		Mb_Level vo = new Mb_Level();
		vo1 = new Mb_Level();
		
		
		vo.setMb_id(mvo.getMb_id());
		int avg = dao.levelMyChart(vo);  // 에러
	    request.setAttribute("avg", avg);
	   
	    vo.setMb_level(mvo.getMb_level());
		int avg1 = dao.levelChart(vo);
	    request.setAttribute("avg1", avg1);
	    
	   
	    List<Mb_Level> list1 = dao.rankingList(level);
		request.setAttribute("list1",list1);
		
		request.setAttribute("mvo", mvo);
		return "levelList";
	}

}
