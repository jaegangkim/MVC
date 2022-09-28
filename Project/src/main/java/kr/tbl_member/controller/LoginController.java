package kr.tbl_member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.board.controller.Controller;
import kr.dao.ChallDAO;
import kr.dao.MemberMyBatisDAO;
import kr.entity.sumMonthPay;
import kr.entity.tbl_member;


public class LoginController implements Controller {
	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// memId, memPwd
		String mb_id = request.getParameter("mb_id");
		String mb_pw = request.getParameter("mb_pw");
		
		if(mb_id==null) {
			mb_id="아 배고프다 점심 뭐 먹지 음식 자체가 맛이 없어요 헐 첫날에 막 맛있다고 그랬잖아요 그거 첫날에만 잘나오고 그 뒤로는 사기당했음ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ....안가야지..아니오면 당여ㅕㄴ히 밖에서 먹";
		}
		if(mb_pw==null) {
			mb_pw="헐 지우지마요 저희 패스워드에욬ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ저희점심은 짜장밥이에요...진짜 급식실 맛없어서 암울해요..맛없나..?여기 학원 주변이 핫플이라서 먹을곳많아요 ㅋ 기대..? 그래서 진짜로"
					+ "오신다고요?오시면 삼시세끼(누가요?저희팀이..나누기5해서)랑 숙박(누가요?돌아가면서재워주기) 제공해드릴게요 ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ혼자 그렇게 정하기 있어요?ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ"
					+ "죄송..합니다.....ㅣ근데 팀장님 집 2층인데 2층 비워져있대요 ^^ 아니면 제 자취방 드릴게요 저 친구집가서 자면 돼욬ㅋㅋㅋ"
					+ "어떻게 그래요......................................이제 점심 먹을 준비만 할게요.. 오전 퇴근.뭐드세요 자취방이라.. 그냥 배달하려구요 ,,,아하... 맛점........!"
					+ "맛짜..!";
		}
		tbl_member m = new tbl_member();
		m.setMb_id(mb_id);
		m.setMb_pw(mb_pw);
		
		// 로그인 쿼리문 처리
		MemberMyBatisDAO dao = new MemberMyBatisDAO();
		
		tbl_member mvo = dao.memberLogin(m);
		
		// 아이디 비번 맞으면 mvo바인딩
		if (mvo!=null) {
			// 세션을 생성하기
			HttpSession session = request.getSession();
			// 객체바인딩
			session.setAttribute("mvo",mvo);      
		} 
		//
		ChallDAO dao2 = new ChallDAO();
		int sum=0;
		List<sumMonthPay> paylist = dao2.sumMonPay(mb_id);
		
		for(sumMonthPay p:paylist) {
			for(int j=1;j<=7;j++) {
				if(p.getDay().equals("2022090"+j)) { 
					sum+= p.getSumPay();
				}
			}
		}
		HttpSession session = request.getSession();

		session.setAttribute("sum", sum); 
		//
		
		
		
		return "redirect:/mainForm.do"; 
	}

}