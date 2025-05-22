package com.timetrove.controller.dao;

import com.timetrove.controller.database.DBUtil;
import com.timetrove.model.User;

import java.sql.*;

public class UserDAO {
    private Connection conn;

    // Constructor - Optional connection initialization
    public UserDAO() {
        try {
            conn = DBUtil.getConnection();
        } catch (Exception e) {
            System.out.println(">>> Failed to establish DB connection: " + e.getMessage());
            e.printStackTrace();
        }
    }

    // ✅ Register a new user
    public boolean registerUser(User user) {
        String sql = "INSERT INTO users (first_name, last_name, username, birthday, gender, phone, email, role, password, address) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, user.getFirstName());
            stmt.setString(2, user.getLastName());
            stmt.setString(3, user.getUsername());
            stmt.setString(4, user.getBirthday());
            stmt.setString(5, user.getGender());
            stmt.setString(6, user.getPhone());
            stmt.setString(7, user.getEmail());
            stmt.setString(8, user.getRole());
            stmt.setString(9, user.getPassword());
            stmt.setString(10, user.getAddress());

            return stmt.executeUpdate() > 0;

        } catch (Exception e) {
            System.out.println(">>> SQL Exception during registerUser: " + e.getMessage());
            return false;
        }
    }

    // ✅ Authenticate user and return User object with ID
    public User login(String username, String password) {
        String sql = "SELECT * FROM users WHERE username = ? AND password = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, username.trim());
            stmt.setString(2, password.trim());

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setFirstName(rs.getString("first_name"));
                user.setLastName(rs.getString("last_name"));
                user.setUsername(rs.getString("username"));
                user.setBirthday(rs.getString("birthday"));
                user.setGender(rs.getString("gender"));
                user.setPhone(rs.getString("phone"));
                user.setEmail(rs.getString("email"));
                user.setRole(rs.getString("role"));
                user.setPassword(rs.getString("password"));
                user.setAddress(rs.getString("address"));

                System.out.println(">>> Login successful for user: " + username + ", role: " + user.getRole());
                return user;
            } else {
                System.out.println(">>> No matching user found for username: " + username);
            }

        } catch (Exception e) {
            System.out.println(">>> SQL error during login: " + e.getMessage());
            e.printStackTrace();
        }

        return null;
    }

    // ✅ Get total number of registered users
    public int getUserCount() {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM users";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            if (rs.next()) {
                count = rs.getInt(1);
            }

        } catch (Exception e) {
            System.out.println(">>> SQL Exception in getUserCount: " + e.getMessage());
        }

        return count;
    }

    // ✅ Update user profile
    public boolean updateUser(User user) {
        String sql = "UPDATE users SET first_name=?, last_name=?, phone=?, email=?, address=? WHERE id=?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, user.getFirstName());
            stmt.setString(2, user.getLastName());
            stmt.setString(3, user.getPhone());
            stmt.setString(4, user.getEmail());
            stmt.setString(5, user.getAddress());
            stmt.setInt(6, user.getId());

            return stmt.executeUpdate() > 0;

        } catch (Exception e) {
            System.out.println(">>> SQL Exception in updateUser: " + e.getMessage());
            return false;
        }
    }
}
