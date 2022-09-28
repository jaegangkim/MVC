package kr.level.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.board.controller.Controller;
import kr.dao.LevelMyBatisDAO;
import kr.entity.Tbl_Level_Community;
import kr.entity.tbl_member;

public class LevelUpdateFormController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		Tbl_Level_Community vo =new Tbl_Level_Community();
		HttpSession session = request.getSession();
		tbl_member mvo = (tbl_member) session.getAttribute("mvo");
		LevelMyBatisDAO dao = new LevelMyBatisDAO();
		vo.setLevel(mvo.getMb_level());
		vo.setLv_seq(num);
		vo = dao.levelView(vo);
		request.setAttribute("vo", vo);
		return "levelUpdate";
	}

}
