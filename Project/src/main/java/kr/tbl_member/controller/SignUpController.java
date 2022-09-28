package kr.tbl_member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.board.controller.Controller;
import kr.dao.MemberMyBatisDAO;
import kr.entity.tbl_member;


public class SignUpController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String mb_id = request.getParameter("mb_id");
		String mb_name = request.getParameter("mb_name");
		String mb_pw = request.getParameter("mb_pw");
		tbl_member m = new tbl_member();
		m.setMb_id(mb_id);
		m.setMb_name(mb_name);
		m.setMb_pw(mb_pw);
		MemberMyBatisDAO dao = new MemberMyBatisDAO();
		dao.memberSignUp(m);
		
		HttpSession session = request.getSession();
		return "redirect:/loginForm.do"; 
	}

}
