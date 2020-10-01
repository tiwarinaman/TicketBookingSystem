<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ include file = "navbar.jsp" %>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<title>Welcome to Ticket Booking System</title>
</head><br><br>
<body>

<%

	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
	
	response.setHeader("Pragma", "no-catch"); // HTTP 1.0
	    
	response.setHeader("Expires", "0"); // Proxies Server    
	
	if(session.getAttribute("uname") == null){
		
		response.sendRedirect("login.jsp");
		
	}

%>
<header>
 <h1 style = "color:green">Welcome ${uname}</h1>
</header>  
  

<form action = "search.jsp" method = "get">
 
    <%
    
     try{
       
       Class.forName("com.mysql.cj.jdbc.Driver");
       String url = "jdbc:mysql://localhost:3306/javaticketbooking";
       Connection con = DriverManager.getConnection(url,"root","root");
      
       Statement stm = con.createStatement();
       
       ResultSet rs  = stm.executeQuery("select * from stations");
    %>
    
    <center>
       <h3>Select your station : </h3> 
       <select name = "from_sta">
        <%  while(rs.next()){ %>
            <option><%= rs.getString(2)%></option>
        <% } %>
        </select>
       
    </center>
    
    <%
       
        ResultSet Rs =  stm.executeQuery("select * from stations");
    
    %>
    
    <center>
       <h3>Destination station : </h3>
       <select name = "to_sta">
        <%  while(Rs.next()){ %>
            <option><%= Rs.getString("station_name")%></option>
        <% } %>
        </select>
    </center>
    
   
   
   
    <%
         }catch(Exception e){
        	 
        	 out.print("Wrong entry "+ e);
        	 
         }
    
    %>
    
<center>    
  <h3>Journey :</h3>
  <input type="date" name="journey"><br><br>
  
  <button type="submit" class="btn btn-dark">Search Trains</button>
 
</center>
</form>



</body>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</html>