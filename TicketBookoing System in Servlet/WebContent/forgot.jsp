<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html lang="zxx">
<!-- Head -->

<head>
    <title>Forgot Password</title>
    <!-- Meta-Tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
    <meta name="keywords" content="Key Login Form a Responsive Web Template, Bootstrap Web Templates, Flat Web Templates, Android Compatible Web Template, Smartphone Compatible Web Template, Free Webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design">
    <script>
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
    <!-- //Meta-Tags -->
    <!-- Index-Page-CSS -->
    <link rel="stylesheet" href="css/style.css" type="text/css" media="all">
    <!-- //Custom-Stylesheet-Links -->
    <!--fonts -->
    <!-- //fonts -->
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css" media="all">
    <!-- //Font-Awesome-File-Links -->
	
	<!-- Google fonts -->
	<link href="//fonts.googleapis.com/css?family=Quattrocento+Sans:400,400i,700,700i" rel="stylesheet">
	<link href="//fonts.googleapis.com/css?family=Mukta:200,300,400,500,600,700,800" rel="stylesheet">
	<!-- Google fonts -->
	 

</head>
<!-- //Head -->
<!-- Body -->

<body>

<%

	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
	
	response.setHeader("Pragma", "no-catch"); // HTTP 1.0
	    
	response.setHeader("Expires", "0"); // Proxies Server    
	
	if(session.getAttribute("uname") != null){
		
		   out.println("<script type=\"text/javascript\">");
		   out.println("alert('After Login you can not go back');");
		   out.println("location='welcome.jsp';");
		   out.println("</script>");
		
		
	}

%>

<section class="main">
	<div class="layer">
		
		<div class="bottom-grid">
			
			<div class="links">
				<ul class="links-unordered-list">
					<li class="active" >
						<a href="home.jsp" class="" >Railway Ticket Booking System</a>
					</li>
					<li class="">
						<a href="login.jsp" class="">Login</a>
					</li>
					<li class="">
						<a href="register.jsp" class="">Register</a>
					</li>
					<li class="">
						<a href="about.jsp" class="">About Us</a>
					</li>
					<li class="">
						<a href="#" class="">Contact</a>
					</li>
				</ul>
			</div>
		</div>
		<div class="content-w3ls">
			
			<div class="content-bottom">
				<form action="forgot" method="post">
					<div class="field-group">
						<span class="fa fa-user" aria-hidden="true"></span>
						<div class="wthree-field" >
							<input name="uname" id="text1" type="text" value="" placeholder="Username" required >
						</div>
					</div>
					<div class="wthree-field">
						<button type="submit" class="btn">Forgot Password</button>
					</div>
				</form>
			</div>
		</div>
		
			<div class="copyright">
				<p style =" position : absolute; top: 90%; left:68%;">© 2020. All rights reserved | Design by
					<a href="http://mishraprabhakar.github.io">Prabhakar </a>
				</p>
			</div>
		</div>
    </div>
</section>

</body>
<!-- //Body -->
</html>
