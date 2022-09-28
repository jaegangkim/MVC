package kr.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.dao.BoardMyBatisDAO;

public class LikesCancelController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		BoardMyBatisDAO dao = new BoardMyBatisDAO();
		HttpSession session =request.getSession();
		int num = Integer.parseInt(request.getParameter("num"));
		dao.likesCancel(num);
		return null;
	}

}
