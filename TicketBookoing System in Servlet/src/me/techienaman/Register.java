package me.techienaman;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class Register extends HttpServlet {
	
   
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
		
		 String name = req.getParameter("name");
		 String uname = req.getParameter("uname");
		 int age = Integer.parseInt(req.getParameter("age"));
		 String email = req.getParameter("email");
		 String pass = req.getParameter("password");
		 
		 PrintWriter out = res.getWriter();
		 
		 if(age < 14) {
			 
			   out.println("<script type=\"text/javascript\">");
			   out.println("alert('You are under age.');");
			   out.println("location='register.jsp';");
			   out.println("</script>"); 
		 }else {
		 
			 RegisterDb obj = new RegisterDb();
			 
			 if(obj.store(name, uname, age, email, pass)) {
				 
				   out.println("<script type=\"text/javascript\">");
				   out.println("alert('Registration successful !!!');");
				   out.println("location='login.jsp';");
				   out.println("</script>");
				 
			 }else {
				 
				   out.println("<script type=\"text/javascript\">");
				   out.println("alert('User name already exist');");
				   out.println("location='register.jsp';");
				   out.println("</script>");
				 
			}
		}
	
		 
		
	}

}
