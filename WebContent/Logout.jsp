<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
   if(session.getAttribute("usersession")!=null)
   {
	   
	   session.removeAttribute("usersession");
	   session.invalidate();
	   response.sendRedirect("Userlogin.jsp");
   }
   else
   {
	   response.sendRedirect("Userlogin.jsp");
   }


%>
</body>
</html>