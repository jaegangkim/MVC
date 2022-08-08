package kr.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.board.dao.BoardDAO;
import kr.board.entity.Board;

@WebServlet("/boardUpdate.do")
public class BoardUpdateController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		int num = Integer.parseInt(request.getParameter("num"));
		String content = request.getParameter("content");
		String title = request.getParameter("title");
		Board vo = new Board();
		vo.setTitle(title);
		vo.setContent(content);
		vo.setNum(num);
		
		BoardDAO dao= new BoardDAO();
		int cnt = dao.boardUpdate(vo);
		if(cnt>0) {
			response.sendRedirect("/MVC02/boardList.do");
		}else {
			throw new ServletException("not update");
		}
		
	}
}
