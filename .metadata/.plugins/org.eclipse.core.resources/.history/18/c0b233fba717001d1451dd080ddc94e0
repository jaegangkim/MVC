package kr.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/boardWriteForm.do")
public class BoardWriteFormController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// boardwrite.jsp(글쓰기폼) 만들기
		
		RequestDispatcher rd = request.getRequestDispatcher("board/boardWrite.jsp");
		rd.forward(request, response);
		
	}
}
