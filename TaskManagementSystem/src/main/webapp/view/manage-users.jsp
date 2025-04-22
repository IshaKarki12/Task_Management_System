<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Users</title>
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
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s;
        }
        a.button:hover {
            background-color: #45a049;
        }
        .action-buttons a {
            margin-right: 10px;
        }
        .add-user {
            margin: 20px 0;
            display: inline-block;
            padding: 10px 20px;
            background-color: #2196F3;
            color: white;
            text-decoration: none;
            border-radius: 4px;
        }
        .add-user:hover {
            background-color: #1976D2;
        }
    </style>
</head>
<body>
    <h2>Manage Users</h2>
    <a href="#" class="add-user">Add New User</a>
    
    <div class="table-container">
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td>John Doe</td>
                    <td>john.doe@example.com</td>
                    <td class="action-buttons">
                        <a href="#" class="button">Edit</a>
                        <a href="#" class="button" style="background-color: #f44336;">Delete</a>
                    </td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>Jane Smith</td>
                    <td>jane.smith@example.com</td>
                    <td class="action-buttons">
                        <a href="#" class="button">Edit</a>
                        <a href="#" class="button" style="background-color: #f44336;">Delete</a>
                    </td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>Michael Brown</td>
                    <td>michael.brown@example.com</td>
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
