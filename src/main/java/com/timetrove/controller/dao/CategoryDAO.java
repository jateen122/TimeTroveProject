package com.timetrove.controller.dao;

import com.timetrove.model.Category;
import com.timetrove.controller.database.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO {

    // SQL Statements
    private static final String INSERT_CATEGORY_SQL =
            "INSERT INTO categories (name, description) VALUES (?, ?)";

    private static final String SELECT_ALL_CATEGORIES_SQL =
            "SELECT * FROM categories";

    private static final String SELECT_CATEGORY_BY_NAME_SQL =
            "SELECT * FROM categories WHERE name = ?";

    // ✅ Add a new category
    public boolean addCategory(Category category) {
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(INSERT_CATEGORY_SQL)) {

            stmt.setString(1, category.getName());
            stmt.setString(2, category.getDescription());
            int rowsInserted = stmt.executeUpdate();

            return rowsInserted > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // ✅ Get list of all categories
    public static List<Category> getAllCategories() {
        List<Category> categories = new ArrayList<>();

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(SELECT_ALL_CATEGORIES_SQL);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Category category = new Category();
                category.setId(rs.getInt("id"));
                category.setName(rs.getString("name"));
                category.setDescription(rs.getString("description"));
                categories.add(category);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return categories;
    }

    // ✅ Get a category by its name
    public static Category getCategoryByName(String name) {
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(SELECT_CATEGORY_BY_NAME_SQL)) {

            stmt.setString(1, name);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    Category category = new Category();
                    category.setId(rs.getInt("id"));
                    category.setName(rs.getString("name"));
                    category.setDescription(rs.getString("description"));
                    return category;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}
