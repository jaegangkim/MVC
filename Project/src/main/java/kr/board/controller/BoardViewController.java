package kr.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.dao.BoardMyBatisDAO;
import kr.dao.CommMyBatisDAO;
import kr.entity.Board;
import kr.entity.Comment;


public class BoardViewController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BoardMyBatisDAO dao = new BoardMyBatisDAO();
		CommMyBatisDAO dao1 = new CommMyBatisDAO();
		int num = Integer.parseInt(request.getParameter("num")); // 게시판 번호
		Board vo = dao.boardView(num); 
		List<Comment> comment= dao1.commAllList(num); // 댓글데이터 가져오기
		dao.countUpdate(num);
		dao.commentCount(num);
		request.setAttribute("vo", vo); // 게시글 데이터
		request.setAttribute("comment", comment); //댓글데이터
		System.out.println(vo);
		
		return "boardView";
		
		
		
	}

}
