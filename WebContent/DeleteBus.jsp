<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.ibm.dao.*" %>
<%@page import="java.sql.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<center>

<h1>DELETE BUS</h1>


<%
  
	  
	  String sql="select * from businfo";
	  CABDAO obj=new CABDAO();
	  ResultSet rs=obj.FechAlldata(sql);
	  out.println("<form action=DeleteBusServlet method=post>");
	  out.println("<table border=0><tr style='background-color:yellow;'>");
	  out.println("<td></td>");
	  out.println("<td>BUSSERVICE</td>");
	  out.println("<td>SEQNO</td>");
	  out.println("<td>STATION</td>");
	  out.println("<td>LATITUDE</td>");
	  out.println("<td>LONGITUDE</td>");
	  out.println("<td>CURLOCATION</td>");
	  out.println("<td>DESTINATION</td>");
	  
	  while(rs.next())
	  {
		  out.println("<tr>");
		  out.println("<td><input type='checkbox' name='BUSSERVICE' value='"+rs.getString(1)+"'</td>");	
	
		  out.println("<td>"+rs.getString(2)+"</td>");
		  out.println("<td>"+rs.getString(3)+"</td>");
		  out.println("<td>"+rs.getString(4)+"</td>");
		  out.println("<td>"+rs.getString(5)+"</td>");
		  out.println("<td>"+rs.getString(6)+"</td>");
		  out.println("<td>"+rs.getString(7)+"</td>");
		  out.println("</tr>");
	  }
	  out.println("</table>");
	  out.println("<input type=submit value=DELETE  />");
	  out.println("</form>");
	  

  
  
  


%>
</center>
</body>
</html>