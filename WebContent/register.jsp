<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	
			
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<center>
<body>
<h1>WELCOME TO ADMINN LOGIN</h1>
<table>
<form action="RegServlet" method="post">

<tr><td>ADMINNAME</td><td><input type="text" name="uname"/></td></tr>
<tr><td>PASSWORD</td><td><input type="password" name="pwd"/></td></tr>
<tr><td>EMAIL</td><td><input type="email" name="email"></td></tr>
<tr><td>DOB</td><td><input type="date" name="dob"></td></tr>
<tr><td>CONTACT</td><td><input type="text" name="contact"></td></tr>
<tr><td></td><td><input type="submit" value="REGISTER" /></td></tr>

</form>
</table>

</body>
</center>
</html>