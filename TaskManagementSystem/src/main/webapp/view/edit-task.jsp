<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            task = taskDAO.getTaskById(taskId); // make sure you have this method
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
        /* Add your CSS styling here */
    </style>
</head>
<body>
    <div class="container">
        <h2>Edit Task</h2>
        <form action="../EditTaskServlet" method="post">
            <!-- Hidden field to pass the taskID -->
            <input type="hidden" name="taskID" value="<%= task.getTaskID() %>">
            
            <label for="taskName">Task Name</label>
            <input type="text" id="taskName" name="taskName" value="<%= task.getTaskName() %>" required><br>

            <label for="taskDescription">Task Description</label>
            <textarea id="taskDescription" name="taskDescription" rows="4" required><%= task.getTaskDescription() %></textarea><br>

            <label for="dueDate">Due Date</label>
            <input type="date" id="dueDate" name="dueDate" value="<%= task.getDueDate() %>" required><br>

            <label for="status">Status</label>
            <select name="status" id="status" required>
                <option value="Pending" <%= "Pending".equals(task.getStatus()) ? "selected" : "" %>>Pending</option>
                <option value="In Progress" <%= "In Progress".equals(task.getStatus()) ? "selected" : "" %>>In Progress</option>
                <option value="Completed" <%= "Completed".equals(task.getStatus()) ? "selected" : "" %>>Completed</option>
            </select><br>

            <input type="submit" value="Update Task">
        </form>
        
        <a href="my-tasks.jsp" class="back-link">Back to My Tasks</a>
    </div>
</body>
</html>
