package kr.board.frontcontroller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.board.dao.BoardDAO;
import kr.board.entity.Board;

@WebServlet("*.do")
public class BoardFrontController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		// FrontController - 1개(DispatcherServlet)
		// 1. 어떤 요청인지 파악하기(command 구하기)
		String reqPath = request.getRequestURI();
		String cpath = request.getContextPath();
		String command= reqPath.substring(cpath.length());
		System.out.println(command);
		
		// 2. command에 따른 분기작업(if~else if~)
		String nextPage=null;
		BoardDAO dao = new BoardDAO();
		if(command.equals("/boardList.do")) {
			// 리스트 화면으로
			List<Board> list = dao.allList();
			// View에 forward
			request.setAttribute("list", list);
			nextPage="WEB-INF/board/boardList.jsp";
		}else if(command.equals("/boardWriteForm.do")) {
			// 글쓰기화면으로
			nextPage="WEB-INF/board/boardWrite.jsp";
		}else if(command.equals("/boardWrite.do")) {
			// 글쓰기 처리
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String writer = request.getParameter("writer");
			Board vo = new Board();
			vo.setTitle(title);
			vo.setContent(content);
			vo.setWriter(writer);
			dao.boardWrite(vo);
			nextPage="redirect:/boardList.do";
		}else if(command.equals("/boardView.do")) {
			// 상세보기 처리 -> JSP
			int num = Integer.parseInt(request.getParameter("num"));
			Board vo = dao.boardView(num);
			request.setAttribute("vo", vo);
			nextPage="WEB-INF/board/boardView.jsp";
		}else if(command.equals("/boardDelete.do")) {
			//삭제처리 -> 리스트로
			int num = Integer.parseInt(request.getParameter("num"));
			dao.boardDelete(num);
			nextPage="redirect:/boardList.do";
		}else if(command.equals("/boardUpdateForm.do")) {
			// 수정데이터 -> 수정화면(JSP)
			int num = Integer.parseInt(request.getParameter("num"));
			Board vo = dao.boardView(num);
			request.setAttribute("vo", vo);
			nextPage="WEB-INF/board/boardUpdate.jsp";
		}else if(command.equals("/boardUpdate.do")) {
			// 수정처리 -> 리스트로
			int num = Integer.parseInt(request.getParameter("num"));
			String content = request.getParameter("content");
			String title = request.getParameter("title");
			Board vo = new Board();
			vo.setTitle(title);
			vo.setContent(content);
			vo.setNum(num);
			dao.boardUpdate(vo);
			nextPage="redirect:/boardList.do";
		}
		// 3. View(JSP=forward) or 다른 컨트롤러로(redirect)로 경로를 변경하는 작업 
		if(nextPage!=null) {
			if(nextPage.indexOf("redirect:")==-1) {
				//forward
				RequestDispatcher rd = request.getRequestDispatcher(nextPage);
				rd.forward(request, response);
			}else {
				//redirect
				response.sendRedirect(cpath+nextPage.split(":")[1]);
			}
		}
		
	}
}