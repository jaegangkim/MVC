package kr.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.dao.BoardMyBatisDAO;
import kr.entity.Board;


public class BoardUpdateFormController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BoardMyBatisDAO dao = new BoardMyBatisDAO();
		int num = Integer.parseInt(request.getParameter("num"));
		System.out.println(num);
		Board vo = dao.boardView(num); // boardView로 게시글을 select하여 기존값을 수정할 수 있게 보여주자
		request.setAttribute("vo", vo); 
		return "boardUpdate";
	}

}
