package kr.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.board.dao.BoardDAO;


@WebServlet("/boardDelete.do")
public class BoardDeleteController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cpath=request.getContextPath();
		int num=Integer.parseInt(request.getParameter("num"));
		BoardDAO dao = new BoardDAO();
		int cnt = dao.boardDelete(num);
		
		if(cnt>0) {
			response.sendRedirect(cpath+"/boardList.do");
		}else {
			throw new ServletException("not delete");
		}
		
	}
}
