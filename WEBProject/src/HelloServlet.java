import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
// JavaSE -> JavaEE (Servlet = Server+let)
// 1. 웹에서 실행 가능한 클래스로 만들기
// 2. JavaEE용 API ( servlet-api.jar )
@WebServlet("/hs.do")
public class HelloServlet extends HttpServlet{
	// service -> main method
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) 
									throws ServletException, IOException {
		//브라우저에 Hello Servlet 출력하기
		PrintWriter out = res.getWriter();
		out.println("<html>");
		out.println("<body>");
		out.println("<table border='1'>");
		out.println("<tr>");
		out.println("<td>");
		out.println("Hello Servlet");
		out.println("</td>");
		out.println("</tr>");
		out.println("</table>");
		out.println("</html>");
		out.println("</body>");
		
	}
	

}
