package kr.login.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.login.dao.LoginMyBatisDAO;
import kr.login.entity.Member;

public class LoginController implements Controller {
	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// memId, memPwd
		String memId = request.getParameter("memId");
		String memPwd = request.getParameter("memPwd");
		
		Member m = new Member(); 
		m.setMemId(memId);
		m.setMemPwd(memPwd);
		
		LoginMyBatisDAO dao = new LoginMyBatisDAO();
		Member mvo = dao.memberLogin(m);
		
		if (mvo!=null) {
			// 세션을 생성하기
			HttpSession session = request.getSession();
			// 객체바인딩
			session.setAttribute("mvo",mvo);      
			return "redirect:/mainForm.do"; 
		}
		return "redirect:/loginForm.do";
	}

}