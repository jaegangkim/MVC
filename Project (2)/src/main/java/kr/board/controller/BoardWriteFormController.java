package kr.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardWriteFormController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		int comm_seq = Integer.parseInt(request.getParameter("num"));
		System.out.println(comm_seq);
		request.setAttribute("comm_seq", comm_seq);
		return "boardWrite";
	}

}
