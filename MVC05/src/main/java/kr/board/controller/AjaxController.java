// AI기반 서비스 트랙 spring특화 A 김재강
package kr.board.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AjaxController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int su= Integer.parseInt(request.getParameter("su"));
		int sum=0;
		while(su!=0) {
			sum+=su%10;
			su/=10;
		}
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("결과"+sum);
		return null;
	}

}
