package me.techienaman;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/bookTicket")
public class BookTicket extends HttpServlet{
	
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
		
		PrintWriter out = res.getWriter();
		out.print("Ticket has been booked");
		
	}

}
