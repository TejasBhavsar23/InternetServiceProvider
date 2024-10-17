package com.Tejas.ISP;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ServiceManLogin
 */
public class ServiceManLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServiceManLogin() {
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
		
		 Connection con = null;
	        PreparedStatement ps = null;
	        ResultSet rs = null;
	        try {
	            String id = request.getParameter("id");
	            String password = request.getParameter("password");
	            con = connectDB.dbCon();
	            ps = con.prepareStatement("select * from serviceMan where id=? and password=?");
	            ps.setString(1, id);
	            ps.setString(2, password);
	            rs = ps.executeQuery();
	            if (rs.next()) {
	            	 GetSmanId.setSmanid(id);
	                response.sendRedirect("t_19_ServiceManOperationsAfterLogin.html");
	            } else {
	                response.sendRedirect("index.html");
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            try {
	                if (rs != null) rs.close();
	                if (ps != null) ps.close();
	                if (con != null) con.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	}

}
