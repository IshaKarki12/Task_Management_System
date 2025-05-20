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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Task</title>
    <link rel="stylesheet" href="../css/style.css">
    <style>
        /* Resetting defaults for more control */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background: linear-gradient(135deg, #a1c4fd, #c2e9fb);
            font-family: 'Poppins', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }

        .container {
            background: #fff;
            border-radius: 20px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 700px;
            padding: 40px;
            transform: translateY(10px);
            transition: all 0.3s ease-in-out;
        }

        .container:hover {
            transform: translateY(-5px);
        }

        h2 {
            font-size: 32px;
            color: #4e73df;
            text-align: center;
            margin-bottom: 30px;
            font-weight: 600;
        }

        label {
            font-size: 16px;
            color: #333;
            margin-bottom: 8px;
            display: block;
        }

        input[type="text"],
        input[type="date"],
        textarea,
        select {
            width: 100%;
            padding: 15px;
            font-size: 16px;
            margin: 8px 0 20px;
            border: 1px solid #ddd;
            border-radius: 10px;
            background-color: #f9f9f9;
            transition: border 0.3s ease-in-out, background-color 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="date"]:focus,
        textarea:focus,
        select:focus {
            border: 1px solid #4e73df;
            background-color: #ffffff;
            outline: none;
        }

        input[type="submit"] {
            background-color: #4e73df;
            color: white;
            font-size: 18px;
            padding: 15px;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.3s ease-in-out;
        }

        input[type="submit"]:hover {
            background-color: #375aab;
        }

        .back-link {
            display: inline-block;
            background-color: #6c757d;
            color: white;
            padding: 12px 20px;
            text-decoration: none;
            border-radius: 10px;
            text-align: center;
            width: 100%;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .back-link:hover {
            background-color: #5a6268;
        }

        .error-message {
            background-color: #f8d7da;
            color: #721c24;
            font-size: 16px;
            padding: 10px;
            margin-top: 20px;
            border-radius: 10px;
            text-align: center;
        }

        /* Smooth animation for form focus */
        input[type="text"]:focus,
        input[type="date"]:focus,
        textarea:focus {
            border-color: #4e73df;
            background-color: #fff;
            transition: all 0.4s ease;
        }

        textarea {
            resize: none;
        }

    </style>
</head>
<body>
    <div class="container">
        <h2>Edit Task</h2>
        <form action="../EditTaskServlet" method="post">
            <input type="hidden" name="taskID" value="<%= task.getTaskID() %>">
            
            <label for="taskName">Task Name</label>
            <input type="text" id="taskName" name="taskName" value="<%= task.getTaskName() %>" required>

            <label for="taskDescription">Task Description</label>
            <textarea id="taskDescription" name="taskDescription" rows="5" required><%= task.getTaskDescription() %></textarea>

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

        <a href="my-tasks.jsp" class="back-link">Back to My Tasks</a>
    </div>
</body>
</html>
