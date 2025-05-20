<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.User" %>
<%
    User loggedUser = (User) session.getAttribute("currentUser");
    if (loggedUser == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Dashboard</title>
    <link rel="stylesheet" href="../css/style.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f4f4f4;
            color: #333;
            line-height: 1.6;
        }

        /* Navbar Styling */
        .navbar {
            background-color: #333;
            padding: 20px;
            position: sticky;
            top: 0;
            z-index: 100;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
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
            padding: 12px 20px;
            border-radius: 4px;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .navbar a:hover {
            background-color: #007bff;
            transform: translateY(-2px);
        }

        /* Hero Section */
        .hero {
            text-align: center;
            padding: 60px 20px;
            background: #0056b3;
            color: #fff;
            border-radius: 10px;
            margin-bottom: 40px;
        }

        .hero h1 {
            font-size: 48px;
            font-weight: bold;
            margin-bottom: 15px;
        }

        .hero p {
            font-size: 20px;
            margin-bottom: 20px;
            color: #ddd;
        }

        .hero button {
            background-color: #007bff;
            border: none;
            padding: 12px 30px;
            color: white;
            font-size: 16px;
            border-radius: 30px;
            cursor: pointer;
            transition: 0.3s;
        }

        .hero button:hover {
            background-color: #0056b3;
        }

        /* Container Styling */
        .container {
            max-width: 1200px;
            margin: 40px auto;
            padding: 0 20px;
        }

        h2 {
            margin-bottom: 20px;
            font-size: 32px;
            font-weight: 700;
            text-align: center;
            color: #333;
        }

        /* Card Section */
        .card {
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            padding: 30px;
            margin-bottom: 20px;
            transition: all 0.3s ease;
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.2);
        }

        .card-header {
            font-size: 24px;
            font-weight: 600;
            color: #333;
            margin-bottom: 20px;
        }

        .card-body {
            font-size: 18px;
            color: #333;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .card-body div {
            padding: 20px;
            background: #f7f7f7;
            border-radius: 8px;
        }

        /* Profile Card Styling */
        .profile-card {
            background: #fff;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            transition: 0.3s ease;
        }

        .profile-card:hover {
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
        }

        .profile-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }

        .profile-header h3 {
            font-size: 28px;
            color: #0056b3;
            font-weight: 600;
        }

        .profile-header a {
            text-decoration: none;
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .profile-header a:hover {
            background-color: #0056b3;
        }

        .profile-info {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 30px;
        }

        .profile-info table {
            width: 100%;
            border-collapse: collapse;
        }

        .profile-info th,
        .profile-info td {
            padding: 18px;
            text-align: left;
            border-bottom: 1px solid #eaeaea;
            color: #333;
        }

        .profile-info th {
            background-color: #f2f2f2;
            color: #555;
        }

        .profile-info td {
            background-color: #fafafa;
        }

        /* Footer Styling */
        footer {
            background-color: #333;
            text-align: center;
            padding: 30px 0;
            margin-top: 50px;
            font-size: 14px;
            color: #ddd;
        }

        footer a {
            color: #007bff;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s ease;
        }

        footer a:hover {
            color: #fff;
        }

        /* Responsive Styling */
        @media (max-width: 768px) {
            .profile-info {
                grid-template-columns: 1fr;
            }

            .navbar ul {
                flex-direction: column;
                gap: 15px;
            }
        }
         footer {
            font-size: 14px;
            color: white;
            margin-top: 40px;
            text-align: center;
            width: 100%;
            font-style: italic;
        }

        footer a {
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
        }

        footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<div class="navbar">
    <ul>
        <li><a href="my-tasks.jsp">My Tasks</a></li>
        <li><a href="create-task.jsp">Create Task</a></li>
        <li><a href="../LogoutServlet">Logout</a></li>
    </ul>
</div>

<!-- Hero Section -->
<div class="hero">
    <h1>Welcome back, <%= loggedUser.getUserName() %>!</h1>
    <p>Your tasks are waiting. Stay organized and on top of things.</p>
    <button onclick="window.location.href='my-tasks.jsp'">View My Tasks</button>
</div>

<!-- Main Container -->
<div class="container">
    <h2>Dashboard</h2>

    <!-- Profile Card -->
    <div class="profile-card">
        <div class="profile-header">
            <h3>Your Profile</h3>
            <a href="editprofile.jsp">Edit Profile</a>
        </div>

        <div class="profile-info">
            <table>
                <tr>
                    <th>Full Name</th>
                    <td><%= loggedUser.getUserName() %></td>
                </tr>
                <tr>
                    <th>Email</th>
                    <td><%= loggedUser.getEmail() %></td>
                </tr>
                <tr>
                    <th>Phone Number</th>
                    <td><%= loggedUser.getPhoneNo() %></td>
                </tr>
                <tr>
                    <th>Role</th>
                    <td><%= loggedUser.getRoleID() == 1 ? "Admin" : "User" %></td>
                </tr>
            </table>
        </div>
    </div>

    <!-- User Tips Section -->
    <div class="card">
        <div class="card-header">User Tips</div>
        <div class="card-body">
            <div>
                <h4>Stay Organized</h4>
                <p>Keep track of your tasks and set reminders for important deadlines.</p>
            </div>
            <div>
                <h4>Prioritize Tasks</h4>
                <p>Focus on high-priority tasks first to ensure efficiency.</p>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<footer>
      <p>&copy; 2025 DoTask. All Rights Reserved. | <a href="about-us.jsp">About Us</a> | <a href="contact-us.jsp">Contact Us</a></p>
</footer>

</body>
</html>
