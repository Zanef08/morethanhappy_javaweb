<%-- 
    Document   : create
    Created on : Jun 9, 2023, 2:05:49 PM
    Author     : Asus
--%>

<%@page import="dto.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CREATE PAGE</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-image: url('img/home-slider/slider-14.jpg');
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

            .form-group label {
                text-align: left;
                font-weight: bold;
            }

            input[type="text"],
            input[type="password"] {
                width: 90%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-size: 18px;
                text-align: left;
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

            .error-message {
                color: #ff0000;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Create User</h1>
            <%
                UserError userError = (UserError) request.getAttribute("USER_ERROR");
                if (userError == null) {
                    userError = new UserError();
                }
            %>
            <form action="MainController" method="POST">
                <div class="form-group">
                    <label for="userID">User ID</label>
                    <input type="text" name="userID" required="">
                    <span class="error-message"><%= userError.getUserID()%></span>
                </div>
                <div class="form-group">
                    <label for="fullName">Full Name</label>
                    <input type="text" name="fullName" required="">
                    <span class="error-message">${requestScope.USER_ERROR.fullName}</span>
                </div>
                <div class="form-group">
                    <label for="roleID">Role ID</label>
                    <input type="text" name="roleID" value="US" required="">
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" name="password" required="">
                </div>
                <div class="form-group">
                    <label for="confirm">Confirm</label>
                    <input type="password" name="confirm" required="">
                    <span class="error-message">${requestScope.USER_ERROR.confirm}</span>
                </div>
                <div class="button-group">
                    <input type="submit" name="action" value="Create">
                    <input type="reset" value="Reset">
                </div>
                <div class="link">Already have account? <a href="login.jsp">Click here</a></br></div>
            </form>
        </div>
    </body>
</html>