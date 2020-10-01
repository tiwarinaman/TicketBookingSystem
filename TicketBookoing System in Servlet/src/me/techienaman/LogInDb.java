package me.techienaman;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LogInDb {
	
	
	public boolean validate(String uname, String pass) {
		
		
		 try {
			 
			   // Loading the MySql driver
			   Class.forName("com.mysql.cj.jdbc.Driver");
			   String url = "jdbc:mysql://localhost:3306/javaticketbooking";
			   Connection con = DriverManager.getConnection(url,"root","root");
			   
			   // Preaparing the statement to execute
			   String sql = "select * from user_register where username = ? and password = ?";
			   PreparedStatement stm = con.prepareStatement(sql);
			   stm.setString(1, uname);
			   stm.setString(2, pass);
			   
			   ResultSet rs = stm.executeQuery();
			   
			   if(rs.next()) {
				   
				   return true;
				   
			   }
			   
			 
		 }catch(Exception e) {
			 
			 e.getMessage();
			 
		 }
		
		
		return false;
		
	}
	

}
