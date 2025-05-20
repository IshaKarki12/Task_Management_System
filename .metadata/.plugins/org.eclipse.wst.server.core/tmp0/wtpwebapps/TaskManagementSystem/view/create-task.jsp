<%@ page import="java.util.*, model.Category, dao.CategoryDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Category> categories = new CategoryDAO().getAllCategories();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Create New Task</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Matching Font -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f4f7f6;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            min-height: 100vh;
            padding-top: 60px;
        }

        .container {
            background: #ffffff;
            padding: 30px 35px;
            border-radius: 10px;
            box-shadow: 0 6px 16px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 620px;
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
            font-size: 26px;
            font-weight: 500;
        }

        label {
            font-size: 15px;
            font-weight: 500;
            margin-bottom: 5px;
            display: block;
            color: #444;
        }

        input[type="text"],
        input[type="date"],
        select,
        textarea {
            width: 100%;
            padding: 12px 14px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 15px;
            margin-bottom: 20px;
            box-sizing: border-box;
            transition: border-color 0.2s;
        }

        input:focus,
        select:focus,
        textarea:focus {
            border-color: #4CAF50;
            outline: none;
        }

        textarea {
            resize: vertical;
            min-height: 100px;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: #fff;
            border: none;
            padding: 14px;
            font-size: 16px;
            border-radius: 6px;
            cursor: pointer;
            width: 100%;
            transition: background 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        .back-link {
            position: absolute;
            top: 20px;
            left: 20px;
            text-decoration: none;
            font-size: 16px;
            color: #4CAF50;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .back-link::before {
            content: "←";
            font-size: 18px;
        }

        .back-link:hover {
            color: #388e3c;
        }
    </style>
</head>
<body>

<a href="user-dashboard.jsp" class="back-link">Back to Dashboard</a>

<div class="container">
    <h2>Create New Task</h2>
    <form action="../CreateTaskServlet" method="post">
        <label for="taskName">Task Name</label>
        <input type="text" id="taskName" name="taskName" placeholder="Enter Task Name" required>

        <label for="taskDescription">Task Description</label>
        <textarea id="taskDescription" name="taskDescription" placeholder="Describe the task..."></textarea>

        <label for="category">Task Category</label>
        <select id="category" name="categoryId" required>
            <option value="" disabled selected>Select Category</option>
            <% for (Category cat : categories) { %>
                <option value="<%= cat.getId() %>"><%= cat.getName() %></option>
            <% } %>
        </select>

        <label for="dueDate">Due Date</label>
        <input type="date" id="dueDate" name="dueDate" required>

        <label for="status">Task Status</label>
        <select id="status" name="status" required>
            <option value="Pending">Pending</option>
            <option value="In Progress">In Progress</option>
            <option value="Completed">Completed</option>
        </select>

        <input type="submit" value="Create Task">
    </form>
</div>

</body>
</html>
