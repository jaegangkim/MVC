package kr.tbl_member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.board.controller.Controller;
import kr.dao.MemberMyBatisDAO;
import kr.entity.tbl_member;


public class MyPageEditController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 여기에 로그인된 memId를 가져와야됨...
		String mb_id = request.getParameter("mb_id");
		String mb_pw = request.getParameter("mb_pw");
		String mb_pw_confirm = request.getParameter("mb_pw_confirm");
		String mb_name = request.getParameter("mb_name");
		int challenge_total = Integer.parseInt(request.getParameter("challenge_total"));
		
		MemberMyBatisDAO dao = new MemberMyBatisDAO(); 
		
		tbl_member m = new tbl_member();
		if (mb_pw.equals(mb_pw_confirm)) {
			m.setMb_pw(mb_pw);
			m.setMb_name(mb_name);
			m.setMb_id(mb_id);
			m.setChallenge_total(challenge_total);
			
			dao.updateMyPage(m);
		
		}
		
	
		tbl_member mvo = dao.memberLogin(m);
		
		HttpSession session = request.getSession();
		session.setAttribute("mvo", mvo);
		return "redirect:/myPage.do"; // 수정하기 버튼 누르면 바뀐 상태로 다시 수정페이지
	}

}