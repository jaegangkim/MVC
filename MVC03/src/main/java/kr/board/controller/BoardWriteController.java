package kr.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.board.dao.BoardDAO;
import kr.board.entity.Board;

@WebServlet("/boardWrite.do")
public class BoardWriteController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 파라메터 수집
		String cpath=request.getContextPath();
		request.setCharacterEncoding("utf-8");
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String writer = request.getParameter("writer");
		Board vo = new Board();
		vo.setTitle(title);
		vo.setContent(content);
		vo.setWriter(writer);
		
		BoardDAO dao = new BoardDAO();
		int cnt = dao.boardWrite(vo);
		if(cnt>0) {
			response.sendRedirect(cpath+"/boardList.do");
		}else {
			throw new ServletException("not insert");
		}
		
	}
}
