package kr.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.board.dao.BoardMyBatisDAO;
import kr.board.entity.Board;

public class BoardUpdateController implements Controller{

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BoardMyBatisDAO dao = new BoardMyBatisDAO();
		// 수정처리 -> 리스트로
		int num = Integer.parseInt(request.getParameter("num"));
		String content = request.getParameter("content");
		String title = request.getParameter("title");
		Board vo = new Board();
		vo.setTitle(title);
		vo.setContent(content);
		vo.setNum(num);
		dao.boardUpdate(vo);
		return "redirect:/boardList.do";
	}
	
}
