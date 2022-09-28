package kr.main.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.board.controller.Controller;
import kr.dao.BoardMyBatisDAO;
import kr.dao.ChallDAO;
import kr.entity.Board;
import kr.entity.sumMonthPay;
import kr.entity.tbl_member;


public class MainFormController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BoardMyBatisDAO dao = new BoardMyBatisDAO();
		List<Board> list = dao.topList();
		request.setAttribute("list", list); //
		
		return "main";
	}

}
