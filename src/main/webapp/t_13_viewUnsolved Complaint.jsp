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
    	<table>
        <thead>
        <tr>
            <th>Id</th>
            <th>Customer Id</th>
            <th>Serviceman Id</th>
            <th>Title</th>
            <th>Details</th>
            <th>Contact</th>
            <th>Address</th>
            <th>Date</th>
            <th>Time</th>
            <th>Status</th>
        </tr>
        </thead>
        <tbody>
        <% 
        try {
        	String custid= GetCustomerId.getCustid();
            Connection con = connectDB.dbCon();
            PreparedStatement ps = con.prepareStatement("select * from complaint where custid=? and status=?");
            ps.setInt(1, Integer.parseInt(custid));
            ps.setString(2,"pending");
            ResultSet rs= ps.executeQuery();
            while (rs.next()) { 
        %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getInt("custid") %></td>
                <td><%= rs.getInt("smanid") %></td>
                <td><%= rs.getString("title") %></td>
                <td><%= rs.getString("details") %></td>
                <td><%= rs.getInt("contact") %></td>
                <td><%= rs.getString("address") %></td>
                <td><%= rs.getString("date") %></td>
                <td><%= rs.getString("time") %></td>
                <td><%= rs.getString("status") %></td>
            </tr>
        <% 
            }
        } catch (Exception e) {
            e.printStackTrace();
        } 
        %>
        </tbody>
    </table>
</div>
    <script src="JS/adminLogin.js"></script>
  </body>
</html>
