package me.techienaman;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ForgotPassDb {
	
	
	public boolean check(String uname) {
		
		
		try {
			
			// Loading the MySql driver
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/javaticketbooking";
			Connection con = DriverManager.getConnection(url,"root","root");
			
			String sql = "select * from user_register where username = ?";
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, uname);
			
			
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
