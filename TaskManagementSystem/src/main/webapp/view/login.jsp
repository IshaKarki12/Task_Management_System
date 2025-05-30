<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("currentUser") != null) {
        String userRole = (String) session.getAttribute("userRole");
        if ("Admin".equals(userRole)) {
            response.sendRedirect("admin-dashboard.jsp");
        } else if ("User".equals(userRole)) {
            response.sendRedirect("user-dashboard.jsp");
        }
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login - Task Manager</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f1c6ff, #d9f7f4, #ffecf0);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
            animation: gradientBackground 15s ease infinite;
        }

        @keyframes gradientBackground {
            0% { background: linear-gradient(135deg, #f1c6ff, #d9f7f4, #ffecf0); }
            50% { background: linear-gradient(135deg, #f0e4ff, #ffdaf0, #c1f7fc); }
            100% { background: linear-gradient(135deg, #f1c6ff, #d9f7f4, #ffecf0); }
        }

        .login-wrapper {
            background: #fff;
            border-radius: 16px;
            padding: 40px;
            width: 100%;
            max-width: 380px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            transform: translateY(10px);
            opacity: 0;
            animation: formAppearing 0.8s ease forwards;
        }

        @keyframes formAppearing {
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .login-wrapper h2 {
            font-size: 30px;
            color: #333;
            margin-bottom: 10px;
            font-weight: 600;
            text-align: center;
        }

        .login-wrapper .tagline {
            font-size: 14px;
            color: #666;
            margin-bottom: 25px;
            text-align: center;
        }

        .login-wrapper label {
            font-size: 14px;
            color: #333;
            font-weight: 500;
            margin-bottom: 6px;
            display: block;
        }

        .login-wrapper input[type="email"],
        .login-wrapper input[type="password"] {
            width: 100%;
            padding: 14px;
            margin-bottom: 20px;
            border: none;
            border-radius: 10px;
            background: #f7f7f7;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            font-size: 16px;
            color: #333;
            transition: all 0.3s ease;
        }

        .login-wrapper input[type="email"]:focus,
        .login-wrapper input[type="password"]:focus {
            background: #fff;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
            outline: none;
            border: 1px solid #4A90E2;
        }

        .login-wrapper .remember-me {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .login-wrapper .remember-me input {
            margin-right: 10px;
        }

        .login-wrapper input[type="submit"] {
            width: 100%;
            padding: 14px;
            background: #4A90E2;
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 18px;
            font-weight: 600;
            cursor: pointer;
            transition: 0.3s ease;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .login-wrapper input[type="submit"]:hover {
            background: #357ab7;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        }

        .login-wrapper .error-message {
            color: #e74c3c;
            font-size: 14px;
            margin-bottom: 15px;
            text-align: center;
        }

        .login-wrapper p {
            font-size: 14px;
            text-align: center;
            color: #666;
        }

        .login-wrapper a {
            color: #4A90E2;
            font-weight: bold;
            text-decoration: none;
        }

        .login-wrapper a:hover {
            text-decoration: underline;
        }

        @media (max-width: 480px) {
            .login-wrapper {
                padding: 30px 25px;
            }

            .login-wrapper h2 {
                font-size: 26px;
            }

            .login-wrapper .tagline {
                font-size: 12px;
            }
        }
    </style>
</head>
<body>

    <div class="login-wrapper">
        <h2>DoTask</h2>
        <div class="tagline">Organize. Prioritize. Succeed.</div>

        <% String error = (String) request.getAttribute("error");
           if (error != null) { %>
            <div class="error-message"><%= error %></div>
        <% } %>

        <form action="../LoginServlet" method="post">
            <label for="email">Email</label>
            <input type="email" name="email"
                   value="<%= request.getAttribute("rememberedEmail") != null ? request.getAttribute("rememberedEmail") : "" %>"
                   placeholder="example@email.com"
                   required>

            <label for="password">Password</label>
            <input type="password" name="password"
                   value="<%= request.getAttribute("rememberedPassword") != null ? request.getAttribute("rememberedPassword") : "" %>"
                   placeholder="Enter your password"
                   required>

            <div class="remember-me">
                <input type="checkbox" name="remember" <%= request.getAttribute("rememberedEmail") != null ? "checked" : "" %>>
                Remember Me
            </div>

            <input type="submit" value="Login">
        </form>

        <p>Don't have an account? <a href="register.jsp">Register here</a></p>
    </div>

</body>
</html>
