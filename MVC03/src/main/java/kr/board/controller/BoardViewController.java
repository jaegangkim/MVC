package kr.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.board.dao.BoardDAO;
import kr.board.entity.Board;


@WebServlet("/boardView.do")
public class BoardViewController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int num = Integer.parseInt(request.getParameter("num"));
		BoardDAO dao = new BoardDAO();
		Board vo = dao.boardView(num);
		if(vo!=null) { // forward(boardView.jsp)
			dao.countUpdate(num);
			request.setAttribute("vo", vo);
			RequestDispatcher rd = request.getRequestDispatcher("board/boardView.jsp");
			rd.forward(request, response);
		}else {
			throw new ServletException("not select");
		}
		
	}
}
