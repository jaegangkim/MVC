package kr.login.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.login.dao.LoginMyBatisDAO;

public class MemberDeleteController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		LoginMyBatisDAO dao = new LoginMyBatisDAO();
		String memId = request.getParameter("memId");
		dao.memberDelete(memId);
		HttpSession session =request.getSession();
		session.invalidate();
		return "main";
	}

}
