package kr.login.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.login.dao.LoginMyBatisDAO;
import kr.login.entity.Member;

public class SignUpController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String memId = request.getParameter("memId");
		String memName = request.getParameter("memName");
		String memPwd = request.getParameter("memPwd");
		Member m = new Member();
		m.setMemId(memId);
		m.setMemName(memName);
		m.setMemPwd(memPwd);
		LoginMyBatisDAO dao = new LoginMyBatisDAO();
		dao.memberSignUp(m);
		
		HttpSession session = request.getSession();
		return "redirect:/loginForm.do"; 
	}

}
