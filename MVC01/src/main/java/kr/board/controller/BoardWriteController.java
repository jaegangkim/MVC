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
		// 요청데이터에 한글
		request.setCharacterEncoding("utf-8");
		// 1. title, content, writer 받기
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String writer = request.getParameter("writer");
		Board vo = new Board();
		vo.setTitle(title);
		vo.setContent(content);
		vo.setWriter(writer);
		// 2. Model과 연동(insert)
		BoardDAO dao = new BoardDAO();
		int cnt = dao.boardWrite(vo);
		if(cnt>0) {
			// 글쓰기가 성공 후에는 -> 다시 리스트페이지로 경로 변경
			response.sendRedirect("/MVC01/boardList.do");
		}else {
			// 실패 -> 예외 발생 , throw : 강제로 예외 발생 시킴
			throw new ServletException("not insert~");
		}
		
		
	}
}
