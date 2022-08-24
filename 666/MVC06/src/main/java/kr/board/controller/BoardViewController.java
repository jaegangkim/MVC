package kr.board.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.board.dao.BoardDAO;
import kr.board.dao.BoardMyBatisDAO;
import kr.board.entity.Board;


public class BoardViewController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		BoardMyBatisDAO dao = new BoardMyBatisDAO();
		dao.countUpdate(num);
		Board vo = dao.boardView(num);
		//request.setAttribute("vo", vo);
		//String nextPage = "boardView";
		PrintWriter out =response.getWriter();
		out.println(vo.getCount());
		return null;
		}

}
