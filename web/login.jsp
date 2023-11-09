<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Login Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <style>
            body {
                font-family: Arial, sans-serif;
                background-image: url('img/home-slider/slider-12.jpg'); 
                background-size: cover;
                background-blur: 5px; 
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            .container {
                text-align: center;
                background-color: rgba(255, 255, 255, 0.8);
                padding: 20px;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                max-width: 400px; 
                width: 90%; 
            }

            h1 {
                font-size: 36px;
            }

            h4 {
                font-size: 24px;
            }

            div {
                margin: 15px 0;
            }

            input[type="text"],
            input[type="password"] {
                width: 90%; 
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-size: 18px;
            }

            .button {
                display: flex;
                justify-content: center;
                align-items: center;
                margin-top: 15px;
            }

            input[type="submit"],
            input[type="reset"] {
                background-color: #f195b2;
                color: #fff;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                font-size: 20px;
                cursor: pointer;
                margin: 0 10px;
                transition: background-color 0.2s ease-in-out; 
            }

            input[type="submit"]:hover,
            input[type="reset"]:hover {
                background-color: #ff4d4d;
            }

            .link {
                margin-top: 15px;
            }

            .link a {
                text-decoration: none;
                color: #007bff;
            }

            .link a:hover {
                text-decoration: underline;
            }

            .text {
                text-align: left;
                font-weight: bold; /* ??t in ??m cho text fields */
            }

            .error-message {
                color: #ff0000; /* Màu ch? cho thông báo l?i */
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>WELCOME</h1>
            <h4>Enter your details</h4>
            <form action="MainController" method="POST">
                <div class="text">User ID</div>
                <input type="text" name="userID" placeholder="Your UserID" required=""/></br>
                <div class="text">Password</div>
                <input type="password" name="password" placeholder="Your Password" required=""/></br>
                <div class="button">
                    <input type="submit" name="action" value="Login"/>
                    <input type="reset" value="Reset"/>
                </div>
                <div class="error-message">
                    <%
                        String error = (String) request.getAttribute("ERROR");
                        if (error == null) {
                            error = "";
                        }
                    %>
                    <%= error%>
                </div>
            </form>  
            <div class="link">Create new user account? <a href="create.jsp">Click here</a></br></div>
        </div>
    </body>
</html>
