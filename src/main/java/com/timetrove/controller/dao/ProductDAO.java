package com.timetrove.controller.dao;

import com.timetrove.model.Product;
import com.timetrove.controller.database.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {

    private static final String INSERT_PRODUCT_SQL =
            "INSERT INTO products (name, price, stock, category_id, description, image) VALUES (?, ?, ?, ?, ?, ?)";

    private static final String SELECT_ALL_PRODUCTS =
            "SELECT p.*, c.name AS category_name FROM products p JOIN categories c ON p.category_id = c.id";

    private static final String SELECT_PRODUCT_BY_ID =
            "SELECT p.*, c.name AS category_name FROM products p JOIN categories c ON p.category_id = c.id WHERE p.id = ?";

    private static final String UPDATE_PRODUCT_SQL =
            "UPDATE products SET name = ?, price = ?, stock = ?, category_id = ?, description = ?, image = ? WHERE id = ?";

    private static final String DELETE_PRODUCT_SQL =
            "DELETE FROM products WHERE id = ?";

    private static final String SELECT_PRODUCTS_BY_CATEGORY =
            "SELECT p.*, c.name AS category_name FROM products p JOIN categories c ON p.category_id = c.id WHERE c.name = ?";

    private static final String SEARCH_PRODUCTS_BY_NAME =
            "SELECT p.*, c.name AS category_name FROM products p JOIN categories c ON p.category_id = c.id WHERE p.name LIKE ?";

    // ✅ Add new product
    public boolean addProduct(Product product) {
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(INSERT_PRODUCT_SQL)) {

            stmt.setString(1, product.getName());
            stmt.setDouble(2, product.getPrice());
            stmt.setInt(3, product.getStock());
            stmt.setInt(4, product.getCategoryId());
            stmt.setString(5, product.getDescription());
            stmt.setString(6, product.getImage());

            return stmt.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // ✅ Get all products (with category name)
    public List<Product> getAllProducts() {
        List<Product> products = new ArrayList<>();
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(SELECT_ALL_PRODUCTS);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Product product = extractProductFromResultSet(rs);
                products.add(product);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return products;
    }

    // ✅ Get product by ID
    public Product getProductById(int id) {
        Product product = null;
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(SELECT_PRODUCT_BY_ID)) {

            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                product = extractProductFromResultSet(rs);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return product;
    }

    // ✅ Get products by category name
    public List<Product> getProductsByCategory(String categoryName) {
        List<Product> products = new ArrayList<>();
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(SELECT_PRODUCTS_BY_CATEGORY)) {

            stmt.setString(1, categoryName);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Product product = extractProductFromResultSet(rs);
                products.add(product);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return products;
    }

    // ✅ Search products by name
    public List<Product> searchProductsByName(String keyword) {
        List<Product> products = new ArrayList<>();
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(SEARCH_PRODUCTS_BY_NAME)) {

            stmt.setString(1, "%" + keyword + "%");
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Product product = extractProductFromResultSet(rs);
                products.add(product);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return products;
    }

    // ✅ Update existing product
    public boolean updateProduct(Product product) {
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(UPDATE_PRODUCT_SQL)) {

            stmt.setString(1, product.getName());
            stmt.setDouble(2, product.getPrice());
            stmt.setInt(3, product.getStock());
            stmt.setInt(4, product.getCategoryId());
            stmt.setString(5, product.getDescription());
            stmt.setString(6, product.getImage());
            stmt.setInt(7, product.getId());

            return stmt.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // ✅ Delete product
    public boolean deleteProduct(int id) {
        String sql = "DELETE FROM products WHERE id = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            int affectedRows = stmt.executeUpdate();

            if (affectedRows > 0) {
                System.out.println("✅ Product deleted with ID: " + id);
                return true;
            } else {
                System.out.println("⚠️ No product found with ID: " + id);
                return false;
            }

        } catch (SQLException e) {
            System.err.println("❌ SQL Error during product deletion: " + e.getMessage());
            return false;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }


    // ✅ Extract product from ResultSet
    private static Product extractProductFromResultSet(ResultSet rs) throws SQLException {
        Product product = new Product();
        product.setId(rs.getInt("id"));
        product.setName(rs.getString("name"));
        product.setPrice(rs.getDouble("price"));
        product.setStock(rs.getInt("stock"));
        product.setCategoryId(rs.getInt("category_id"));
        product.setDescription(rs.getString("description"));
        product.setImage(rs.getString("image"));
        product.setCategoryName(rs.getString("category_name"));
        return product;
    }
    
}
