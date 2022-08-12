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

import kr.board.dao.BoardMyBatisDAO;
import kr.board.entity.Board;
// Servlet -> POJO ( extends 삭제 )
public class BoardListController implements Controller{
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		BoardDAO dao=new BoardDAO();
		BoardMyBatisDAO dao=new BoardMyBatisDAO();
		List<Board> list = dao.allList();
		
		// json을 이용해서 list를 main의 data로 넘겨줌
		Gson gson =new Gson();
		String json=gson.toJson(list);
		response.setContentType("text/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(json);
		
		return null;
		
		
		
	}
}
