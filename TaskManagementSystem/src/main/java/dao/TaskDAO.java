package dao;

import model.Task;
import util.DBUtil;

import java.sql.*;

public class TaskDAO {

    // Create Task
    public int createTask(Task task) {
        try (Connection connection = DBUtil.getConnection()) {
            String sql = "INSERT INTO task (TaskName, TaskDescription, Status, DueDate, UserID, CategoryID) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, task.getTaskName());
            stmt.setString(2, task.getTaskDescription());
            stmt.setString(3, task.getStatus());
            stmt.setString(4, task.getDueDate());
            stmt.setInt(5, task.getUserID());
            stmt.setInt(6, task.getCategoryID());

            return stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    // Update Task
    public int updateTask(Task task) {
        try (Connection connection = DBUtil.getConnection()) {
            String sql = "UPDATE task SET TaskName = ?, TaskDescription = ?, Status = ?, DueDate = ?, CategoryID = ? WHERE TaskID = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, task.getTaskName());
            stmt.setString(2, task.getTaskDescription());
            stmt.setString(3, task.getStatus());
            stmt.setString(4, task.getDueDate());
            stmt.setInt(5, task.getCategoryID());
            stmt.setInt(6, task.getTaskID());

            return stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    // Delete Task
    public int deleteTask(int taskID) {
        try (Connection connection = DBUtil.getConnection()) {
            String sql = "DELETE FROM task WHERE TaskID = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, taskID);
            return stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    // Get Task by ID
    public Task getTaskById(int taskID) {
        Task task = null;
        try (Connection connection = DBUtil.getConnection()) {
            String sql = "SELECT * FROM task WHERE TaskID = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, taskID);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                task = new Task();
                task.setTaskID(rs.getInt("TaskID"));
                task.setTaskName(rs.getString("TaskName"));
                task.setTaskDescription(rs.getString("TaskDescription"));
                task.setStatus(rs.getString("Status"));
                task.setDueDate(rs.getString("DueDate"));
                task.setTaskCreatedAt(rs.getTimestamp("TaskCreatedAt"));
                task.setTaskUpdatedAt(rs.getTimestamp("TaskUpdatedAt"));
                task.setUserID(rs.getInt("UserID"));
                task.setCategoryID(rs.getInt("CategoryID"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return task;
    }
}
