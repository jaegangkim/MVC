package kr.savepoint.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.board.controller.Controller;
import kr.dao.SavePointMyBatisDAO;
import kr.entity.SavePoint;

public class SavePointViewController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		SavePointMyBatisDAO dao = new SavePointMyBatisDAO();
		int num = Integer.parseInt(request.getParameter("num"));
		System.out.println(num);
		SavePoint vo = dao.savePointView(num);
		request.setAttribute("vo", vo);
		return "savePointView";
	}

}
