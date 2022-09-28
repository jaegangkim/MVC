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

public class LevelDeleteController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		LevelMyBatisDAO dao = new LevelMyBatisDAO();
		HttpSession session = request.getSession();
		tbl_member mvo = (tbl_member) session.getAttribute("mvo");
		int level = mvo.getMb_level();
		Tbl_Level_Community vo = new Tbl_Level_Community();
		vo.setLv_seq(num);
		vo.setLevel(level);
		dao.levelDelete(vo);
		return "redirect:/levelList.do";
	}
}
