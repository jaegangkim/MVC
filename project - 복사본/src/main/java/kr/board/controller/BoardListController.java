package kr.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.board.dao.tbl_memberMyBatisDAO;
import kr.board.entity.Board;
// Servlet -> POJO ( extends 삭제 )
public class BoardListController implements Controller{
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		BoardDAO dao=new BoardDAO();
		tbl_memberMyBatisDAO dao=new tbl_memberMyBatisDAO();
		List<Board> list = dao.allList();
		// View에 forward
		request.setAttribute("list", list);
		return "boardList";
		
		
		
	}
}
