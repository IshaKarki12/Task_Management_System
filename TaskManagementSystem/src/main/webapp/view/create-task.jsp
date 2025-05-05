<%@ page import="java.util.*, model.Category, dao.CategoryDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Category> categories = new CategoryDAO().getAllCategories();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Task</title>
    <link rel="stylesheet" href="../css/style.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: #f4f7f6;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            flex-direction: column;
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
            font-size: 28px;
            text-align: center;
        }

        form {
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 600px;
            margin-top: 20px;
        }

        label {
            font-size: 16px;
            color: #555;
            margin-bottom: 5px;
            display: block;
        }

        input[type="text"], input[type="date"], select, textarea {
            width: 100%;
            padding: 12px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 16px;
            box-sizing: border-box;
            transition: border 0.3s ease;
        }

        input[type="text"]:focus, input[type="date"]:focus, select:focus, textarea:focus {
            border-color: #4CAF50;
            outline: none;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            font-size: 18px;
            cursor: pointer;
            padding: 14px;
            width: 100%;
            border-radius: 6px;
            transition: background-color 0.3s, transform 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
            transform: translateY(-2px);
        }

        input[type="submit"]:active {
            background-color: #388e3c;
            transform: translateY(0);
        }

        .back-link {
            text-decoration: none;
            color: #4CAF50;
            font-size: 18px;
            display: inline-flex;
            align-items: center;
            position: fixed;
            top: 20px;
            left: 20px;
            z-index: 1000;
            transition: color 0.3s;
        }

        .back-link::before {
            content: '←';
            margin-right: 8px;
            font-size: 22px;
            transition: transform 0.3s;
        }

        .back-link:hover::before {
            transform: translateX(-4px);
        }

        .back-link::after {
            content: ''; /* remove right arrow */
        }

        .back-link:hover {
            color: #45a049;
        }
    </style>
</head>
<body>
    <a href="user-dashboard.jsp" class="back-link">Back to Dashboard</a>
    <div>
        <h2>Create New Task</h2>
        <form action="../CreateTaskServlet" method="post">
            <label for="taskName">Task Name</label>
            <input type="text" id="taskName" name="taskName" placeholder="Enter Task Name" required><br>

            <label for="taskDescription">Task Description</label>
            <textarea id="taskDescription" name="taskDescription" placeholder="Describe the task" rows="4" cols="50"></textarea><br>

            <label for="category">Task Category</label>
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

            <label for="dueDate">Due Date</label>
            <input type="date" id="dueDate" name="dueDate" required><br>

            <label for="status">Task Status</label>
            <select id="status" name="status" required>
                <option value="Pending">Pending</option>
                <option value="In Progress">In Progress</option>
                <option value="Completed">Completed</option>
            </select><br>

            <input type="submit" value="Create Task">
        </form>
    </div>
</body>
</html>
