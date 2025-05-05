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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Tasks</title>
    <link rel="stylesheet" href="../css/style.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: #f4f7f6;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
        }

        h2 {
            color: #333;
            margin-top: 30px;
        }

        table {
            width: 80%;
            max-width: 900px;
            border-collapse: collapse;
            margin: 20px auto;
            background-color: #ffffff;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        th, td {
            padding: 12px 20px;
            text-align: center;
            border: 1px solid #ddd;
            color: #333;
        }

        th {
            background-color: #4CAF50;
            color: white;
            font-size: 16px;
        }

        td {
            font-size: 14px;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
            cursor: pointer;
        }

        button {
            background-color: #007BFF;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
        }

        button:hover {
            background-color: #0056b3;
            transform: translateY(-2px);
        }

        button:active {
            background-color: #004080;
            transform: translateY(0);
        }

        .back-link {
            margin-top: 30px;
            text-decoration: none;
            background-color: #333;
            color: white;
            padding: 10px 20px;
            border-radius: 6px;
            font-size: 14px;
        }

        .back-link:hover {
            background-color: #555;
        }
    </style>
</head>
<body>
    <h2>My Task List</h2>
    <%
    String msg = request.getParameter("msg");
    if ("deleted".equals(msg)) {
%>
    <p style="color: green;">Task deleted successfully!</p>
<%
    } else if ("notdeleted".equals(msg)) {
%>
    <p style="color: red;">Failed to delete the task.</p>
<%
    }
%>
    <table>
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
        <a href="edit-task.jsp?taskId=<%= task.getTaskID() %>">Edit</a>
        
        <a href="../DeleteTaskServlet?taskId=<%= task.getTaskID() %>" onclick="return confirm('Are you sure you want to delete this task?');">
    Delete
</a>
            
        </td>
    </tr>
<% } %>

<% if (taskList.isEmpty()) { %>
    <tr>
        <td colspan="4">No tasks found.</td>
    </tr>
<% } %>
</tbody>
    </table>
    
    <a href="user-dashboard.jsp" class="back-link">Back to Dashboard</a>

    <script>
        // Function to navigate to the edit task page
        function editTask(taskId) {
            // Assuming the edit page has a query parameter for the task ID
            window.location.href = `edit-task.jsp?taskId=${taskId}`;
        }
    </script>
</body>
</html>
