package kr.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.dao.BoardMyBatisDAO;
import kr.dao.CommMyBatisDAO;
import kr.entity.Board;
import kr.entity.Comment;

public class LikesController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		BoardMyBatisDAO dao = new BoardMyBatisDAO();
		int num = Integer.parseInt(request.getParameter("num"));
		dao.likesUpdate(num);
		
		Board vo = dao.boardView(num); 
		request.setAttribute("vo", vo); // 게시글 데이터
		
		return null;
	}

}
