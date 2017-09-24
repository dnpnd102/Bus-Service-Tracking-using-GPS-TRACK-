<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>  
<%@ page import="com.ibm.dao.*" %>      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="mycss.css">

</head>
<body>
<%
 String sql="select * from userregistration";
 CABDAO obj=new CABDAO();
 ResultSet rs=obj.FechAlldata(sql);
%>
<center>
<h1>USER DETAILS</h1>
<form action="UserUpdate.jsp" method="post">
<table border="1">
  <tr>
     <th>  </th>
     <th>UNAME</th>
     <th>PWD</th>
     <th>EMAIL</th>
     <th>DOB</th>
     <th>CONTACT</th>
  </tr>
  <%  while(rs.next()){ %>
    <tr>
        <td><input type="radio" name="email" value="<%=rs.getString(3)%>" /> </td>
        <td><%=rs.getString(1) %></td>
        <td><%=rs.getString(2) %></td>
        <td><%=rs.getString(3) %></td>
        <td><%=rs.getString(4) %></td>
        <td><%=rs.getString(5) %></td>
    </tr>
  <%} %>
  
 </table>
 <input type="submit" value="Search" />
 </form>

 
 
 <%
  if(request.getParameter("email")!=null)
  {
	  
	  out.println(request.getParameter("email"));
	  String sql1="select * from userregistration where email=?";
	  CABDAO obj1=new CABDAO();
	  ResultSet rs1= obj.FechdataByemail(sql1, request.getParameter("email"));
	  
	  out.print("<form method=post action=UpdateServlet>");
      out.print("<table border=1>");	  
	  while(rs1.next())
	  {
		 out.println("<tr><td>username</td><td><input type='text' name='uname' value='"+rs1.getString(1)+"' /></td></tr>");
		 out.println("<tr><td>PASSWORD</td><td><input type='text' name='pwd' value='"+rs1.getString(2)+"' /></td></tr>");
		 out.println("<tr><td>EMAIL</td><td><input type='text' name='email' value='"+rs1.getString(3)+"' /></td></tr>");
		 out.println("<tr><td>DOB</td><td><input type='text' name='dob' value='"+rs1.getString(4)+"' /></td></tr>");
		 out.println("<tr><td>CONTACT</td><td><input type='text' name='contact' value='"+rs1.getString(5)+"' /></td></tr>");
			
		  
		  
	  }
	  out.print("</table>");
	  out.print("<input type=submit value=update />");
	  out.print("</form>");
  }
%>
</center>


</body>
</html>

