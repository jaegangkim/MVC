package kr.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.board.dao.tbl_memberMyBatisDAO;



public class BoardDeleteController implements Controller{

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		tbl_memberMyBatisDAO dao = new tbl_memberMyBatisDAO();
		//삭제처리 -> 리스트로
		int num = Integer.parseInt(request.getParameter("num"));
		dao.boardDelete(num);
		return "redirect:/boardList.do";
	}
	
}
