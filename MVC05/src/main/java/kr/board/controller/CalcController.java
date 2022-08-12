package kr.board.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CalcController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// data : {su1,su2},
		int su1=Integer.parseInt(request.getParameter("su1"));
		int su2=Integer.parseInt(request.getParameter("su2"));
		int sum=su1+su2;
		// 여기서 $.ajax()로 응답 해야 함
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("서버에서 계산된 값: "+sum);
		return null;
	}

}
