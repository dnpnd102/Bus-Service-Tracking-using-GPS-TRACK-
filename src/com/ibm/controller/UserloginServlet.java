package com.ibm.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ibm.dao.CABDAO;
import com.ibm.model.RegModel;

/**
 * Servlet implementation class UserloginServlet
 */
@WebServlet("/UserloginServlet")
public class UserloginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserloginServlet() {
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

        String email=request.getParameter("email");
        String pwd=request.getParameter("pwd");
        
        RegModel obj=new RegModel();
        obj.setEmail(email);
        obj.setPwd(pwd);
        
        String sql="select * from userregistration where email=? and pwd=?";
        
        CABDAO obj1=new CABDAO();
        String msg=obj1.ValidateUser(obj, sql);
        if(msg.equals("success"))
        {
        	HttpSession session=request.getSession();
			session.setAttribute("usersession", email);
        	response.sendRedirect("SearchBus.jsp");
        }
        else
        {
       	 response.sendRedirect("Userlogin.jsp?error=INVALID USERNASME AND PASSWORD");
        }
        
        
		
		
	}


	}

