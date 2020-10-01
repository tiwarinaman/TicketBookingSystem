package me.techienaman;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class RegisterDb {
	
	public boolean store(String name, String uname, int age, String email, String pass) {
		
		
		
	  try {
		  
		    
		   // Loading the MySql driver
		  Class.forName("com.mysql.cj.jdbc.Driver");
		  String url = "jdbc:mysql://localhost:3306/javaticketbooking";
		  Connection con = DriverManager.getConnection(url,"root","root");
		  
		  
		  String sql = "insert into user_register values(?,?,?,?,?)";
		  PreparedStatement stm = con.prepareStatement(sql); 
		  stm.setString(1, name);
		  stm.setString(2, uname);
		  stm.setInt(3, age);
          stm.setString(4, email);
          stm.setString(5, pass);
          
          stm.executeUpdate();
          
          return true;
          
		  
	  }catch(Exception e) {
		  
		  e.getMessage();
		  
		  return false;
		  
	  }
		
		
	}
	

}
