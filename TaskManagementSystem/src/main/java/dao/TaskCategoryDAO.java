package dao;

import model.TaskCategory;
import util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TaskCategoryDAO {

    // Get all Task Categories
    public List<TaskCategory> getAllCategories() {
        List<TaskCategory> categories = new ArrayList<>();
        try (Connection connection = DBUtil.getConnection()) {
            String sql = "SELECT * FROM task_category";
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                TaskCategory category = new TaskCategory();
                category.setCategoryID(rs.getInt("CategoryID"));
                category.setCategoryName(rs.getString("CategoryName"));
                categories.add(category);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categories;
    }

    // Get a Task Category by ID
    public TaskCategory getCategoryById(int categoryID) {
        TaskCategory category = null;
        try (Connection connection = DBUtil.getConnection()) {
            String sql = "SELECT * FROM task_category WHERE CategoryID = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, categoryID);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                category = new TaskCategory();
                category.setCategoryID(rs.getInt("CategoryID"));
                category.setCategoryName(rs.getString("CategoryName"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return category;
    }

    // Add a new Task Category
    public void addCategory(TaskCategory category) {
        String sql = "INSERT INTO task_category (CategoryName) VALUES (?)";
        try (Connection connection = DBUtil.getConnection()) {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, category.getCategoryName());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Update an existing Task Category
    public void updateCategory(TaskCategory category) {
        String sql = "UPDATE task_category SET CategoryName = ? WHERE CategoryID = ?";
        try (Connection connection = DBUtil.getConnection()) {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, category.getCategoryName());
            stmt.setInt(2, category.getCategoryID());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Delete a Task Category
    public void deleteCategory(int categoryID) {
        String sql = "DELETE FROM task_category WHERE CategoryID = ?";
        try (Connection connection = DBUtil.getConnection()) {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, categoryID);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
