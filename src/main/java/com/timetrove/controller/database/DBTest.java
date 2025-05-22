package com.timetrove.controller.database;

import java.sql.Connection;

public class DBTest {
    public static void main(String[] args) {
        try {
            Connection conn = DBUtil.getConnection();
            if (conn != null) {
                System.out.println("✅ Database connection successful!");
                conn.close();
            } else {
                System.out.println("❌ Failed to connect to database.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
