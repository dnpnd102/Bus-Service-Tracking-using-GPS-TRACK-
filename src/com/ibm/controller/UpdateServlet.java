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
 * Servlet implementation class UpdateServlet
 */
@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateServlet() {
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
		
		
		//set all values indise model class
		RegModel obj=new RegModel();
		obj.setUname(uname);
		obj.setPwd(pwd);
		obj.setEmail(email);
		obj.setDob(dob);
		obj.setContact(contact);
		
		
		String sql="update userregistration set uname=?,pwd=?,email=?,dob=?,contact=? where email=?";
		 
		CABDAO obj1=new CABDAO();
		String msg=obj1.UpdateUserData(obj, sql,email);
		if(msg.equals("success"))
		{
			response.sendRedirect("UserUpdate.jsp");
		}
		else
		{
			response.sendRedirect("UserUpdate.jsp?error=fail to update record");	
		}
	}

}

