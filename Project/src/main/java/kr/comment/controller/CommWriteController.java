package kr.comment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.board.controller.Controller;
import kr.dao.CommMyBatisDAO;
import kr.entity.Comment;
import kr.entity.tbl_member;

public class CommWriteController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		request.setCharacterEncoding("utf-8");
		CommMyBatisDAO dao = new CommMyBatisDAO();
		Comment cmt = new Comment(); 
		int num = Integer.parseInt(request.getParameter("num"));
		String comment = request.getParameter("comment");
		HttpSession session = request.getSession();
		tbl_member mvo = (tbl_member) session.getAttribute("mvo");
		cmt.setMb_id(mvo.getMb_id()); // mb_id가 들어간다
		cmt.setComm_seq(num);
		cmt.setComm_cmt_content(comment);
		dao.commWrite(cmt);
		
		return "redirect:/boardView.do?num="+num;
	}

}