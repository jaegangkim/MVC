package kr.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.dao.BoardMyBatisDAO;
import kr.dao.MemberMyBatisDAO;
import kr.entity.Board;
import kr.entity.tbl_member;


public class BoardWriteController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 글쓰기 처리
		HttpSession mvo = request.getSession();
		BoardMyBatisDAO dao = new BoardMyBatisDAO();
		request.setCharacterEncoding("utf-8");
		//int comm_seq = Integer.parseInt(request.getParameter("comm_seq"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String id = mvo.getId();
		Board vo = new Board();
		
		vo.setMb_id(id);
		vo.setComm_title(title);
		vo.setComm_content(content);
		dao.boardWrite(vo);
		System.out.println("view포워딩");
		return "boardList";
	}

}
