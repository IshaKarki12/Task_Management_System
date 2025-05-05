<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="model.User" %>
<%@ page import="dao.UserDAO" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Users</title>
    <style>
        /* your CSS styles remain unchanged */
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f8f8;
            padding: 20px;
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
        }
        .table-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
            font-size: 14px;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        a.button {
            padding: 8px 16px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s;
        }
        a.button:hover {
            background-color: #45a049;
        }
        .action-buttons a {
            margin-right: 10px;
        }
        .btn {
            display: inline-block;
            padding: 12px 24px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            transition: background-color 0.3s ease;
            border: none;
        }
        .btn:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h2>Manage Users</h2>
    <a href="add-user.jsp" class="btn">Add User</a>

    <div class="table-container">
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    UserDAO userDAO = new UserDAO();
                    List<User> userList = userDAO. getUsersByRoleID(2); // Only users with roleID = 2 (not admins)

                    if (userList != null && !userList.isEmpty()) {
                        for (User user : userList) {
                %>
                    <tr>
                        <td><%= user.getUserID() %></td>
                        <td><%= user.getUserName() %></td>
                        <td><%= user.getEmail() %></td>
                        <td class="action-buttons">
                             <a href="edit-user.jsp?userID=<%= user.getUserID() %>" class="button" style="background-color: #4CAF50;">Edit</a>
                            <a href="../DeleteUserServlet?id=<%= user.getUserID() %>" class="button" style="background-color: #f44336;">Delete</a>
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
    </div>
</body>
</html>
