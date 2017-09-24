<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page import="com.ibm.dao.*" %>
   <%@page import="java.sql.*" %>
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
				<h1><a href="ADMINHOME.jsp">Back To Admin Home</a></h1>
				<nav id="nav">
					<ul>
						<li><a href="register.jsp">Admin Register</a></li>
						<li><a href="login.jsp">Admin Login</a></li>
						
					</ul>
				</nav>
			</header>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search User By Email</title>
</head>
<body>
 <form action="SearchUser.jsp" method="post">
	   <table>
	   <tr>
	      <td>Search by email</td>
	      <td><input type="text" name="email" /></td>
	      <td><input type="submit" name="Search" /></td>
	   </tr>
	   </table>
   </form>
    <br>



<%
  if(request.getParameter("email")!=null)
  {
	  String email=request.getParameter("email");
	  String sql="select * from userregistration where email=?";
	  System.out.println(email);
	  CABDAO obj=new CABDAO();
	  ResultSet rs=obj.FechdataByemail(sql, email);

	
	  
	  
	  out.println("<table border=0><tr style='background-color:yellow;'>");
	  
	  out.println("<td>uname</td>");
	  out.println("<td>pwd</td>");
	  out.println("<td>email</td>");
	  out.println("<td>dob</td>");
	  out.println("<td>contact</td>");
	  
	  while(rs.next())
	  {
		  out.println("<tr>");
		  //out.println("<td><img src='profilepic/"+rs.getString(12)+"' height=100 width=100 /></td>");
		  out.println("<td>"+rs.getString(1)+"</td>");
		  out.println("<td>"+rs.getString(2)+"</td>");
		  out.println("<td>"+rs.getString(3)+"</td>");
		  out.println("<td>"+rs.getString(4)+"</td>");
		  out.println("<td>"+rs.getString(5)+"</td>");
		  out.println("</tr>");
	  }
	  out.println("</table>");
	  
	  

  
  
  }


%>

</body>
</html>