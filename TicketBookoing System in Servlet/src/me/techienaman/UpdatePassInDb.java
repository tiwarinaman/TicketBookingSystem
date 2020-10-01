package me.techienaman;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/updatepass")
public class UpdatePassInDb extends HttpServlet {
	
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
		
		
		PrintWriter out = res.getWriter();
		
		String newpass = req.getParameter("newpass");
		String uname = "";
		
		if(newpass.equals("")) {
			
			   out.println("<script type=\"text/javascript\">");
			   out.println("alert('Password field can not be blank');");
			   out.println("location='newpass.jsp';");
			   out.println("</script>");
						
			
		}else {
		
	    Cookie cookies[] = req.getCookies();
	    for(Cookie c : cookies) {
	    	
	    	if(c.getName().equals("uname")) {
	    		
	    		uname = c.getValue();
	    		
	    	}
	    	
	    }
		
		
		try {
			
			// Loading the MySql driver
		    Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/javaticketbooking";
			Connection con = DriverManager.getConnection(url,"root","root");
			
						
	        String sql = "update user_register set password = ? where username = ?";
	        
	        PreparedStatement stm = con.prepareStatement(sql);
	        stm.setString(1, newpass);
	        stm.setString(2, uname);
	        
	        stm.executeUpdate();
	        
	        
	        
	           out.println("<script type=\"text/javascript\">");
			   out.println("alert('Password has been changed.');");
			   out.println("location='login.jsp';");
			   out.println("</script>");
			   
			   
						
			
		}catch(Exception e) {
			
			e.getMessage();
		}
		
		
		}
	}
	

}
