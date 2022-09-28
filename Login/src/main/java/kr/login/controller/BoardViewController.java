package kr.login.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.login.dao.BoardMyBatisDAO;
import kr.login.entity.tbl_community;

public class BoardViewController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		BoardMyBatisDAO dao = new BoardMyBatisDAO();
		int num = Integer.parseInt(request.getParameter("num"));
		tbl_community vo = dao.boardView(num);
		dao.updateCount(num);
		request.setAttribute("vo",vo);
		return "board";
	}

}
