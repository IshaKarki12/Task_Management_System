<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, model.Task, dao.TaskDAO" %>
<%
    TaskDAO taskDAO = new TaskDAO();
    List<Task> taskList = taskDAO.getAllTasks(); // This fetches all tasks from DB
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Tasks</title>
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

        .add-task {
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

        .add-task:hover {
            background-color: #388e3c;
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
        td[colspan="6"] {
            font-style: italic;
            color: #888;
        }

    </style>
</head>
<body>

    <h2>🛠️ Manage Tasks</h2>

    <a href="admin-add-task.jsp" class="add-task">➕ Add New Task</a>

    <table class="task-table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Task Name</th>
                <th>Description</th>
                <th>Due Date</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
        <% for(Task task : taskList) { %>
            <tr>
                <td><%= task.getTaskID() %></td>
                <td><%= task.getTaskName() %></td>
                <td><%= task.getTaskDescription() %></td>
                <td><%= task.getDueDate() %></td>
                <td><%= task.getStatus() %></td>
                <td>
                    <a href="admin-edit-task.jsp?taskId=<%= task.getTaskID() %>" class="button btn-edit">Edit</a>
                    <a href="../AdminDeleteTaskServlet?taskId=<%= task.getTaskID() %>" class="button btn-delete" onclick="return confirm('Are you sure you want to delete this task?');">Delete</a>
                </td>
            </tr>
        <% } %>

        <% if (taskList.isEmpty()) { %>
            <tr>
                <td colspan="6">No tasks found.</td>
            </tr>
        <% } %>
        </tbody>
    </table>
<a href="admin-dashboard.jsp" class="back-link">⬅ Back to Dashboard</a>
</body>
</html>
