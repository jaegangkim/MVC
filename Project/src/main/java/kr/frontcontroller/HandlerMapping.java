package kr.frontcontroller;
import java.util.HashMap;

import kr.board.controller.BoardDeleteController;
import kr.board.controller.BoardListController;
import kr.board.controller.BoardUpdateController;
import kr.board.controller.BoardUpdateFormController;
import kr.board.controller.BoardViewController;
import kr.board.controller.BoardWriteController;
import kr.board.controller.BoardWriteFormController;
import kr.board.controller.Controller;
import kr.board.controller.LikesCancelController;
import kr.board.controller.LikesController;
import kr.comment.controller.CommWriteController;
import kr.level.controller.LevelListController;
import kr.level.controller.LevelDeleteController;
import kr.level.controller.LevelUpdateController;
import kr.level.controller.LevelUpdateFormController;
import kr.level.controller.LevelViewController;
import kr.level.controller.LevelWriteController;
import kr.level.controller.LevelWriteFormController;
import kr.level_comm.LevelCommentController;
import kr.main.controller.MainFormController;
import kr.savepoint.controller.SavePointListController;
import kr.savepoint.controller.SavePointViewController;
import kr.tbl_member.controller.LoginController;
import kr.tbl_member.controller.LogoutController;
import kr.tbl_member.controller.MemberDeleteController;
import kr.tbl_member.controller.MyPageController;
import kr.tbl_member.controller.MyPageEditController;
import kr.tbl_member.controller.SignUpController;
import kr.tbl_member.controller.SignUpFormController;
import kr.tbl_member_challenge.controller.ChallengeController;
import kr.tbl_member_challenge.controller.ChallengeFormController;

public class HandlerMapping {
	private HashMap<String, Controller> mappings;
	public HandlerMapping() {
		mappings = new HashMap<String, Controller>();
		mappings.put("/boardList.do", new BoardListController());
		mappings.put("/boardWriteForm.do", new BoardWriteFormController());
		mappings.put("/boardWrite.do", new BoardWriteController());
		mappings.put("/boardView.do", new BoardViewController());
		mappings.put("/boardUpdateForm.do", new BoardUpdateFormController());
		mappings.put("/boardUpdate.do", new BoardUpdateController());
		mappings.put("/boardDelete.do", new BoardDeleteController());
		mappings.put("/commWrite.do", new CommWriteController());
		mappings.put("/savePointList.do", new SavePointListController());
		mappings.put("/savePointView.do", new SavePointViewController());
		mappings.put("/login.do", new LoginController());
		mappings.put("/logout.do", new LogoutController());
		mappings.put("/signupForm.do", new SignUpFormController());
		mappings.put("/signup.do", new SignUpController());
		mappings.put("/mainForm.do", new MainFormController());
		mappings.put("/myPageEdit.do", new MyPageEditController());
		mappings.put("/myPage.do", new MyPageController());
		mappings.put("/memberDelete.do", new MemberDeleteController());
		mappings.put("/boardView.do", new BoardViewController());
		mappings.put("/challenge.do", new ChallengeController());
		mappings.put("/challengeForm.do", new ChallengeFormController());
		mappings.put("/levelList.do", new LevelListController());
		mappings.put("/levelWriteForm.do", new LevelWriteFormController());
		mappings.put("/levelWrite.do", new LevelWriteController());
		mappings.put("/levelView.do", new LevelViewController());
		mappings.put("/levelUpdateForm.do", new LevelUpdateFormController());
		mappings.put("/levelUpdate.do", new LevelUpdateController());
		mappings.put("/levelDelete.do", new LevelDeleteController());
		mappings.put("/levelComment.do", new LevelCommentController());
		mappings.put("/likes.do", new LikesController());
		mappings.put("/likesCancel.do", new LikesCancelController());
	}
	public Controller getController(String command) {
		// TODO Auto-generated method stub
		return mappings.get(command);
	}
}
