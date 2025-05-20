<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Task" %>
<%@ page import="dao.TaskDAO" %>

<%
    String taskIdParam = request.getParameter("taskId");
    Task task = null;

    if (taskIdParam != null && !taskIdParam.isEmpty()) {
        try {
            int taskId = Integer.parseInt(taskIdParam);
            TaskDAO taskDAO = new TaskDAO();
            task = taskDAO.getTaskById(taskId);
        } catch (Exception e) {
            out.println("<h3>Error: Invalid task ID.</h3>");
            return;
        }
    }

    if (task == null) {
        out.println("<h3>Error: Task not found.</h3>");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Task</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #eef2f7;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
            margin: 50px auto;
            background-color: white;
            padding: 35px 40px;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }

        label {
            font-weight: 600;
            display: block;
            margin-bottom: 8px;
            color: #444;
        }

        input[type="text"],
        input[type="date"],
        textarea,
        select {
            width: 100%;
            padding: 10px 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
            transition: 0.3s border-color ease;
        }

        input[type="text"]:focus,
        input[type="date"]:focus,
        textarea:focus,
        select:focus {
            border-color: #007bff;
            outline: none;
        }

        textarea {
            resize: vertical;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: white;
            padding: 12px;
            width: 100%;
            font-size: 16px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #555;
            text-decoration: none;
            font-size: 14px;
        }

        .back-link:hover {
            color: #000;
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Edit Task</h2>
        <form action="../AdminEditTaskServlet" method="post">
            <input type="hidden" name="taskID" value="<%= task.getTaskID() %>">

            <label for="taskName">Task Name</label>
            <input type="text" id="taskName" name="taskName" value="<%= task.getTaskName() %>" required>

            <label for="taskDescription">Task Description</label>
            <textarea id="taskDescription" name="taskDescription" rows="4" required><%= task.getTaskDescription() %></textarea>

            <label for="dueDate">Due Date</label>
            <input type="date" id="dueDate" name="dueDate" value="<%= task.getDueDate() %>" required>

            <label for="status">Status</label>
            <select name="status" id="status" required>
                <option value="Pending" <%= "Pending".equals(task.getStatus()) ? "selected" : "" %>>Pending</option>
                <option value="In Progress" <%= "In Progress".equals(task.getStatus()) ? "selected" : "" %>>In Progress</option>
                <option value="Completed" <%= "Completed".equals(task.getStatus()) ? "selected" : "" %>>Completed</option>
            </select>

            <input type="submit" value="Update Task">
        </form>

        <a href="manage-tasks.jsp" class="back-link">← Back to Tasks List</a>
    </div>
</body>
</html>
