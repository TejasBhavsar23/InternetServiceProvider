package com.Tejas.ISP;
import java.sql.*;

public class connectDB {
    public static Connection dbCon() {
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/appointmentDB", "root", "");
            System.out.println("Connection Established.." + con);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}
