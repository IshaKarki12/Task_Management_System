package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import model.User;
import util.DBUtil;
import util.PasswordUtil;

public class UserDAO {

    // Register user with hashed password
    public boolean registerUser(String userName, String email, String password, String phoneNo, int roleID) {
        boolean success = false;

        String hashedPassword = PasswordUtil.hashPassword(password);

        String sql = "INSERT INTO user (UserName, Email, Password, PhoneNo, RoleID) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, userName);
            stmt.setString(2, email);
            stmt.setString(3, hashedPassword);
            stmt.setString(4, phoneNo);
            stmt.setInt(5, roleID);

            int rows = stmt.executeUpdate();
            success = rows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return success;
    }

    // Login check using hashed password
    public User validateLogin(String email, String password) {
        User user = null;

        String sql = "SELECT * FROM user WHERE Email = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String storedHashedPassword = rs.getString("Password");

                if (PasswordUtil.checkPassword(password, storedHashedPassword)) {
                    user = new User();
                    user.setUserID(rs.getInt("UserID"));
                    user.setUserName(rs.getString("UserName"));
                    user.setEmail(rs.getString("Email"));
                    user.setPhoneNo(rs.getString("PhoneNo"));
                    user.setRoleID(rs.getInt("RoleID"));
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }
    public List<User> getUsersByRoleID(int roleID) {
        List<User> users = new ArrayList<>();
        try (Connection conn = DBUtil.getConnection()) {
            String sql = "SELECT * FROM User WHERE RoleID = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, roleID);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setUserID(rs.getInt("UserID"));
                user.setUserName(rs.getString("UserName"));
                user.setEmail(rs.getString("Email"));
                user.setPhoneNo(rs.getString("PhoneNo"));
                user.setRoleID(rs.getInt("RoleID"));
                users.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return users;
    }

 // Get user by ID
    public User getUserById(int userID) {
        String sql = "SELECT * FROM user WHERE UserID = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, userID);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                User user = new User();
                user.setUserID(rs.getInt("UserID"));
                user.setUserName(rs.getString("UserName"));
                user.setEmail(rs.getString("Email"));
                user.setPhoneNo(rs.getString("PhoneNo"));
                user.setRoleID(rs.getInt("RoleID"));
                return user;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


    public boolean updateUser(User user) {
        String sql = "UPDATE user SET UserName = ?, Email = ?, PhoneNo = ?, RoleID = ? WHERE UserID = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, user.getUserName());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getPhoneNo());
            stmt.setInt(4, user.getRoleID());
            stmt.setInt(5, user.getUserID());

            int rows = stmt.executeUpdate();
            return rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
 // Method to delete a user
    public boolean deleteUser(int userId) {
        String sql = "DELETE FROM User WHERE UserID = ?";
        
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, userId);
            int rowsAffected = stmt.executeUpdate();

            return rowsAffected > 0; // returns true if a user was deleted

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false; // return false if deletion failed
    }
    public static boolean updateUserProfile(User user) {
        String sql = "UPDATE User SET UserName = ?, Email = ?, PhoneNo = ?, UpdatedAt = CURRENT_TIMESTAMP WHERE UserID = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, user.getUserName());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getPhoneNo());
            stmt.setInt(4, user.getUserID());

            int rows = stmt.executeUpdate();
            return rows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        String sql = "SELECT * FROM User";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                User user = new User();
                user.setUserID(rs.getInt("UserID"));
                user.setUserName(rs.getString("UserName"));
                user.setEmail(rs.getString("Email"));
                users.add(user);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return users;
    }


} 