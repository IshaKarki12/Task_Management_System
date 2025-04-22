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
                <tr>
                    <td>101</td>
                    <td>Design UI</td>
                    <td>Create wireframe for user dashboard</td>
                    <td>2025-04-30</td>
                    <td>In Progress</td>
                    <td class="action-buttons">
                        <a href="#" class="button">Edit</a>
                        <a href="#" class="button" style="background-color: #f44336;">Delete</a>
                    </td>
                </tr>
                <tr>
                    <td>102</td>
                    <td>Develop API</td>
                    <td>Develop user authentication API</td>
                    <td>2025-05-05</td>
                    <td>Pending</td>
                    <td class="action-buttons">
                        <a href="#" class="button">Edit</a>
                        <a href="#" class="button" style="background-color: #f44336;">Delete</a>
                    </td>
                </tr>
                <tr>
                    <td>103</td>
                    <td>Testing</td>
                    <td>Test user registration flow</td>
                    <td>2025-05-10</td>
                    <td>Completed</td>
                    <td class="action-buttons">
                        <a href="#" class="button">Edit</a>
                        <a href="#" class="button" style="background-color: #f44336;">Delete</a>
                    </td>
                </tr>
                <!-- Additional rows can be added here -->
            </tbody>
        </table>
    </div>
</body>
</html>
