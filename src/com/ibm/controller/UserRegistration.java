package com.ibm.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ibm.dao.CABDAO;
import com.ibm.model.RegModel;

/**
 * Servlet implementation class UserRegistration
 */
@WebServlet("/UserRegistration")
public class UserRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserRegistration() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uname=request.getParameter("uname");
		String pwd=request.getParameter("pwd");
		String email=request.getParameter("email");
		String dob=request.getParameter("dob");
		String contact=request.getParameter("contact");
		
		
		RegModel obj=new RegModel();
		obj.setUname(uname);
		obj.setPwd(pwd);
		obj.setEmail(email);
		obj.setDob(dob);
		obj.setContact(contact);
		
		String sql="insert into userregistration(uname,pwd,email,dob,contact) values(?,?,?,?,?)";
		
		CABDAO obj1=new CABDAO();
		String msg=obj1.InsertUserData(obj, sql);
		if(msg.equals("success"))
		{
			response.sendRedirect("Userlogin.jsp");
		}
		else
		{
			response.sendRedirect("UserRegistration.jsp");	
		}
		
		
		
		
	}

}

