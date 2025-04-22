<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>About Us - DoTask</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f4f8fb;
            color: #333;
            line-height: 1.6;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            text-align: center;
            margin: 0;
            padding: 0 20px;
        }

        h1 {
            font-size: 50px;
            font-weight: 700;
            color: #333;
            margin-bottom: 30px;
            text-transform: uppercase;
        }

        .about-container {
            max-width: 1100px;
            width: 100%;
            background-color: #fff;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
            border-radius: 12px;
            padding: 40px 30px;
            margin-top: 30px;
            display: flex;
            flex-direction: column;
            gap: 40px;
        }

        .about-container h2 {
            font-size: 32px;
            color: #007bff;
            font-weight: 700;
            margin-bottom: 20px;
            text-transform: uppercase;
        }

        .about-container p {
            font-size: 18px;
            color: #555;
            line-height: 1.8;
            margin-bottom: 30px;
            text-align: left;
        }

        .about-container ul {
            list-style-type: none;
            padding-left: 0;
            font-size: 18px;
            color: #555;
            line-height: 1.8;
            margin-bottom: 30px;
            text-align: left;
        }

        .about-container ul li {
            margin-bottom: 15px;
        }

        .cta {
            background-color: #007bff;
            color: #fff;
            padding: 40px;
            border-radius: 12px;
            text-align: center;
            margin-top: 40px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
        }

        .cta h3 {
            font-size: 30px;
            margin-bottom: 20px;
        }

        .cta p {
            font-size: 18px;
            margin-bottom: 25px;
        }

        .cta a {
            text-decoration: none;
            background-color: #fff;
            color: #007bff;
            padding: 15px 35px;
            font-size: 18px;
            border-radius: 5px;
            transition: all 0.3s ease;
            font-weight: bold;
        }

        .cta a:hover {
            background-color: #0056b3;
            color: #fff;
        }

        footer {
            font-size: 14px;
            color: #555;
            margin-top: 60px;
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

            .about-container {
                padding: 20px;
            }

            .about-container h2 {
                font-size: 28px;
            }

            .cta h3 {
                font-size: 24px;
            }

            .cta p {
                font-size: 16px;
            }
        }
    </style>
</head>
<body>

    <h1>About Us</h1>
    
    <div class="about-container">
        <div>
            <h2>Who We Are</h2>
            <p>At DoTask, we provide a simple yet powerful task management platform that helps individuals and teams stay organized, increase productivity, and achieve their goals. Our platform is designed to meet the needs of both personal and team task management, helping users streamline their work processes with ease.</p>
        </div>

        <div>
            <h2>Our Mission</h2>
            <p>Our mission is to empower individuals and teams by providing an intuitive platform that enhances task management and simplifies collaboration. We believe that task management shouldn't be complex, which is why DoTask is built with simplicity and efficiency in mind.</p>
        </div>

        <div>
            <h2>Our Values</h2>
            <ul>
                <li><strong>Efficiency:</strong> Helping users accomplish more in less time.</li>
                <li><strong>Collaboration:</strong> Encouraging teamwork and seamless communication.</li>
                <li><strong>Transparency:</strong> Providing clear, actionable insights.</li>
                <li><strong>Innovation:</strong> Continuously evolving to meet the needs of our users.</li>
            </ul>
        </div>
    </div>

    <div class="cta">
        <h3>Ready to Get Started?</h3>
        <p>Join thousands of users who are boosting their productivity with DoTask. Sign up today and start managing your tasks more efficiently.</p>
        <a href="register.jsp">Get Started Now</a>
    </div>

    <footer>
        <p>&copy; 2025 DoTask. All Rights Reserved. | <a href="about-us.jsp">About Us</a> | <a href="contact-us.jsp">Contact Us</a></p>
    </footer>
</body>
</html>
