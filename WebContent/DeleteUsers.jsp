<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.ibm.dao.*" %>
<%@page import="java.sql.*" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BUS TRACKING SYSTEM</title>
</head>
<body>
<center>

<h1>DELETE USERS</h1>

<%
  
	  String sql="select * from userregistration";
	  CABDAO obj=new CABDAO();
	  ResultSet rs=obj.FechAlldata(sql);
	  out.println("<form action=DeleteServlet method=post>");

	  out.println("<table border=3><tr style='background-color:#F5DEB3;'>");
	  out.println("<td> </td>");
	  
	  out.println("<td>uname</td>");
	  out.println("<td>pwd</td>");
	  out.println("<td>email</td>");
	  out.println("<td>dob</td>");
	  out.println("<td>contact</td>");
      out.println("</tr>"); 
	  
	  while(rs.next())
	  {
		  out.println("<tr>");
		  
		  out.println("<td>aa<input type='checkbox' name='email' value='"+rs.getString(3)+"'/></td>");
		  
		  out.println("<td>"+rs.getString(1)+"</td>");
		  out.println("<td>"+rs.getString(2)+"</td>");
		  out.println("<td>"+rs.getString(3)+"</td>");
		  out.println("<td>"+rs.getString(4)+"</td>");
		  out.println("<td>"+rs.getString(5)+"</td>");
		  out.println("</tr>");
	  }
	  out.println("</table>");
	  out.println("<input type=submit value=DELETE  />");
	  out.println("</form>");
	  

  
  
  


%>

</center>

</body>
</html>