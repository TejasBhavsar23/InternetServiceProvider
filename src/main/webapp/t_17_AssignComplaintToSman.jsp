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
                <a href="t_1_AdminLogin.jsp">Add New Service Man</a>
                <a href="t_1_AdminLogin.jsp">View All Service Man</a>
                <a href="t_1_AdminLogin.jsp">Delete Service Man</a>
              </div>
            </li>
            <li class="dropdown">
              <a href="#" class="dropbtn">
                <i class="fa-solid fa-toolbox"></i>
                <span class="menu-text">Customer</span>
                <i class="fa-solid fa-chevron-down dropdown-arrow"></i>
              </a>
              <div class="dropdown-content">
                <a href="t_1_AdminLogin.jsp">Add New Customer</a>
                <a href="t_1_AdminLogin.jsp">View Customer</a>
                <a href="t_1_AdminLogin.jsp">Delete Customer</a>
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
      <%
      String id=request.getParameter("searchKey");
      %>
    	<form action="t_17_AssignComplaintToSman.jsp" >
    		 <input type="text" name="cid" value="<%=id%>" /> 
    		<input type="text" name="id" placeholder="Enter Service Man Id" />
    		<input type="submit" value="Submit" />
    		</form>
        <% 
        try {
        	int cid=Integer.parseInt(request.getParameter("cid"));
        	int smanid=Integer.parseInt(request.getParameter("id"));
            Connection con = connectDB.dbCon();
            PreparedStatement ps = con.prepareStatement("update complaint set smanid=? where id=?");
            ps.setInt(1,smanid);
            ps.setInt(2,cid);
           int i = ps.executeUpdate();
            if(i>0)
            { 
            	response.sendRedirect("t_15_viewUnsolvedComplaintForAdmin.jsp");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        } 
        %>
        
        
</div>
    <script src="JS/adminLogin.js"></script>
  </body>
</html>
