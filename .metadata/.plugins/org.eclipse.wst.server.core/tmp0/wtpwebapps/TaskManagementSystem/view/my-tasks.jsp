<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, model.Task, dao.TaskDAO" %>
<%
    Integer userId = (Integer) session.getAttribute("currentUserID");
    if (userId == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    TaskDAO taskDAO = new TaskDAO();
    List<Task> taskList = taskDAO.getTasksByUserId(userId);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Tasks</title>
    <link rel="stylesheet" href="../css/style.css">
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

        .task-table {
            width: 95%;
            max-width: 1100px;
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

        .btn {
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

        .message {
            background-color: #c8e6c9;
            color: #256029;
            border: 1px solid #a5d6a7;
            padding: 12px 24px;
            border-radius: 10px;
            margin-bottom: 30px;
            text-align: center;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
            font-size: 15px;
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

    <h2>📋 My Task List</h2>

    <% String msg = request.getParameter("msg"); %>
    <% if ("deleted".equals(msg)) { %>
        <div class="message">✅ Task deleted successfully!</div>
    <% } %>

    <table class="task-table">
        <thead>
            <tr>
                <th>Task Name</th>
                <th>Status</th>
                <th>Due Date</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
        <% for (Task task : taskList) { %>
            <tr>
                <td><%= task.getTaskName() %></td>
                <td><%= task.getStatus() %></td>
                <td><%= task.getDueDate() %></td>
                <td>
                    <a href="edit-task.jsp?taskId=<%= task.getTaskID() %>" class="btn btn-edit">Edit</a>
                    <a href="../DeleteTaskServlet?taskId=<%= task.getTaskID() %>" class="btn btn-delete" onclick="return confirm('Are you sure you want to delete this task?');">Delete</a>
                </td>
            </tr>
        <% } %>

        <% if (taskList.isEmpty()) { %>
            <tr>
                <td colspan="4">No tasks found. You're all caught up! 🎉</td>
            </tr>
        <% } %>
        </tbody>
    </table>

    <a href="user-dashboard.jsp" class="back-link">⬅ Back to Dashboard</a>

</body>
</html>
