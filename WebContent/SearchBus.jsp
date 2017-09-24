<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.ibm.dao.*" %>
<%@page import="java.sql.*" %> 
<%@page import="javax.servlet.http.*" %>
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
						<li><a href="Logout.jsp">Logout</a></li>
					</ul>
				</nav>
			</header>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="SearchBus.jsp" method="post">
	   <table>
	   <tr>
	      <td>Search by BUSSERVICE</td>
	      <td><input type="text" name="BUSSERVICE" placeholder="Enter Bus Service Number"/></td>
	      <td><input type="submit" name="Search" /></td>
	   </tr>
	   </table>
   </form>
   <br>



<%
  if(request.getParameter("BUSSERVICE")!=null)
  {
	  String BUSSERVICE=request.getParameter("BUSSERVICE");
	  String sql1="select * from busInfo where BUSSERVICE=?";
	  System.out.println(BUSSERVICE);
	  CABDAO obj1=new CABDAO();
	  ResultSet rs1=obj1.FechdataByBUSSERVICE1(sql1, BUSSERVICE);
	  
		
	  out.println("<table border=1><tr>");
	  out.println("<td>BUSSERVICE</td>");
	  out.println("<td>SEQNO</td>");
	  out.println("<td>STATION</td>");
	  out.println("<td>LATITUDE</td>");
	  out.println("<td>LONGITUDE</td>");
	  out.println("<td>CURLOCATION</td>");
	  out.println("<td>DESTINATION</td></tr>");
	  if(BUSSERVICE!=null){
	  while(rs1.next())
	  {	  HttpSession session1=request.getSession();
	 	  session1.setAttribute("cur",rs1.getString(6));
	 	  session1.setAttribute("destination",rs1.getString(7));	  
		  out.println("<tr>");
		  out.println("<td>"+rs1.getString(1)+"</td>");
		  out.println("<td>"+rs1.getString(2)+"</td>");
		  out.println("<td>"+rs1.getString(3)+"</td>");
		  out.println("<td>"+rs1.getString(4)+"</td>");
		  out.println("<td>"+rs1.getString(5)+"</td>");
		  out.println("<td>"+rs1.getString(6)+"</td>");
		  out.println("<td>"+rs1.getString(7)+"</td>");
		  out.println("</tr>");
		  
	  }
	  out.println("</table>");
	  
	 
  }
  }
%>

<form action="waypoints.jsp" method="post">
<tr><input type="submit" name="Route" value="Get Route"></tr>

</form>

</body>
</html>