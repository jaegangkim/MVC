package kr.login.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.login.dao.MemberMyBatisDAO;
import kr.login.entity.tbl_member;

public class IndexController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		return "redirect:/mainForm.do";
	}
}
