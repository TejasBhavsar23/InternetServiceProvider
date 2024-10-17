package com.Tejas.ISP;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class t_22_MarkSolvedBySman
 */
public class t_22_MarkSolvedBySman extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public t_22_MarkSolvedBySman() {
        super();
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        try {
            Connection con = connectDB.dbCon();
            int id = Integer.parseInt(request.getParameter("id"));
            int eotp = Integer.parseInt(request.getParameter("eotp"));

            // Retrieve the generated OTP from the session
            Integer generatedOtp = (Integer) session.getAttribute("generatedOtp");

            if (generatedOtp != null) {
                if (eotp == generatedOtp) {
                    // OTP is correct, process the request
                    PreparedStatement ps = con.prepareStatement("UPDATE complaint SET status=? WHERE id=?");
                    ps.setString(1, "Solved");
                    ps.setInt(2, id);
                    int i = ps.executeUpdate();
                    if (i > 0) {
                        response.sendRedirect("t_21_viewOwnAssignComplaint.jsp");
                    }
                } else {
                    // OTP is incorrect
                    response.getWriter().println("Invalid OTP. Please try again.");
                }
            } else {
                // Handle case where OTP is not found in session
                response.getWriter().println("OTP not found in session. Please generate a new OTP.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
