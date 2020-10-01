package me.techienaman;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/forgot")
public class ForgotPass extends HttpServlet {
	
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
		
		
		String uname = req.getParameter("uname");
		
		PrintWriter out = res.getWriter();
		
		ForgotPassDb obj = new ForgotPassDb();
		
		if(obj.check(uname)) {
			
			Cookie cookie = new Cookie("uname", uname);
			res.addCookie(cookie);
			cookie.setMaxAge(7);
			res.sendRedirect("newpass.jsp");
			
		}else {
			   out.println("<script type=\"text/javascript\">");
			   out.println("alert('User does not exist.');");
			   out.println("location='forgot.jsp';");
			   out.println("</script>");
			
		}
		
		
	}
	
}
