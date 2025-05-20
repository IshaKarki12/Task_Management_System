<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.User" %>
<%@ page import="dao.UserDAO" %>
<%
    String userIDParam = request.getParameter("userID");
    User user = null;

    if (userIDParam != null && !userIDParam.isEmpty()) {
        try {
            int userID = Integer.parseInt(userIDParam);
            UserDAO dao = new UserDAO();
            user = dao.getUserById(userID);
        } catch (Exception e) {
            out.println("<h3>Error: Invalid user ID.</h3>");
            return;
        }
    }

    if (user == null) {
        out.println("<h3>Error: User not found.</h3>");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit User</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f2f4f8;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 500px;
            margin: 60px auto;
            background-color: white;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0px 0px 12px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #333;
        }

        input, select {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 15px;
        }

        button {
            width: 100%;
            background-color: #007bff;
            color: white;
            border: none;
            padding: 12px;
            font-size: 16px;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #0056b3;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 15px;
            text-decoration: none;
            color: #555;
            font-size: 14px;
        }

        .back-link:hover {
            text-decoration: underline;
            color: #000;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Edit User</h2>
    <form action="../EditUserServlet" method="post">
        <input type="hidden" name="userID" value="<%= user.getUserID() %>" />

        <label for="userName">Username:</label>
        <input type="text" name="userName" value="<%= user.getUserName() %>" required />

        <label for="email">Email:</label>
        <input type="email" name="email" value="<%= user.getEmail() %>" required />

        <label for="phoneNo">Phone Number:</label>
        <input type="text" name="phoneNo" value="<%= user.getPhoneNo() %>" required />

        <label for="roleID">Role:</label>
        <select name="roleID" required>
            <option value="1" <%= user.getRoleID() == 1 ? "selected" : "" %>>Admin</option>
            <option value="2" <%= user.getRoleID() == 2 ? "selected" : "" %>>User</option>
        </select>

        <button type="submit">Update</button>
    </form>

    <a href="javascript:history.back()" class="back-link">← Back to Previous Page</a>
</div>

</body>
</html>
