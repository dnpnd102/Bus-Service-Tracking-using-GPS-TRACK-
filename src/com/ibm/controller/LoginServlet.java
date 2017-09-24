package com.ibm.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ibm.dao.CABDAO;
import com.ibm.model.RegModel;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

         String email=request.getParameter("email");
         String pwd=request.getParameter("pwd");
         
         RegModel obj=new RegModel();
         obj.setEmail(email);
         obj.setPwd(pwd);
         
         String sql="select * from cabinfo where email=? and pwd=?";
         
         CABDAO obj1=new CABDAO();
         String msg=obj1.ValidateUser(obj, sql);
         if(msg.equals("success"))
         {
        	 response.sendRedirect("ADMINHOME.jsp");
         }
         else
         {
        	 response.sendRedirect("login.jsp?error=INVALID USERNASME AND PASSWORD");
         }
         
         
		
		
	}

}
