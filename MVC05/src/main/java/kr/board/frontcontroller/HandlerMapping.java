package kr.board.frontcontroller;

import java.util.HashMap;

import kr.board.controller.BoardDeleteController;
import kr.board.controller.BoardListController;
import kr.board.controller.BoardUpdateController;
import kr.board.controller.BoardUpdateFormController;
import kr.board.controller.BoardViewController;
import kr.board.controller.BoardWriteController;
import kr.board.controller.BoardWriteFormController;
import kr.board.controller.CalcController;
import kr.board.controller.Controller;
import kr.board.controller.IndexController;

public class HandlerMapping {
	private HashMap<String,Controller> mappings;
	public HandlerMapping() {
		mappings= new HashMap<String, Controller>();
		mappings.put("/boardList.do", new BoardListController());
		mappings.put("/boardWriteForm.do", new BoardWriteFormController());
		mappings.put("/boardWrite.do", new BoardWriteController());
		mappings.put("/boardView.do",  new BoardViewController());
		mappings.put("/boardDelete.do", new BoardDeleteController());
		mappings.put("/boardUpdateForm.do", new BoardUpdateFormController());
		mappings.put("/boardUpdate.do", new BoardUpdateController());
		mappings.put("/calc.do", new CalcController());
		mappings.put("/index.do", new IndexController());
		//추가
		//mappings.put("/login.do",new LoginController());
	}
	public Controller getController(String command) {
		return mappings.get(command);
	}
}
/*
if(command.equals("/boardList.do")) {
	controller = new BoardListController();
	nextPage = controller.requestProcessor(request, response);
}else if(command.equals("/boardWriteForm.do")) {
	controller = new BoardWriteFormController();
	nextPage = controller.requestProcessor(request, response);
}else if(command.equals("/boardWrite.do")) {
	controller = new BoardWriteController();
	nextPage = controller.requestProcessor(request, response);
}else if(command.equals("/boardView.do")) {
	controller = new BoardViewController();
	nextPage = controller.requestProcessor(request, response);
}else if(command.equals("/boardDelete.do")) {
	controller = new BoardDeleteController();
	nextPage = controller.requestProcessor(request, response);
}else if(command.equals("/boardUpdateForm.do")) {
	controller = new BoardUpdateFormController();
	nextPage = controller.requestProcessor(request, response);
}else if(command.equals("/boardUpdate.do")) {
	controller = new BoardUpdateController();
	nextPage = controller.requestProcessor(request, response);
}
// 3. View(JSP=forward) or 다른 컨트롤러로(redirect)로 경로를 변경하는 작업 
if(nextPage!=null) {
	if(nextPage.indexOf("redirect:")==-1) {
		//forward
		RequestDispatcher rd = request.getRequestDispatcher(ViewResolver.makeView(nextPage));
		rd.forward(request, response);
	}else {
		//redirect
		response.sendRedirect(cpath+nextPage.split(":")[1]);
	}
*/