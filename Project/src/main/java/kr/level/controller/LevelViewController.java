package kr.level.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.board.controller.Controller;
import kr.dao.LevelMyBatisDAO;
import kr.entity.Comment;
import kr.entity.Tbl_Level_Community;
import kr.entity.tbl_member;

public class LevelViewController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Tbl_Level_Community vo = new Tbl_Level_Community();
		LevelMyBatisDAO dao = new LevelMyBatisDAO();
		HttpSession session = request.getSession();
		tbl_member mvo = (tbl_member) session.getAttribute("mvo");
		int num = Integer.parseInt(request.getParameter("num"));
		
		vo.setLevel(mvo.getMb_level());
		vo.setLv_seq(num);
		Tbl_Level_Community vo1 = dao.levelView(vo); // 효율
		
		List<Tbl_Level_Community> list = dao.lv_comm_AllList(vo);
		request.setAttribute("vo", vo1); // 객체 바인딩
		request.setAttribute("list", list);
		return "levelView";
		
	}

}
