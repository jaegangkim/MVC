package kr.login.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.login.dao.MemberMyBatisDAO;

public class MemberDeleteController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		MemberMyBatisDAO dao = new MemberMyBatisDAO();
		String mb_id = request.getParameter("mb_id");
		System.out.println(mb_id+" 1");
		dao.memberDelete(mb_id);
		System.out.println(mb_id+" 2");
		HttpSession session =request.getSession();
		 session.invalidate(); 
		return "redirect:/mainForm.do";
	}

}
