package kr.login.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.login.dao.BoardMyBatisDAO;
import kr.login.entity.tbl_community;

public class MainFormController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BoardMyBatisDAO dao = new BoardMyBatisDAO();
		List<tbl_community> list = dao.topList();
		request.setAttribute("list", list);
		
		return "main";
	}

}
