package kr.board.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.SendResult;

public class CalcController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int n1 = Integer.parseInt(request.getParameter("n1"));
		int n2 = Integer.parseInt(request.getParameter("n2"));
		int sum = n1+n2;
		// 여기서 응답을 해야한다.
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out =response.getWriter();
		out.println(sum);
		// 여기서 응답하는 것은 데이터(=Json)만 응답하는 것 (html코드 응답X)
		// 데이터를 받아서 디자인을 하는 것은 boardList.jsp에서
		return null;
	}

}
