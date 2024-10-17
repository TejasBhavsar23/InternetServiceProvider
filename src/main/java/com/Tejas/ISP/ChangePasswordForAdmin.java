package com.Tejas.ISP;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ChangePasswordForAdmin
 */
public class ChangePasswordForAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePasswordForAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		try 
		{
		String npass=request.getParameter("npass");
		Connection con = connectDB.dbCon();
		PreparedStatement ps=con.prepareStatement("update adminLogin set password=? where username=?");
		ps.setString(1, npass);
		ps.setString(2, "Admin");
		int i = ps.executeUpdate();
		if(i > 0)
		{
			response.sendRedirect("t_2_AdminOperations_AfterLogin.html");
		}
		else
		{
			response.sendRedirect("t_23_ChangePasswordForAdmin.html");
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}