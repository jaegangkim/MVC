package kr.board.frontcontroller;

public class ViewResolver {
	public static String makeView(String nextPage) {
		return "WEB-INF/board/"+nextPage+".jsp";
	}
}
