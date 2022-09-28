package kr.savepoint.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.board.controller.Controller;
import kr.dao.SavePointMyBatisDAO;
import kr.entity.SavePoint;

public class SavePointListController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		SavePointMyBatisDAO dao = new SavePointMyBatisDAO();
		List<SavePoint> list = dao.savePointList();
		System.out.println(list);
		request.setAttribute("list", list);
		return "savePoint";
	}

}
