package kr.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.dao.BoardMyBatisDAO;
import kr.entity.Board;


public class BoardUpdateController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BoardMyBatisDAO dao = new BoardMyBatisDAO();
		request.setCharacterEncoding("utf-8");
		int num = Integer.parseInt(request.getParameter("num"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		Board vo = new Board();
		vo.setComm_seq(num);
		vo.setComm_title(title);
		vo.setComm_content(content);
		dao.boardUpdate(vo);
		System.out.println();
		return "redirect:/boardView.do?num="+num;
	}

}
