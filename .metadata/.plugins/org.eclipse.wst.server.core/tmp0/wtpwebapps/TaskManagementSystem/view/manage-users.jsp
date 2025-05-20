<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="model.User" %>
<%@ page import="dao.UserDAO" %>
<%
    UserDAO userDAO = new UserDAO();
    List<User> userList = userDAO.getUsersByRoleID(2); // Only users with roleID = 2 (not admins)
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Users</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #e3f2fd, #ffffff);
            padding: 60px 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        h2 {
            font-size: 36px;
            font-weight: 600;
            color: #0d47a1;
            margin-bottom: 35px;
            text-shadow: 1px 1px 2px rgba(0,0,0,0.1);
        }

        .add-user {
            padding: 14px 28px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            font-size: 16px;
            font-weight: 500;
            border-radius: 10px;
            transition: background-color 0.3s ease;
            box-shadow: 0 4px 12px rgba(0,0,0,0.2);
            margin-bottom: 30px;
        }

        .add-user:hover {
            background-color: #388e3c;
        }

        .user-table {
            width: 95%;
            max-width: 1000px;
            border-collapse: separate;
            border-spacing: 0 16px;
        }

        thead {
            background-color: #1565c0;
            color: #fff;
            border-radius: 12px;
        }

        th {
            padding: 18px 22px;
            text-align: center;
            font-size: 16px;
            font-weight: 500;
        }

        td {
            padding: 18px 22px;
            text-align: center;
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.06);
            transition: transform 0.2s ease;
        }

        tbody tr {
            transition: all 0.3s ease;
        }

        tbody tr:hover td {
            background-color: #e3f2fd;
            transform: scale(1.01);
        }

        .button {
            padding: 10px 18px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
            display: inline-block;
        }

        .btn-edit {
            background-color: #1976d2;
            color: #fff;
        }

        .btn-edit:hover {
            background-color: #0d47a1;
        }

        .btn-delete {
            background-color: #ef5350;
            color: #fff;
            margin-left: 10px;
        }

        .btn-delete:hover {
            background-color: #c62828;
        }

        .back-link {
            margin-top: 40px;
            padding: 14px 28px;
            background-color: #263238;
            color: white;
            text-decoration: none;
            font-size: 16px;
            font-weight: 500;
            border-radius: 10px;
            transition: all 0.3s ease;
            box-shadow: 0 4px 12px rgba(0,0,0,0.2);
        }

        .back-link:hover {
            background-color: #37474f;
        }

        td[colspan="4"] {
            font-style: italic;
            color: #888;
        }

    </style>
</head>
<body>

    <h2>👤 Manage Users</h2>

    <a href="add-user.jsp" class="add-user">➕ Add New User</a>

    <table class="user-table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Username</th>
                <th>Email</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                if (userList != null && !userList.isEmpty()) {
                    for (User user : userList) {
            %>
                <tr>
                    <td><%= user.getUserID() %></td>
                    <td><%= user.getUserName() %></td>
                    <td><%= user.getEmail() %></td>
                    <td>
                        <a href="edit-user.jsp?userID=<%= user.getUserID() %>" class="button btn-edit">Edit</a>
                        <a href="../DeleteUserServlet?id=<%= user.getUserID() %>" class="button btn-delete" onclick="return confirm('Are you sure you want to delete this user?');">Delete</a>
                    </td>
                </tr>
            <%
                    }
                } else {
            %>
                <tr>
                    <td colspan="4">No users found.</td>
                </tr>
            <%
                }
            %>
        </tbody>
    </table>

    <a href="admin-dashboard.jsp" class="back-link">⬅ Back to Dashboard</a>

</body>
</html>
