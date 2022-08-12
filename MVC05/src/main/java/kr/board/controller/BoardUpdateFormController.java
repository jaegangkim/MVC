package kr.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.board.dao.BoardMyBatisDAO;
import kr.board.entity.Board;

public class BoardUpdateFormController implements Controller{

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BoardMyBatisDAO dao = new BoardMyBatisDAO();
		// 수정데이터 -> 수정화면(JSP)
		int num = Integer.parseInt(request.getParameter("num"));
		Board vo = dao.boardView(num);
		request.setAttribute("vo", vo);
		return "boardUpdate";
	}
	
}
