package kr.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.board.dao.BoardMyBatisDAO;
import kr.board.entity.Member;

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
		
		BoardMyBatisDAO dao = new BoardMyBatisDAO();
		Member mvo = dao.memberLogin(m);
		// mvo == null : 실패, mvo != null : 성공
		// 회원인증에 성공하면 세션을 만들어야 한다.
		// -----------------------------
		if (mvo!=null) {
			// 세션을 생성하기
			HttpSession session = request.getSession();
			// 객체바인딩
			session.setAttribute("mvo",mvo);
			
		}
		
		return "redirect:/index.do";
	}

}
