package kr.frontcontroller;

public class ViewResolver {
	public static String makeView(String nextPage){
		return "WEB-INF/main/"+nextPage+".jsp";
	}
}
