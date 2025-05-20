<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add New User</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f4f6f8;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-box {
            background-color: #fff;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 400px;
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
        }

        label {
            display: block;
            margin-bottom: 6px;
            font-weight: 500;
            color: #444;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"],
        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 18px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #007bff;
            border: none;
            color: white;
            font-size: 16px;
            border-radius: 6px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .message {
            text-align: center;
            margin-top: 15px;
            font-weight: bold;
        }

        .message.success {
            color: green;
        }

        .message.error {
            color: red;
        }
         .back-link {
            margin-top: 680px;
            padding: 14px 28px;
            background-color: #263238;
            color: white;
            text-decoration: none;
            font-size: 16px;
            font-weight: 500;
            border-radius: 10px;
            transition: all 0.3s ease;
            box-shadow: 0 4px 12px rgba(0,0,0,0.2);
        }

        .back-link:hover {
            background-color: #37474f;
        }
    </style>
</head>
<body>
    <div class="form-box">
        <h2>Add New User</h2>

        <form action="<%= request.getContextPath() %>/AddUserServlet" method="post">
            <label>Username:</label>
            <input type="text" name="userName" required>

            <label>Email:</label>
            <input type="email" name="email" required>

            <label>Password:</label>
            <input type="password" name="password" required>

            <label>Phone No:</label>
            <input type="text" name="phoneNo" required>

            <label>Role:</label>
            <select name="roleID" required>
                <option value="1">Junior Admin</option>
                <option value="2">User</option>
            </select>

            <input type="submit" value="Add User">
        </form>

        <%
            String successMessage = (String) request.getAttribute("successMessage");
            String errorMessage = (String) request.getAttribute("errorMessage");

            if (successMessage != null) {
        %>
            <p class="message success"><%= successMessage %></p>
            
        <%
            }

            if (errorMessage != null) {
        %>
            <p class="message error"><%= errorMessage %></p>
        <%
            }
        %>
        <div style="text-align:center; margin-top: 20px;">
        <a href="user-dashboard.jsp" class="back-link">⬅ Back to Dashboard</a>
    </div>
    </div>
</body>
</html>
