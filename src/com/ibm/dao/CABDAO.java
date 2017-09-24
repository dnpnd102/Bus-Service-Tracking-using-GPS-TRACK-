package com.ibm.dao;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.ibm.model.RegModel;
import com.mysql.jdbc.Connection;


public class CABDAO {
	
	public static String drivername="com.mysql.jdbc.Driver";
	public static String url="jdbc:mysql://localhost:3306/cab";
	public static String username="root";
	public static String password="dina";
	public static  Connection con=null;

	 
	 static
	 {
		 try
		 {
			 Class.forName(drivername);
				 con= (Connection) DriverManager.getConnection(url,username,password); 
		 }
		 catch(Exception e)
		 {
			 e.printStackTrace();
		 }
		 
	}
	 
public static String InsertUserData(RegModel obj,String sql)
{

	try
	{
		PreparedStatement ps=(PreparedStatement) con.prepareStatement(sql);
		ps.setString(1,obj.getUname());
		ps.setString(2,obj.getPwd());
		ps.setString(3,obj.getEmail());
		ps.setString(4,obj.getDob());
		ps.setString(5,obj.getContact());
		int i=ps.executeUpdate();
		if(i==1)
		{
			return "success";
		}
		else
		{
			return "fail";
		}
	}	
		catch(Exception e)
		{
			e.printStackTrace();}
	
	
	return "";
}


public String ValidateUser(RegModel obj,String sql)
{
	try
	{
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(1,obj.getEmail());
		ps.setString(2,obj.getPwd());
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
			return "success";
		}
		else
		{
			return "fail";
		}
	}
	catch(Exception e)
	{
	    e.printStackTrace();
	}
	
	return "";
}
public ResultSet FechdataByemail(String sql,String email)
{
	ResultSet rs=null;
	
	try
	{
		PreparedStatement ps=con.prepareStatement(sql);
		ps=con.prepareStatement(sql);
		ps.setString(1,email);
	    rs=ps.executeQuery();
	    System.out.println(email);
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	
	
	
	return rs;
}
public ResultSet FechAlldata(String sql1)
{
	ResultSet rs = null;
	try
	{
		PreparedStatement ps = con.prepareStatement(sql1);
		rs=ps.executeQuery();
	   
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	   return rs;
}
public String UpdateUserData(RegModel obj,String sql,String id){
	
	
	try
	{
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(1,obj.getUname());
		ps.setString(2,obj.getPwd());
		ps.setString(3,obj.getEmail());
		ps.setString(4,obj.getDob());
		ps.setString(5,obj.getContact());
		ps.setString(6,id);
		int i=ps.executeUpdate();
		if(i==1)
		{
			return "success";
		}
		else
		{
			return "fail";
		}
		
		
	}
	catch(Exception e)
	{
		
		e.printStackTrace();
	}
	
	return "";
}

	
public String DeleteUser(String sql,String email)
{
	
	try
	{
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1,email);
		int i=ps.executeUpdate();
		if(i==1)
		{
			return "success";
		}
		else
		{
			return "fail";
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	
	return "";
}
public String DeleteBus(String sql,String BUSSERVICE)
{
	
	try
	{
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1,BUSSERVICE);
		int i=ps.executeUpdate();
		if(i==1)
		{
			return "success";
		}
		else
		{
			return "fail";
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	
	return "";
}

public ResultSet FechdataByBUSSERVICE1(String sql,String BUSSERVICE)
{
	ResultSet rs=null;
	
	try
	{
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1,BUSSERVICE);
	    rs=ps.executeQuery();
	    System.out.println(BUSSERVICE);
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	
	
	
	return rs;
}

public static void main(String[] args) {
	// TODO Auto-generated method stub

}

}



