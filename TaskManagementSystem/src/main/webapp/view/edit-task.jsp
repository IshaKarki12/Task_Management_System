<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Task</title>
    <link rel="stylesheet" href="../css/style.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: #f7f7f7;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #333;
        }

        .container {
            background: white;
            border-radius: 8px;
            padding: 30px;
            width: 100%;
            max-width: 600px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }

        label {
            font-size: 16px;
            margin-bottom: 8px;
            display: block;
            color: #555;
        }

        input[type="text"],
        input[type="date"],
        textarea,
        select {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 6px;
            box-sizing: border-box;
            font-size: 16px;
        }

        textarea {
            resize: vertical;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 12px 20px;
            font-size: 16px;
            border-radius: 6px;
            cursor: pointer;
            width: 100%;
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
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #333;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-size: 14px;
            text-align: center;
            width: 100%;
            text-transform: uppercase;
        }

        .back-link:hover {
            background-color: #555;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Edit Task</h2>
        <form action="../EditTaskServlet" method="post">
            <!-- Assume taskID is passed as hidden input -->
            <input type="hidden" name="taskID" value="${taskID}">

            <label for="taskName">Task Name</label>
            <input type="text" id="taskName" name="taskName" value="${taskName}" required><br>

            <label for="taskDescription">Task Description</label>
            <textarea id="taskDescription" name="taskDescription" rows="4" required>${taskDescription}</textarea><br>

            <label for="dueDate">Due Date</label>
            <input type="date" id="dueDate" name="dueDate" value="${dueDate}" required><br>

            <label for="status">Status</label>
            <select name="status" id="status" required>
                <option value="Pending" ${status == 'Pending' ? 'selected' : ''}>Pending</option>
                <option value="In Progress" ${status == 'In Progress' ? 'selected' : ''}>In Progress</option>
                <option value="Completed" ${status == 'Completed' ? 'selected' : ''}>Completed</option>
            </select><br>

            <input type="submit" value="Update Task">
        </form>
        
        <a href="my-tasks.jsp" class="back-link">Back to My Tasks</a>
    </div>

</body>
</html>
