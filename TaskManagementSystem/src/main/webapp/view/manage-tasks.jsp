<%@ page import="java.util.*, model.Task, dao.TaskDAO" %>
<%
    TaskDAO taskDAO = new TaskDAO();
    List<Task> taskList = taskDAO.getAllTasks(); // This fetches all tasks from DB
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Tasks</title>
    <style>
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
            background-color: #2196F3;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s;
        }
        a.button:hover {
            background-color: #1976D2;
        }
        .action-buttons a {
            margin-right: 10px;
        }
        .add-task {
            margin: 20px 0;
            display: inline-block;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 4px;
        }
        .add-task:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h2>Manage Tasks</h2>
    <a href="#" class="add-task">Add New Task</a>
    
    <div class="table-container">
        <table>
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
        <td class="action-buttons">
            <a href="admin-edit-task.jsp?taskId=<%= task.getTaskID() %>" class="button">Edit</a>
            <a href="../AdminDeleteTaskServlet?taskId=<%= task.getTaskID() %>" class="button" style="background-color: #f44336;">Delete</a>
        </td>
    </tr>
<% } %>
</tbody>
        </table>
    </div>
</body>
</html>
