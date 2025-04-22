<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Contact Us - DoTask</title>
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
            padding: 20px;
            margin: 0;
        }

        h1 {
            font-size: 48px;
            color: #333;
            font-weight: 900;
            margin-bottom: 20px;
            text-transform: uppercase;
            letter-spacing: 2px;
            font-family: 'Roboto', sans-serif;
        }

        .contact-container {
            max-width: 1100px;
            width: 100%;
            background-color: #fff;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            padding: 40px;
            margin-top: 30px;
            animation: fadeIn 1s ease-in-out;
        }

        .contact-container h2 {
            font-size: 36px;
            color: #007bff;
            margin-bottom: 20px;
            font-weight: 600;
            text-transform: uppercase;
        }

        .contact-container p {
            font-size: 18px;
            color: #555;
            margin-bottom: 30px;
            line-height: 1.8;
            font-style: italic;
        }

        .contact-form {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .contact-form input,
        .contact-form textarea {
            width: 100%;
            padding: 15px;
            margin-bottom: 15px;
            border: 2px solid #ddd;
            border-radius: 8px;
            font-size: 16px;
            transition: 0.3s ease;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .contact-form input:focus,
        .contact-form textarea:focus {
            border-color: #007bff;
            outline: none;
        }

        .contact-form button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 15px 30px;
            border-radius: 35px;
            font-size: 18px;
            cursor: pointer;
            transition: all 0.3s ease;
            width: 100%;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        }

        .contact-form button:hover {
            background-color: #0056b3;
            transform: translateY(-5px);
        }

        .contact-form button:active {
            background-color: #004085;
            transform: translateY(0);
        }

        footer {
            font-size: 14px;
            color: #555;
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

        /* Responsive Design */
        @media (max-width: 768px) {
            h1 {
                font-size: 40px;
            }

            .contact-container {
                padding: 30px;
            }

            .contact-form button {
                font-size: 16px;
                padding: 12px 20px;
            }
        }

        /* Animation */
        @keyframes fadeIn {
            0% {
                opacity: 0;
                transform: translateY(20px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

    </style>
</head>
<body>

    <h1>Contact Us</h1>
    
    <div class="contact-container">
        <h2>We'd Love to Hear From You!</h2>
        <p>Whether you have a question, suggestion, or just want to say hi, our team is here to help! Fill out the form below, and we’ll get back to you as soon as possible.</p>

        <form class="contact-form" action="#" method="post">
            <input type="text" name="name" placeholder="Your Name" required>
            <input type="email" name="email" placeholder="Your Email" required>
            <textarea name="message" placeholder="Your Message" required></textarea>
            <button type="submit">Send Message</button>
        </form>
    </div>

    <footer>
        <p>&copy; 2025 DoTask. All Rights Reserved. | <a href="about-us.jsp">About Us</a> | <a href="contact-us.jsp">Contact Us</a></p>
    </footer>

</body>
</html>
