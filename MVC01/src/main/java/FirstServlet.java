import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.util.MyUtil;
@WebServlet("/MVC01/fs.do")
// Servlet : 클라이언트의 요청을 받는 역할
public class FirstServlet extends HttpServlet {  
	protected void service(HttpServletRequest request, HttpServletResponse response)
									throws ServletException, IOException {
		
		//클라이언트 폼에서 넘어온 파라메터를 받는 작업
		int su1=Integer.parseInt(request.getParameter("su1"));
		int su2=Integer.parseInt(request.getParameter("su2"));
		// 1. 비즈니스로직(처리로직)
		// 1~10까지의 총합=?
		MyUtil my = new MyUtil();
		int sum = my.hap(su1,su2);
		// 2. 프리젠테이션 로직(화면구성로직)
		// 요청한 클라이언트에게 응답
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<body>");
		out.println(sum);
		out.println("</html>");
		out.println("</body>");
		
	}

}
