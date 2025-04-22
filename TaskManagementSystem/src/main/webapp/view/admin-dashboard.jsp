<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="../css/style.css">
    <style>
        /* Reset and base styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f0f4f8;
            color: #333;
            line-height: 1.6;
        }

        .navbar {
            background-color: #0077cc;
            padding: 15px 30px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            position: sticky;
            top: 0;
            z-index: 100;
        }

        .navbar ul {
            list-style: none;
            display: flex;
            justify-content: flex-end;
            gap: 20px;
        }

        .navbar a {
            text-decoration: none;
            color: #fff;
            padding: 8px 16px;
            border-radius: 6px;
            transition: background 0.2s;
            font-weight: bold;
        }

        .navbar a:hover {
            background-color: #005fa3;
        }

        .container {
            max-width: 1100px;
            margin: 40px auto;
            padding: 0 20px;
        }

        h2 {
            margin-bottom: 20px;
            font-size: 28px;
        }

        .profile-card {
            background: #fff;
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.05);
            margin-bottom: 40px;
        }

        .profile-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .profile-header h3 {
            font-size: 22px;
            color: #0077cc;
        }

        .profile-header a {
            text-decoration: none;
            background-color: #0077cc;
            color: white;
            padding: 8px 16px;
            border-radius: 6px;
            transition: background 0.2s;
        }

        .profile-header a:hover {
            background-color: #005fa3;
        }

        .profile-content {
            display: flex;
            align-items: flex-start;
            gap: 30px;
            flex-wrap: wrap;
        }

        .profile-picture {
            min-width: 100px;
            max-width: 120px;
        }

        .profile-picture img {
            width: 100%;
            height: auto;
            border-radius: 50%;
            border: 3px solid #0077cc;
        }

        .profile-info {
            flex: 1;
        }

        .profile-info table {
            width: 100%;
            border-collapse: collapse;
        }

        .profile-info th,
        .profile-info td {
            padding: 12px;
            text-align: left;
        }

        .profile-info th {
            background-color: #e9f3fc;
            color: #444;
            width: 150px;
        }

        .profile-info td {
            background-color: #fdfdfd;
        }

        footer {
            text-align: center;
            padding: 20px;
            margin-top: 40px;
            font-size: 14px;
            color: #777;
        }

        footer a {
            color: #444;
            text-decoration: none;
        }

        footer a:hover {
            color: #0072ff;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<div class="navbar">
    <ul>
        <li><a href="manage-users.jsp">Manage Users</a></li>
        <li><a href="manage-tasks.jsp">Manage Tasks</a></li>
        <li><a href="../LogoutServlet">Logout</a></li>
    </ul>
</div>

<!-- Main Container -->
<div class="container">
    <h2>Welcome to the Admin Dashboard</h2>

    <!-- Profile Card -->
    <div class="profile-card">
        <div class="profile-header">
            <h3>Admin Profile</h3>
            <a href="edit-profile.jsp">Edit</a>
        </div>
        <div class="profile-content">
            <div class="profile-picture">
                <img src="images/default-profile.png" alt="Profile Pic">
            </div>
            <div class="profile-info">
                <table>
                    <tr>
                        <th>Name</th>
                        <td>Admin User</td>
                    </tr>
                    <tr>
                        <th>Email</th>
                        <td>admin@example.com</td>
                    </tr>
                    <tr>
                        <th>Phone</th>
                        <td>Mobile Number</td>
                    </tr>
                    <tr>
                        <th>Role</th>
                        <td>Admin</td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<footer>
    <p>&copy; 2025 DoTask. All rights reserved. | <a href="#">Privacy Policy</a></p>
</footer>

</body>
</html>
