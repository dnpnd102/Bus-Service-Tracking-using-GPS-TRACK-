<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--
	Interphase by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>Generic - Interphase by TEMPLATED</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<!--[if lte IE 8]><script src="css/ie/html5shiv.js"></script><![endif]-->
		<script src="js/jquery.min.js"></script>
		<script src="js/skel.min.js"></script>
		<script src="js/skel-layers.min.js"></script>
		<script src="js/init.js"></script>
		<noscript>
			<link rel="stylesheet" href="css/skel.css" />
			<link rel="stylesheet" href="css/style.css" />
			<link rel="stylesheet" href="css/style-xlarge.css" />
		</noscript>
		<!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
	</head>
	<body>

		<!-- Header -->
			<header id="header">
				<h1><a href="index.html">Back To Home</a></h1>
				<nav id="nav">
					<ul>
						<li><a href="index.html">Home</a></li>
						<li><a href="register.jsp">Admin Register</a></li>
						<li><a href="login.jsp">Admin Login</a></li>
						<li><a href="UserRegistration.jsp">User Register</a></li>
						
						
						<li><a href="Userlogin.jsp">User Login</a></li>
					</ul>
				</nav>
			</header>
			
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

</head>
<body>
<center>
<h1>ADMIN LOGIN PAGE</h1>
<form action="LoginServlet" method="post">
<table>
   <tr><td>USERNAME</td><td><input type="email" name="email" /></td></tr>
   <tr><td>Password</td><td><input type="password" name="pwd" /></td></tr>
   <tr><td>        </td><td><input type="submit" value="Login" /></td></tr>
</table>
</form>
<%
if(request.getParameter("error")!=null)
{
	out.println("<h1><font color=red>"+request.getParameter("error")+"</font>");
}

%>



</center>

</body>

</html>