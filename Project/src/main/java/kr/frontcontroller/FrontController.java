package kr.frontcontroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.board.controller.Controller;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String reqPath = request.getRequestURI(); // 클라이언트가 입력한 url
		String cpath = request.getContextPath(); // project
		String command = reqPath.substring(cpath.length()); // boardList.do
		System.out.println("클라이언트 입력 url:"+ command);
		
		String nextPage = null;
		// 핸들러 매핑
		Controller controller = null;
		// command에 따른 분기 작업
		HandlerMapping mapping = new HandlerMapping();
		controller = mapping.getController(command); //boardList.do 전달다아
		nextPage = controller.requestProcessor(request, response); // NPE 에러발생
		if(nextPage!=null) { // nextpage값이 있다면
			if(nextPage.indexOf("redirect:") == -1) { // redirect:라는 것이 없으면 -1: 없다
				//forward
				RequestDispatcher rd = request.getRequestDispatcher(ViewResolver.makeView(nextPage));
				rd.forward(request, response);
				System.out.println(command+"포워딩");
			}
			else{
				// redirect
				response.sendRedirect(cpath + nextPage.split(":")[1]); // redirect:가 들어가기에 :를 구분으로 빼준다
				System.out.println("리다이렉트");
			}
		}else {
			System.out.println("nextpage값이 없습니다.");
		}
		
	}

}
