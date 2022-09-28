package kr.tbl_member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.board.controller.Controller;

public class LogoutController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 세션 무효화 (로그아웃처리)
		HttpSession session =request.getSession();
		session.invalidate();
		return "redirect:/mainForm.do";
	}

}
