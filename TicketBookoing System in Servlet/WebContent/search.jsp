<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file = "navbar.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>List of Trains</title>
</head>
<body>

 <%

	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
	
	response.setHeader("Pragma", "no-catch"); // HTTP 1.0
	    
	response.setHeader("Expires", "0"); // Proxies Server    
	
	if(session.getAttribute("uname") == null){
		
		response.sendRedirect("login.jsp");
		
	}

%>

<%
 
	String from = request.getParameter("from_sta");
    String to = request.getParameter("to_sta");
    String journey = request.getParameter("journey");
    
    if(from.equals(to)){
    	
    	   out.println("<script type=\"text/javascript\">");
		   out.println("alert('Boarding and Destination station can not be same.');");
		   out.println("location='welcome.jsp';");
		   out.println("</script>");
    }else{
    	
	    	Class.forName("com.mysql.cj.jdbc.Driver");
	        String url = "jdbc:mysql://localhost:3306/javaticketbooking";
	        Connection con = DriverManager.getConnection(url,"root","root");
	        
	        String sql = "select * from train_details where from_station = ? and to_station = ? and running_date = ?";
	        PreparedStatement stm = con.prepareStatement(sql);
	        stm.setString(1, from);
	        stm.setString(2, to);
	        stm.setString(3, journey);
	        
	        
        
        	ResultSet rs = stm.executeQuery();
   
       
        
        while(rs.next()){
        	
        
    
%>
<form action = "bookTicket" method = "post">
  <table border = "1">
         <tr>
            <td>Train No.</td>
            <td>Train Name</td>
            <td>From Station</td>
            <td>To Station</td>
            <td>Departure Time</td>
            <td>Arrival Time</td>
            <td>Price</td>
            <td>Running Date</td>
         </tr><br>
         
         <tr>
            <td><%= rs.getInt(1) %></td>
            <td><%= rs.getString(2) %></td>
            <td><%= rs.getString(3) %></td>
            <td><%= rs.getString(4) %></td>
            <td><%= rs.getString(5) %></td>
            <td><%= rs.getString(6) %></td>
            <td><%= rs.getString(7) %></td>
            <td><%= rs.getString(8) %></td>
         </tr><br>
         <input type = "submit" value = "Book">
      </table>
  </form>
  

<%

        }

%>

<%
    }
%>


</body>
</html>