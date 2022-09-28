
package kr.tbl_member_challenge.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.board.controller.Controller;
import kr.dao.ChallDAO;
import kr.entity.sumMonthPay;
import kr.entity.tbl_member_challenge;

public class ChallengeController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String aaa = request.getParameter("aaa"); 
		String mb_id = request.getParameter("mb_id");
		//request.setAttribute("mb_id", mb_id); 
		String pay_money1 = request.getParameter("pay_money");
		
		if(pay_money1.equals("")) {
			return "redirect:/challengeForm.do";
		}
		int pay_money = Integer.parseInt(pay_money1);
		 int comm_item_seq = Integer.parseInt(request.getParameter("priority"));
//		  String[] items = request.getParameterValues("priority");
//		  System.out.println(items[0]);
//		  int comm_item_seq = 0; 
//		  for(int i=0;i<items.length;i++) {
//			  comm_item_seq=Integer.parseInt(items[i]); 
//		  }
		  
		  System.out.println(comm_item_seq);
		  
		  tbl_member_challenge c = new tbl_member_challenge();
		  c.setMb_id(mb_id);
		  c.setPay_money(pay_money); c.setChal_item_seq(comm_item_seq);
		  
		  ChallDAO dao = new ChallDAO();
		  dao.insertChall(c);
		  
		if(aaa.equals("aaa")) {
			
			return "redirect:/challengeForm.do";
		}
		
		return "redirect:/mainForm.do"; 
	}

}
