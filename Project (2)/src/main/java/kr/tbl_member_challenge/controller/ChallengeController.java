package kr.tbl_member_challenge.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.board.controller.Controller;

public class ChallengeController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String mb_id = request.getParameter("mb_id");
		String pay_money = request.getParameter("pay_money");
		String[] items =  request.getParameterValues("choice");
		String comm_item_seq = null;
		for(int i=0;i<items.length;i++) {
			comm_item_seq =items[i];
		} 
		System.out.println(mb_id+" "+pay_money+" "+comm_item_seq);
		
		return "redirect:/challengeForm.do";
	}

}
