<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@page import="com.ibm.dao.*" %>
<%@page import="java.sql.*" %> 
<%@page import="javax.servlet.http.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<style>


</style>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<center>

<h1>WELCOME TO USER REGISTRATION</h1>
<table>
<form action="UserRegistration" method="post">

<tr><td>USERNAME</td><td><input type="text" name="uname"/></td></tr>
<tr><td>PASSWORD</td><td><input type="password" name="pwd"/></td></tr>
<tr><td>EMAIL</td><td><input type="email" name="email"></td></tr>
<tr><td>
  <label>  Date of Birth</label>
  </td>
  <td>
  <select name="DOBMonth">
	<option> - Month - </option>
	<option value="January">January</option>
	<option value="Febuary">Febuary</option>
	<option value="March">March</option>
	<option value="April">April</option>
	<option value="May">May</option>
	<option value="June">June</option>
	<option value="July">July</option>
	<option value="August">August</option>
	<option value="September">September</option>
	<option value="October">October</option>
	<option value="November">November</option>
	<option value="December">December</option>
</select>

<select name="DOBDay">
	<option> - Day - </option>
	<option value="1">1</option>
	<option value="2">2</option>
	<option value="3">3</option>
	<option value="4">4</option>
	<option value="5">5</option>
	<option value="6">6</option>
	<option value="7">7</option>
	<option value="8">8</option>
	<option value="9">9</option>
	<option value="10">10</option>
	<option value="11">11</option>
	<option value="12">12</option>
	<option value="13">13</option>
	<option value="14">14</option>
	<option value="15">15</option>
	<option value="16">16</option>
	<option value="17">17</option>
	<option value="18">18</option>
	<option value="19">19</option>
	<option value="20">20</option>
	<option value="21">21</option>
	<option value="22">22</option>
	<option value="23">23</option>
	<option value="24">24</option>
	<option value="25">25</option>
	<option value="26">26</option>
	<option value="27">27</option>
	<option value="28">28</option>
	<option value="29">29</option>
	<option value="30">30</option>
	<option value="31">31</option>
</select>

<select name="DOBYear">
	<option> - Year - </option>
	<option value="1993">2017</option>
	<option value="1992">2016</option>
	<option value="1991">2015</option>
	<option value="1990">2014</option>
	<option value="1990">2013</option>
	<option value="1990">2012</option>
	<option value="1990">2011</option>
	<option value="1990">2010</option>
	<option value="1990">2009</option>
	<option value="1990">2008</option>
	<option value="1990">2007</option>
	<option value="1990">2006</option>
	<option value="1990">2005</option>
	<option value="1990">2004</option>
	<option value="1990">2003</option>
	<option value="1989">2002</option>
	<option value="1988">2001</option>
	<option value="1987">2000</option>
	<option value="1986">1999</option>
	<option value="1985">1998</option>
	<option value="1984">1997</option>
	<option value="1983">1996</option>
	<option value="1982">1995</option>
	<option value="1981">1994</option>
	<option value="1980">1993</option>
	<option value="1979">1992</option>
	<option value="1978">1991</option>
	<option value="1977">1990</option>
	<option value="1976">1989</option>
	<option value="1976">1988</option>
	<option value="1976">1987</option>
	<option value="1976">1986</option>
	<option value="1976">1985</option>
	<option value="1976">1984</option>
	<option value="1976">1983</option>
	<option value="1976">1982</option>
	<option value="1975">1981</option>
	<option value="1974">1980</option>
	
</select>
</td>
</tr>
<tr><td>CONTACT</td><td><input type="text" name="contact"></td></tr>
<tr><td></td><td><input type="submit" value="REGISTER" /></td></tr>

</form>
</table>

</body>
</center>
</html>