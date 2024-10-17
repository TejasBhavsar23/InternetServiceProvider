package com.Tejas.ISP;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class t_1_AdminLogin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public t_1_AdminLogin() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            con = connectDB.dbCon();
            ps = con.prepareStatement("select * from adminLogin where username=? and password=?");
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();
            if (rs.next()) {
                response.sendRedirect("t_2_AdminOperations_AfterLogin.html");
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
