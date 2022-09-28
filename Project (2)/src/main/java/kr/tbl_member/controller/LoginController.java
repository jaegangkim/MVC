package kr.tbl_member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import kr.board.controller.Controller;
import kr.dao.MemberMyBatisDAO;
import kr.entity.tbl_member;


public class LoginController implements Controller {
	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// memId, memPwd
		String mb_id = request.getParameter("mb_id");
		String mb_pw = request.getParameter("mb_pw");
		
		
		// id, pw VO에 넣어둠
		tbl_member m = new tbl_member(); 
		m.setMb_id(mb_id);
		m.setMb_pw(mb_pw);
		
		
		// 로그인 쿼리문 처리
		MemberMyBatisDAO dao = new MemberMyBatisDAO();
		tbl_member mvo = dao.memberLogin(m);       
		
		// 로그인 하고 있다는 사실을 jsp에 알려준다
		if (mvo!=null) {
			// 세션을 생성하기
			HttpSession session = request.getSession(); // 세션을 생성(만약 세션이 있다면 기존의 session반환)
			// 객체바인딩
			session.setAttribute("mvo",mvo); // 선택한 멤버 데이터를 가져온다
		}
		return "redirect:/mainForm.do";
	}

}