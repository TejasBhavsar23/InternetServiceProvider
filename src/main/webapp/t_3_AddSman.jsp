<%@page import="java.sql.*" %>
<%@page import="com.Tejas.ISP.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>CSS Project</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
    />
    <link
      href="https://fonts.googleapis.com/css2?family=Poppins&display=swap"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="CSS/adminLogin.css" />
  </head>
  <body>
    <div class="main_box">
      <input type="checkbox" id="check" />
      <div class="btn_one">
        <label for="check">
          <i class="fa-solid fa-bars" aria-label="Open Menu"></i>
        </label>
      </div>

      <div class="sidebar_menu">
        <div class="logo">
          <a href="#">My Details</a>
        </div>

        <div class="btn_two">
          <label for="check">
            <i class="fa-solid fa-xmark" aria-label="Close Menu"></i>
          </label>
        </div>

        <div class="menu">
          <ul>
            <li class="dropdown">
              <a href="#" class="dropbtn">
                <i class="fa-solid fa-user-shield"></i>
                <span class="menu-text">Service man</span>
                <i class="fa-solid fa-chevron-down dropdown-arrow"></i>
              </a>
              <div class="dropdown-content">
                <a href="t_3_AddSman.jsp">Add New Service Man</a>
                <a href="t_4_viewSman.jsp">View All Service Man</a>
                <a href="t_5_DeleteSman.jsp">Delete Service Man</a>
              </div>
            </li>
            <li class="dropdown">
              <a href="#" class="dropbtn">
                <i class="fa-solid fa-toolbox"></i>
                <span class="menu-text">Customer</span>
                <i class="fa-solid fa-chevron-down dropdown-arrow"></i>
              </a>
              <div class="dropdown-content">
                <a href="t_6_AddCustomer.jsp">Add New Customer</a>
                <a href="t_7_viewCustomer.jsp">View Customer</a>
                <a href="t_8_DeleteCustomer.jsp">Delete Customer</a>
              </div>
            </li>
            <li class="dropdown">
              <a href="#" class="dropbtn">
                <i class="fa-solid fa-user-shield"></i>
                <span class="menu-text">Complaints</span>
                <i class="fa-solid fa-chevron-down dropdown-arrow"></i>
              </a>
              <div class="dropdown-content">
                <a href="t_18_AssignPendingComplaint.jsp">Usolved Complaints</a>
                <a href="t_16_viewSolvedComplaintForAdmin.jsp">Solved Complaints</a>
                <a href="t_15_viewUnsolvedComplaintForAdmin.jsp">Assign Pending Complaints</a>
              </div>
            </li>
          </ul>
        </div>
        <div class="social_media">
          <ul>
            <a href="#"><i class="fa-brands fa-facebook"></i></a>
            <a href="#"><i class="fa-brands fa-twitter"></i></a>
            <a href="#"><i class="fa-brands fa-instagram"></i></a>
            <a href="#"><i class="fa-brands fa-youtube"></i></a>
          </ul>
        </div>
      </div>
      <div class="form_container">
      	<form action="t_3_AddSman.jsp">
          <h2>Add New Service Man</h2>
          <input type="text" name="name" placeholder="Enter Name" required />
          <input type="text" name="designation" placeholder="Enter Designation" required />
          <input type="text" name="department" placeholder="Enter Department" required />
          <input type="text" name="pincode" placeholder="Enter Pincode" required />
          <input type="text" name="email" placeholder="Enter email" required />
          <input type="text" name="contact" placeholder="Enter Contact" required />
          <input type="password" name="password" placeholder="Enter Password" required />
          <input type="submit" value="Submit" />
          
        <a href="t_2_AdminOperations_AfterLogin.html">Back</a>
        </form>
        </div>
    </div>
    
     <%
     try
     {
    	 int id=0;
        String name=request.getParameter("name");
        String designation=request.getParameter("designation");
        String department=request.getParameter("department");
        String pincode=request.getParameter("pincode");
        String contact=request.getParameter("contact");
        String email=request.getParameter("email");
        String password=request.getParameter("password");
        Connection con = connectDB.dbCon();
        PreparedStatement ps = con.prepareStatement("insert into serviceMan values(?,?,?,?,?,?,?,?)");
        ps.setInt(1, id);
        ps.setString(2, name);
        ps.setString(3, designation);
        ps.setString(4, department);
        ps.setString(5, pincode);
        ps.setString(6, contact);
        ps.setString(7, email);
        ps.setString(8, password);
        int i= ps.executeUpdate();
        if(i>0)
        {
            response.sendRedirect("t_2_AdminOperations_AfterLogin.html");
        }
        else 
        {
        	response.sendRedirect("index.html");
        }
     }
     catch(Exception e)
     {
    	 e.printStackTrace();
     }
    %>

    <script src="JS/adminLogin.js"></script>
  </body>
</html>
