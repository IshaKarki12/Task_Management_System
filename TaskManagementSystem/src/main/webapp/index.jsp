<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>DoTask - Task Management System</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f0f0f0; /* Light grey background */
            color: #333;
            line-height: 1.6;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            text-align: center;
        }

        h1 {
            font-size: 60px;
            color: #2e2e2e;
            font-weight: 800;
            margin-bottom: 20px;
            text-transform: uppercase;
            letter-spacing: 2px;
        }

        p {
            font-size: 20px;
            color: #555;
            margin-bottom: 30px;
            max-width: 750px;
            margin-left: auto;
            margin-right: auto;
            font-weight: 300;
            line-height: 1.8;
        }

        .cta-buttons {
            display: flex;
            gap: 30px;
            justify-content: center;
            margin-bottom: 30px;
        }

        .cta-buttons a {
            text-decoration: none;
            font-size: 18px;
            font-weight: 600;
            color: #fff;
            background-color: #007bff; /* Professional blue */
            padding: 16px 35px;
            border-radius: 35px;
            border: 2px solid #007bff;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }

        .cta-buttons a:hover {
            background-color: #0056b3; /* Darker blue for hover */
            color: #fff;
            transform: translateY(-5px);
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.2);
        }

        footer {
            font-size: 14px;
            color: #555;
            margin-top: 50px;
            text-align: center;
            width: 100%;
        }

        footer a {
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
        }

        footer a:hover {
            text-decoration: underline;
        }

        /* Responsiveness */
        @media (max-width: 768px) {
            h1 {
                font-size: 40px;
            }

            p {
                font-size: 18px;
            }

            .cta-buttons a {
                font-size: 16px;
                padding: 12px 25px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to DoTask</h1>
        <p>Your ultimate task management solution to boost productivity and stay organized. Manage your tasks efficiently and take control of your work!</p>

        <div class="cta-buttons">
            <a href="view/login.jsp">Sign In</a>
            <a href="view/register.jsp">Sign Up</a>
        </div>
    </div>

    <footer>
        <p>&copy; 2025 DoTask. All Rights Reserved. | <a href="view/about-us.jsp">About Us</a> | <a href="view/contact-us.jsp">Contact Us</a></p>
    </footer>
</body>
</html>
