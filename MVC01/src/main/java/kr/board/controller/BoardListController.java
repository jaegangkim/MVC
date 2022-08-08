package kr.board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.board.dao.BoardDAO;
import kr.board.entity.Board;

@WebServlet("/boardList.do")
public class BoardListController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1. Model과 연동하기
		BoardDAO dao = new BoardDAO();
		List<Board> list = dao.allList();
		// 2. 리스트 페이지를 만들어서 응답하기(View)
		// 응답 시 한글 깨짐 방지 
		// 데이터 유형(MIME Type)을 미리 클라이언트에게 전달
		response.setContentType("text/html;charset=euc-kr");
		
		PrintWriter out = response.getWriter();		
		out.println("<html>");
		out.println("<body>");
		out.println("<table border='1'>");
		out.println("<tr>");
		out.println("<td>번호</td>");
		out.println("<td>제목</td>");
		out.println("<td>내용</td>");
		out.println("<td>작성자</td>");
		out.println("<td>작성일</td>");
		out.println("<td>조회수</td>");
		out.println("<td>삭제</td>");
		out.println("</tr>");
		for(Board vo:list) {
			out.println("<tr>");
			out.println("<td>"+vo.getNum()+"</td>");
			out.println("<td><a href='boardView.do?num="+vo.getNum()+"'>"+vo.getTitle()+"</a></td>");
			out.println("<td>"+vo.getContent()+"</td>");
			out.println("<td>"+vo.getWriter()+"</td>");
			out.println("<td>"+vo.getIndate()+"</td>");
			out.println("<td>"+vo.getCount()+"</td>");
			out.println("<td><a href='boardDelete.do?num="+vo.getNum()+"'>삭제</a></td>");
			out.println("</tr>");
		}
		// 글쓰기 
		out.println("<tr>");
		out.println("<td colspan='7'>");
		out.println("<a href='/MVC01/boardWrite.html'>글쓰기</a>");
		out.println("</td>");
		out.println("</tr>");
		
		out.println("</table>");
		out.println("</html>");
		out.println("</body>");
		
	}

}