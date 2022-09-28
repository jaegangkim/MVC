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

public class LevelUpdateController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int num = Integer.parseInt(request.getParameter("num"));
		System.out.println(num);
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		Tbl_Level_Community vo = new Tbl_Level_Community();
		vo.setLv_title(title);
		vo.setLv_content(content);
		vo.setLv_seq(num);
		HttpSession session = request.getSession();
		tbl_member mvo = (tbl_member) session.getAttribute("mvo");
		vo.setLevel(mvo.getMb_level());
		LevelMyBatisDAO dao = new LevelMyBatisDAO();
		dao.levelUpdate(vo);
		return "redirect:/levelView.do?num="+num;
	}
}
