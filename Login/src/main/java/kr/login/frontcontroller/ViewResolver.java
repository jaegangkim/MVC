package kr.login.frontcontroller;

public class ViewResolver {
	public static String makeView(String nextPage) {
		return "WEB-INF/login/" + nextPage + ".jsp";
	}
}
