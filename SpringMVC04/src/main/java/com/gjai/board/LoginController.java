package com.gjai.board;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gjai.entity.Member;
import com.gjai.service.BoardService;

@Controller
public class LoginController {

	@Autowired
	BoardService boardService;
	@RequestMapping("/login.do")
	public String loginCheck(Member vo, HttpSession session) {
		Member mvo = boardService.loginCheck(vo);
		if(mvo != null) {
			session.setAttribute("mvo", mvo);
		}
		return "redirect:/boardList.do";
	}
	@RequestMapping("/logout.do")
	public String logOut(HttpSession session) {
		session.invalidate();
		return "redirect:/boardList.do";
	}
}
