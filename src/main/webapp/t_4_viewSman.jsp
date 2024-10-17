<%@page import="java.sql.*" %>
<%@page import="com.Tejas.ISP.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CSS Project</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="CSS/viewSman.css">
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
                        <a href="t_18_AssignPendingComplaint.jsp">Unsolved Complaints</a>
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

    <div class="content">
        <table>
            <thead>
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Designation</th>
                <th>Department</th>
                <th>Pincode</th>
                <th>Contact</th>
                <th>Email</th>
                <th>Password</th>
            </tr>
            </thead>
            <tbody>
            <% 
            try {
                Connection con = connectDB.dbCon();
                PreparedStatement ps = con.prepareStatement("select * from serviceMan");
                ResultSet rs = ps.executeQuery();
                while (rs.next()) { 
            %>
                <tr>
                    <td><%= rs.getInt("id") %></td>
                    <td><%= rs.getString("name") %></td>
                    <td><%= rs.getString("designation") %></td>
                    <td><%= rs.getString("department") %></td>
                    <td><%= rs.getInt("pincode") %></td>
                    <td><%= rs.getInt("contact") %></td>
                    <td><%= rs.getString("email") %></td>
                    <td><%= rs.getString("password") %></td>
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
</div>

<script src="JS/adminLogin.js"></script>
</body>
</html>
