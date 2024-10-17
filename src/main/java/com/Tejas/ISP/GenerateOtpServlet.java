package com.Tejas.ISP;

import java.io.IOException;
import java.security.SecureRandom;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class GenerateOtpServlet
 */
public class GenerateOtpServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public GenerateOtpServlet() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        SecureRandom random = new SecureRandom();
        int otp = random.nextInt(900000) + 100000; // Generate a 6-digit OTP
        System.out.println("Generated OTP is : " + otp); // Print to console

        // Store OTP in session
        session.setAttribute("generatedOtp", otp);

        // Forward back to the JSP with a message
        request.setAttribute("message", "OTP generated. Please enter the OTP.");
        request.getRequestDispatcher("t_22_MarkAsSolvedBySman.jsp").forward(request, response);
    }
}
