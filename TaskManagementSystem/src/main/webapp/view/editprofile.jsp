<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.User" %>
<%@ page session="true" %>
<%
    User currentUser = (User) session.getAttribute("currentUser");
    if (currentUser == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f4f4;
        }
        .form-container {
            width: 400px;
            margin: 60px auto;
            padding: 25px;
            background: white;
            border-radius: 10px;
            box-shadow: 0px 0px 8px rgba(0,0,0,0.1);
        }
        .form-container h2 {
            text-align: center;
            margin-bottom: 25px;
        }
        .form-container input[type="text"],
        .form-container input[type="email"],
        .form-container input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin: 12px 0;
            border: 1px solid #ccc;
            border-radius: 6px;
        }
        .form-container input[type="submit"] {
            background-color: #3498db;
            color: white;
            cursor: pointer;
        }
        .form-container input[type="submit"]:hover {
            background-color: #2980b9;
        }
        .back-link {
    display: inline-block;
    padding: 10px 20px;
    background-color: #2c3e50;
    color: white;
    text-decoration: none;
    font-size: 15px;
    font-weight: 500;
    border-radius: 8px;
    transition: background-color 0.3s ease;
}

.back-link:hover {
    background-color: #34495e;
}
        
    </style>
</head>
<body>

<div class="form-container">
    <h2>Edit Profile</h2>
    <form action="<%= request.getContextPath() %>/EditProfileServlet" method="post">
        <label>Username:</label>
        <input type="text" name="username" value="<%= currentUser.getUserName() %>" required />

        <label>Email:</label>
        <input type="email" name="email" value="<%= currentUser.getEmail() %>" required />

        <label>Phone Number:</label>
        <input type="text" name="phone" value="<%= currentUser.getPhoneNo() %>" />

        <input type="submit" value="Update Profile" />
    </form>
    <!-- Back to Dashboard link -->
    <div style="text-align: center; margin-top: 20px;">
        <a href="user-dashboard.jsp" class="back-link">⬅ Back to Dashboard</a>
    </div>
</div>

</body>
</html>
