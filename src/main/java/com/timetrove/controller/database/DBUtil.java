package com.timetrove.controller.database;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil {

    public static Connection getConnection() throws Exception {
        // ✅ Load the MySQL JDBC driver explicitly
        Class.forName("com.mysql.cj.jdbc.Driver");

        // ✅ Update these with your actual DB credentials
        String url = "jdbc:mysql://localhost:3306/timetrove";
        String username = "root"; // <-- change this if different
        String password = "";     // <-- set your MySQL password

        // ✅ Return the database connection
        return DriverManager.getConnection(url, username, password);
    }
}
