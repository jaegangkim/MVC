package kr.login.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.login.dao.LoginMyBatisDAO;
import kr.login.entity.Member;

public class MyPageEditController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 여기에 로그인된 memId를 가져와야됨...
		String memId = request.getParameter("memId"); //??? 로그인 되어있는 회원의 memId를 가져와야되는데 어떻게?
		String memPwd = request.getParameter("memPwd");
		String memPwd_confirm = request.getParameter("memPwd_confirm");
		String memName = request.getParameter("memName");

		Member m = new Member();
		if (memPwd.equals(memPwd_confirm)) {
			m.setMemPwd(memPwd);
			m.setMemName(memName);
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("memId",memId);   //
			
		return "redirect:/myPage.do"; // 수정하기 버튼 누르면 바뀐 상태로 다시 수정페이지
	}

}

//String memId = request.getParameter("memId");
//String memPwd = request.getParameter("memPwd");                    이거랑 main 82번째줄 주석 지우면 '부적합한 열 유형: 1111' 나옴 
//														           내일 이어서 해결해보기..저기용 네.... 검색 하려다가 먼가 될거 같아서 해봤는데 안돼요 ㅠㅠㅠ
//Member m = new Member(); 
//m.setMemId(memId);
//
//LoginMyBatisDAO dao = new LoginMyBatisDAO();
//Member mvo = dao.memberLogin(m);
//