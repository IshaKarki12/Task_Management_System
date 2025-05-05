package dao;

import model.Task;
import model.User;
import util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TaskDAO {

    // Method to create a new task
    public boolean createTask(Task task) {
        String query = "INSERT INTO task (TaskName, TaskDescription, Status, DueDate, UserID, CategoryID) " +
                       "VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, task.getTaskName());
            stmt.setString(2, task.getTaskDescription());
            stmt.setString(3, task.getStatus());
            stmt.setDate(4, task.getDueDate());
            stmt.setInt(5, task.getUserID());
            stmt.setInt(6, task.getCategoryID());

            int rowsAffected = stmt.executeUpdate();

            return rowsAffected > 0; // Return true if a task was inserted successfully

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
 // Fetch tasks for a specific user
    public List<Task> getTasksByUserId(int userId) {
        List<Task> tasks = new ArrayList<>();

        String sql = "SELECT TaskID, TaskName, Status, DueDate FROM Task WHERE UserID = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Task task = new Task();
                task.setTaskID(rs.getInt("TaskID"));
                task.setTaskName(rs.getString("TaskName"));
                task.setStatus(rs.getString("Status"));
                task.setDueDate(rs.getDate("DueDate"));
                tasks.add(task);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return tasks;
    }
   
       
    public Task getTaskById(int id) {
        String sql = "SELECT * FROM Task WHERE TaskID = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                Task task = new Task();
                task.setTaskID(rs.getInt("TaskID"));
                task.setTaskName(rs.getString("TaskName"));
                task.setTaskDescription(rs.getString("TaskDescription"));
                task.setStatus(rs.getString("Status"));
                task.setDueDate(rs.getDate("DueDate"));
            ;
                task.setUserID(rs.getInt("UserID"));
                return task;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


    

    public boolean updateTask(Task task) {
        String sql = "UPDATE Task SET TaskName = ?, TaskDescription = ?, Status = ?, DueDate = ?, TaskUpdatedAt = NOW() WHERE TaskID = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, task.getTaskName());
            stmt.setString(2, task.getTaskDescription());
            stmt.setString(3, task.getStatus());
            stmt.setDate(4, task.getDueDate());
            stmt.setInt(5, task.getTaskID());

            int rows = stmt.executeUpdate();
            return rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteTask(int taskId) {
        String sql = "DELETE FROM Task WHERE TaskID = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, taskId);
            int rows = stmt.executeUpdate();
            return rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Task> getAllTasks() {
        List<Task> list = new ArrayList<>();
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement("SELECT * FROM Task")) {

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Task task = new Task();
                task.setTaskID(rs.getInt("TaskID"));
                task.setTaskName(rs.getString("TaskName"));
                task.setTaskDescription(rs.getString("TaskDescription"));
                task.setStatus(rs.getString("Status"));
                task.setDueDate(rs.getDate("DueDate"));
                
                task.setUserID(rs.getInt("UserID"));
                list.add(task);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

   
}
