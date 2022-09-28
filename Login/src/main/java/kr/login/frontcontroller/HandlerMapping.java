package kr.login.frontcontroller;

import java.util.HashMap;

import kr.login.controller.TotalBoardController;
import kr.login.controller.TotalBoardFormController;
import kr.login.controller.BoardViewController;
import kr.login.controller.ChallengeController;
import kr.login.controller.ChallengeFormController;
import kr.login.controller.Controller;
import kr.login.controller.MyPageEditController;
import kr.login.controller.IndexController;
import kr.login.controller.LoginController;
import kr.login.controller.LogoutController;
import kr.login.controller.MainFormController;
import kr.login.controller.MemberDeleteController;
import kr.login.controller.MyPageController;
import kr.login.controller.LoginformController;
import kr.login.controller.SignUpController;
import kr.login.controller.SignUpFormController;

public class HandlerMapping {
	private HashMap<String, Controller> mappings;
		public HandlerMapping() {
			mappings = new HashMap<String, Controller>();
			mappings.put("/index.do", new IndexController());
			mappings.put("/login.do", new LoginController());
			mappings.put("/logout.do", new LogoutController());
			mappings.put("/signupForm.do", new SignUpFormController());
			mappings.put("/signup.do", new SignUpController());
			mappings.put("/loginForm.do", new LoginformController());
			mappings.put("/mainForm.do", new MainFormController());
			mappings.put("/totalboardForm.do", new TotalBoardFormController());
			mappings.put("/totalboard.do", new TotalBoardController());
			mappings.put("/myPageEdit.do", new MyPageEditController());
			mappings.put("/myPage.do", new MyPageController());
			mappings.put("/memberDelete.do", new MemberDeleteController());
			mappings.put("/boardView.do", new BoardViewController());
			mappings.put("/challenge.do", new ChallengeController());
			mappings.put("/challengeForm.do", new ChallengeFormController());
		} 
		public Controller getController(String command) {
			// command -> key
			// 일치하는 것을 찾아줌
			return mappings.get(command);
		}
		
}