package kr.level_comm;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.board.controller.Controller;
import kr.dao.LevelMyBatisDAO;
import kr.entity.tbl_level_comment;
import kr.entity.tbl_member;

public class LevelCommentController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		tbl_level_comment vo = new tbl_level_comment();
		HttpSession session = request.getSession();
		tbl_member mvo = (tbl_member) session.getAttribute("mvo");
		//글번호
		int num = Integer.parseInt(request.getParameter("num"));
		//내용
		System.out.println(num);
		String content = request.getParameter("content");
		//이름
		System.out.println(content);
		vo.setLv_seq(num);
		vo.setLv_cmt_content(content);
		vo.setMb_id(mvo.getMb_id());
		vo.setLevel(mvo.getMb_level());
		System.out.println(mvo.getMb_id());
		LevelMyBatisDAO lvcmt = new LevelMyBatisDAO();
		lvcmt.Tbl_Level_Community_comm(vo);

		return "redirect:/levelView.do?num="+num;
	}

}
