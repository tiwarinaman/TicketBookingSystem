package me.techienaman;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LogIn extends HttpServlet{
	
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
		
		// Client input
		String uname = req.getParameter("uname");
		String pass = req.getParameter("pass");
		
		PrintWriter out = res.getWriter();
		
		LogInDb obj = new LogInDb();
		
		if(obj.validate(uname, pass)) {
			
            HttpSession session = req.getSession();
            session.setAttribute("uname", uname);
            res.sendRedirect("welcome.jsp");
			
			
		}else {
			
			   out.println("<script type=\"text/javascript\">");
			   out.println("alert('User or password incorrect');");
			   out.println("location='login.jsp';");
			   out.println("</script>");
		}
		
	}

}
