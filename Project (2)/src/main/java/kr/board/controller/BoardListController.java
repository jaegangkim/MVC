package kr.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.dao.BoardMyBatisDAO;
import kr.entity.Board;


public class BoardListController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Board vo = new Board();
		BoardMyBatisDAO dao = new BoardMyBatisDAO();
		List<Board> list = dao.allList();
		request.setAttribute("list", list); // 객체바인딩
		//System.out.println(list.get(0));
		//String nextPage = "boardList";
		return "boardList";
	}


}
