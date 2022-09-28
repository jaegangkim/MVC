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

public class LevelWriteController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		LevelMyBatisDAO dao = new LevelMyBatisDAO();
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		HttpSession session = request.getSession();
		tbl_member mvo = (tbl_member) session.getAttribute("mvo"); // 회원세션 가져오기
		String id = mvo.getMb_id();
		int level = mvo.getMb_level();
		Tbl_Level_Community vo = new Tbl_Level_Community();
		vo.setLevel(level);
		vo.setLv_title(title);
		vo.setLv_content(content);
		vo.setMb_id(id);
		
		dao.levelWrite(vo);
		
		return "redirect:/levelList.do";
	}

}
