package kr.login.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import kr.login.dao.LoginMyBatisDAO;
import kr.login.entity.Member;

public class MyPageController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		String memId = request.getParameter("memId");
//		
//		Member m = new Member(); 
//		m.setMemId(memId);
//		
//		
//		LoginMyBatisDAO dao = new LoginMyBatisDAO();
//		Member mvo = dao.memberLogin(m);                 
//		
//		HttpSession session = request.getSession();
//		session.setAttribute("mvo",mvo);
		
		return "mypage";
	}

}
