<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, model.User, dao.UserDAO, model.Category, dao.CategoryDAO" %>
<%
    List<User> userList = UserDAO.getAllUsers(); // You’ll create this method in DAO
%>
<% List<Category> categories = new CategoryDAO().getAllCategories();%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Task</title>
    <style>
        body { font-family: Arial; background: #f4f4f4; }
        .form-container {
            width: 400px;
            margin: 40px auto;
            padding: 20px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        input, select, textarea {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        input[type=submit] {
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
        }
        input[type=submit]:hover {
            background-color: #45a049;
        }
         footer {
            font-size: 14px;
            color: #555;
            margin-top: 40px;
            text-align: center;
            width: 100%;
            font-style: italic;
        }

    </style>
</head>
<body>
<div class="form-container">
    <h2>Assign Task to User</h2>
    <form action="${pageContext.request.contextPath}/AddTaskServlet" method="post">
        <label>Task Name:</label>
        <input type="text" name="taskName" required>

        <label>Description:</label>
        <textarea name="taskDescription" required></textarea>

        <label>Due Date:</label>
        <input type="date" name="dueDate" required>

        <label>Status:</label>
        <select name="status">
            <option value="Pending">Pending</option>
            <option value="In Progress">In Progress</option>
            <option value="Completed">Completed</option>
        </select>

        <label>Assign To:</label>
        <select name="userID" required>
            <option value="">-- Select User --</option>
            <% for(User user : userList) { %>
                <option value="<%= user.getUserID() %>">
                    <%= user.getUserName() %> - <%= user.getEmail() %>
                </option>
            <% } %>
            
        </select>
        <label>Category:</label>
        <select id="category" name="categoryId" required>
                <option value="" disabled selected>Select Category</option>
                <% 
                    for (Category cat : categories) { 
                %>
                    <option value="<%= cat.getId() %>"><%= cat.getName() %></option>
                <% 
                    } 
                %>
            </select><br>

        <input type="submit" value="Add Task">
    </form>
</div>
</body>
</html>
