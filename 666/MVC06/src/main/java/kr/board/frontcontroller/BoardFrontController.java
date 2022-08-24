package kr.board.frontcontroller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.board.controller.BoardDeleteController;
import kr.board.controller.BoardListController;
import kr.board.controller.BoardViewController;
import kr.board.controller.BoardWriteController;
import kr.board.controller.BoardWriteFormController;
import kr.board.controller.Controller;
import kr.board.dao.BoardDAO;
import kr.board.entity.Board;

@WebServlet("*.do")
public class BoardFrontController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		// FrontController - 1개(DispatcherServlet)
		// 1. 어떤 요청인지 파악하기 (command 구하기)
		String reqPath = request.getRequestURI();
		String cpath = request.getContextPath();
		String command = reqPath.substring(cpath.length());
		System.out.println(command);
		// 2. command에 따른 분기작업(if~else if~)
		String nextPage = null;
		
		// HendlerMapping(핸들러맵핑)
		Controller controller = null;
		HandlerMapping mapping = new HandlerMapping();
		controller = mapping.getController(command);
		nextPage = controller.requestProcessor(request, response);
		// 3. View(JSP) or 다른 컨트롤러로 경로를 변경하는 작업
		if (nextPage!=null) {
			if(nextPage.indexOf("redirect:")==-1) { // redirect라는 글자가 없다면?
				// forward
				RequestDispatcher rd = request.getRequestDispatcher(ViewResolver.makeView(nextPage));
				rd.forward(request, response);
			}else{
				// redirect
				response.sendRedirect(cpath+nextPage.split(":")[1]);

				
	}}}
}
