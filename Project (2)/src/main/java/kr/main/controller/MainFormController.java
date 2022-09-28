package kr.main.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.board.controller.Controller;
import kr.dao.BoardMyBatisDAO;
import kr.entity.Board;


public class MainFormController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BoardMyBatisDAO dao = new BoardMyBatisDAO();
		List<Board> list = dao.allList();
		request.setAttribute("list", list);
		
		return "main";
	}

}
