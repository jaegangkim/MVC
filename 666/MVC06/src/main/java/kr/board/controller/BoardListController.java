package kr.board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.board.dao.BoardDAO;
import kr.board.dao.BoardMyBatisDAO;
import kr.board.entity.Board;

/**
 * Servlet implementation class BoardListController
 */
// Servlet -> POJO (프론트컨트롤러가 해야할 일으 대신해주는 클래스)
public class BoardListController implements Controller{
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		BoardMyBatisDAO dao = new BoardMyBatisDAO();
		
//		BoardDAO dao = new BoardDAO();
		// 전체 리스트 가져오기 => dao와 연동
		
		List<Board> list = dao.allList();
		
//		// View에 forward
//		request.setAttribute("list", list);
//		return "boardList";
//					
		Gson gson=new Gson();
		String json=gson.toJson(list);
		response.setContentType("text/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(json);
		return null;
	}

}
