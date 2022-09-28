package kr.tbl_member_challenge.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.board.controller.Controller;
import kr.dao.ChallDAO;
import kr.entity.sumMonthPay;
import kr.entity.tbl_member;
import kr.entity.tbl_member_challenge;

public class ChallengeFormController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// d-day
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Calendar c1 = Calendar.getInstance();
		int strToday = 20220921-Integer.parseInt(sdf.format(c1.getTime())); 
		request.setAttribute("dday",strToday);
		HttpSession session = request.getSession();
		
		tbl_member mvo = (tbl_member)session.getAttribute("mvo");
		String mb_id = mvo.getMb_id();
		
		ChallDAO dao = new ChallDAO();
		int sum=0;
		// 일일 소비금액 리스트
		List<sumMonthPay> paylist = dao.sumMonPay(mb_id);
		System.out.println();
		int[] sumPay = new int[7];
		for(sumMonthPay p:paylist) {
			for(int j=1;j<=7;j++) {
				if(p.getDay().equals("2022090"+j)) { 
					sumPay[j-1] = p.getSumPay();
					sum+= p.getSumPay();
				}
			}
			/*
			 * for(int j=10;j<=21;j++) { if(p.getDay().equals("202209"+j)) { sumPay[j-1] =
			 * p.getSumPay(); sum+=p.getSumPay(); } }
			 */
		}request.setAttribute("sum", sum);
		request.setAttribute("sumPay", sumPay);
		///////////////////////////////////
		
		// 항목 별 소비금액 리스트
		List<sumMonthPay> itemlist = dao.sumItemPay(mb_id);
		int[] sumItem = {0,0,0,0,0};
		for(sumMonthPay p:itemlist) {
			for(int j=1;j<=9;j++) {
				if(p.getDay().equals("2022090"+j)) { 
					for(int i=1;i<=5;i++) {
						if(p.getItem()==i) {
							sumItem[i-1]+=p.getSumPay();
						}
					}
				}
			}
			for(int j=10;j<=21;j++) {
				if(p.getDay().equals("202209"+j)) {
					for(int i=1;i<=5;i++) {  
						if(p.getItem()==i) {
							sumItem[i-1]+=p.getSumPay();
						}
					}
				}
			}
		}
		request.setAttribute("sumItemPay",sumItem);  
		
		//일년 소비금액 리스트
		int[] yearPay = new int[5];
		for(sumMonthPay p:itemlist) {
			for(int j=1;j<=9;j++) {
				if(p.getDay().contains("20220"+j)){ 
					for(int i=1;i<=5;i++) {  
						if(p.getItem()==i) {
							yearPay[i-1] += p.getSumPay();
						}
					}
					
				}
			}
		}
		
		request.setAttribute("yearPay",yearPay);  
		
		
		return "mychall";
	
	}
}
