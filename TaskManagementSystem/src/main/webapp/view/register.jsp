<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Create Your Account</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
  <style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    body {
      font-family: 'Roboto', sans-serif;
      background-color: #f4f5f7;
      min-height: 100vh;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      padding: 20px;
    }

    /* ─── HEADER ───────────────────────────────────────────────── */
    header {
      position: absolute;
      top: 20px; left: 0; right: 0;
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 20px 30px;
      background: transparent;
    }

    .logo {
      display: flex;
      align-items: center;
    }
    .logo img {
      height: 60px;
      margin-right: 12px;
    }
    .logo span {
      font-size: 28px;
      font-weight: 700;
      color: #333;
    }

    .top-right-link {
      font-size: 14px;
    }
    .top-right-link a {
      color: #007bff;
      font-weight: 500;
      text-decoration: none;
    }
    .top-right-link a:hover {
      text-decoration: underline;
    }

    /* ─── FORM ─────────────────────────────────────────────────── */
    .form-container {
      width: 100%;
      max-width: 500px;
      background-color: #ffffff;
      padding: 30px 40px;
      border-radius: 10px;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
      text-align: center;
      transition: transform .3s ease, box-shadow .3s ease;
    }
    .form-container:hover {
      box-shadow: 0 15px 40px rgba(0, 0, 0, 0.15);
      transform: translateY(-3px);
    }

    h2 {
      font-size: 26px; font-weight: 700;
      margin-bottom: 20px;
      color: #222;
    }

    .form-group {
      margin-bottom: 18px;
      text-align: left;
    }

    label {
      font-size: 14px;
      color: #444;
      font-weight: 600;
      display: block;
      margin-bottom: 8px;
    }

    input[type="text"],
    input[type="email"],
    input[type="password"] {
      width: 100%;
      padding: 12px 18px;
      font-size: 14px;
      color: #333;
      border: 2px solid #ccc;
      border-radius: 8px;
      background-color: #f9f9f9;
      transition: border-color .3s ease;
    }

    input[type="text"]:focus,
    input[type="email"]:focus,
    input[type="password"]:focus {
      border-color: #007bff;
      background-color: #fff;
      outline: none;
    }

    input[type="submit"] {
      background-color: #007bff;
      color: #fff;
      font-size: 16px;
      padding: 12px;
      border: none;
      border-radius: 8px;
      width: 100%;
      cursor: pointer;
      transition: background-color .3s ease;
    }

    input[type="submit"]:hover {
      background-color: #0056b3;
    }

    .error-message {
      color: #e74c3c;
      font-size: 14px;
      margin-bottom: 15px;
      text-align: left;
    }

    .bottom-link {
      margin-top: 30px;
      font-size: 14px;
      color: #555;
      text-align: center;
    }

    .bottom-link a {
      color: #007bff;
      text-decoration: none;
    }

    .bottom-link a:hover {
      text-decoration: underline;
    }

    @media screen and (max-width: 480px) {
      header {
        flex-direction: column;
        padding: 15px 20px;
      }
      .logo img {
        height: 50px;
      }
      .logo span {
        font-size: 24px;
      }
      .top-right-link {
        margin-top: 10px;
      }
      .form-container {
        margin-top: 100px;
        padding: 20px;
      }
      h2 {
        font-size: 22px;
      }
      input[type="submit"] {
        padding: 12px;
        font-size: 15px;
      }
      .top-right-link, .bottom-link {
        font-size: 13px;
      }
    }
  </style>
</head>
<body>

  <!-- ─── HEADER with LOGO + LOGIN LINK ───────────────────────── -->
  <header>
    <div class="logo">
      <img src="${pageContext.request.contextPath}/assets/completed-task.png" alt="DoTask Logo">
      <span>DoTask</span>
    </div>
    <div class="top-right-link">
      Already have an account? <a href="login.jsp">Login</a>
    </div>
  </header>

  <!-- ─── REGISTRATION FORM ────────────────────────────────────── -->
  <div class="form-container">
    <h2>Create Your Account</h2>

    <% String error = (String) request.getAttribute("error");
       if (error != null) { %>
      <div class="error-message"><%= error %></div>
    <% } %>

    <form action="../RegisterServlet" method="post">
      <div class="form-group">
        <label for="userName">Username:</label>
        <input type="text" name="userName" required placeholder="Choose a username">
      </div>
      <div class="form-group">
        <label for="email">Email:</label>
        <input type="email" name="email" required placeholder="Your email address">
      </div>
      <div class="form-group">
        <label for="password">Password:</label>
        <input type="password" name="password" required placeholder="Create a password">
      </div>
      <div class="form-group">
        <label for="phoneNo">Phone Number:</label>
        <input type="text" name="phoneNo" pattern="[0-9]{10}" required placeholder="Enter your phone number">
      </div>
      <!-- Removed role dropdown; pre-set role to 'User' -->
      <input type="hidden" name="roleID" value="2"> <!-- User role ID -->
      <div class="form-group">
        <input type="submit" value="Register">
      </div>
    </form>
  </div>

  <!-- ─── BOTTOM LINK ──────────────────────────────────────────── -->
  <div class="bottom-link">
    Already have an account? <a href="${pageContext.request.contextPath}/view/login.jsp">Login here</a>
  </div>

</body>
</html>
