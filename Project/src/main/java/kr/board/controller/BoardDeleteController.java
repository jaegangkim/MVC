package kr.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.dao.BoardMyBatisDAO;
import kr.dao.CommMyBatisDAO;


public class BoardDeleteController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BoardMyBatisDAO dao = new BoardMyBatisDAO();
		CommMyBatisDAO dao1 = new CommMyBatisDAO();
		int num = Integer.parseInt(request.getParameter("num")); // 게시글 번호 가져오기
		dao1.commDelete(num);
		dao.boardDelete(num);
		return "redirect:/boardList.do";
	}

}
