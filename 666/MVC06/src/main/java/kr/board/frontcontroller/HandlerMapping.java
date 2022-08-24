package kr.board.frontcontroller;

import java.util.HashMap;

import kr.board.controller.BoardDeleteController;
import kr.board.controller.BoardListController;
import kr.board.controller.BoardViewController;
import kr.board.controller.BoardWriteController;
import kr.board.controller.BoardWriteFormController;
import kr.board.controller.CalcController;
import kr.board.controller.Controller;
import kr.board.controller.IndexController;
import kr.board.controller.LoginController;
import kr.board.controller.LogoutController;

public class HandlerMapping {
	private HashMap<String, Controller> mappings;
		public HandlerMapping() {
			mappings = new HashMap<String, Controller>();
			mappings.put("/boardList.do", new BoardListController());
			mappings.put("/boardWriteForm.do", new BoardWriteFormController());
			mappings.put("/boardWrite.do", new BoardWriteController());
			mappings.put("/boardView.do", new BoardViewController());
			mappings.put("/boardDelete.do", new BoardDeleteController());
			mappings.put("/calc.do", new CalcController());
			mappings.put("/index.do", new IndexController());
			mappings.put("/login.do", new LoginController());
			mappings.put("/logout.do", new LogoutController());

			
		}
		public Controller getController(String command) {
			// command -> key
			// 일치하는 것을 찾아줌
			return mappings.get(command);
		}
	
//	if (command.equals("/boardList.do")) {
//		controller = new BoardListController();
//		nextPage = controller.requestProcessor(request, response);
//	}else if (command.equals("/boardWriteForm.do")) {
//		// 글쓰기 화면으로 이동(jsp)
//		controller = new BoardWriteFormController();
//		nextPage = controller.requestProcessor(request,response);
//	}else if (command.equals("/boardWrite.do")) {
//		// 글쓰기 처리
//		controller = new BoardWriteController();
//		nextPage = controller.requestProcessor(request,response);
//	}else if(command.equals("/boardView.do")) {
//		// 상세보기처리 -> JSP num 값을 받아야함
//		controller = new BoardViewController();
//		nextPage = controller.requestProcessor(request,response);
//	}else if (command.equals("/boardDelete.do")) {
//		controller = new BoardDeleteController();
//		nextPage = controller.requestProcessor(request,response);
//	}else if (command.equals("/boardUpdateForm.do")) {
//		// 수정 데이터를 가져오기 -> 수정화면 (JSP)
//		controller = new BoardUpdateFormController();
//		nextPage = controller.requestProcessor(request,response);
//	}else if (command.equals("/boardUpdate.do")) {
//		// 수정처리 > 리스트
//		controller = new BoardUpdateController();
//		nextPage = controller.requestProcessor(request,response);
//	}
	
}
