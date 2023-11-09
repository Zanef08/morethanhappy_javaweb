<%-- 
    Document   : addCake
    Created on : Oct 13, 2023, 11:30:15 PM
    Author     : Zane
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Cake</title>
        <style>
            .center-container {
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .custom-button {
                background-color: #f195b2;
                color: white;
                width: 200px; 
                padding: 15px 20px; 
                border: none; 
                border-radius: 10px;
                text-align: center; 
                cursor: pointer;
                margin-left: 37%;
            }

            .custom-button-group {
                text-align: center;
            }

            .form-container {
                width: 50%;
            }

            .form-group {
                margin-bottom: 20px;
            }

            .form-label {
                font-weight: bold;
            }

            .form-input {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }
            a {
                text-align: center;
                text-decoration: none;
                color: black;
                margin-left: 36%;
            }
            a:hover {
                color: black;
                text-decoration: underline;
            }
        </style>
    </style>
</head>
<body>
    <div class="center-container">
        <h1>Add Cake</h1>
        <form action="MainController" method="post" class="form-container">
            <div class="form-group">
                <label for="cakeName" class="form-label">Cake Name:</label>
                <select id="cakeName" name="cakeName" class="form-input" required>
                    <option value="Birthday Cake">Birthday Cake</option>
                    <option value="Cupcake">Cupcake</option>
                    <option value="Cookie">Cookie</option>
                </select>
            </div>
            <div class="form-group">
                <label for="description" class="form-label">Description:</label>
                <textarea id="description" name="description" class="form-input" rows="4" required></textarea>
            </div>
            <div class="form-group">
                <label for="price" class="form-label">Price:</label>
                <input type="number" id="price" name="price" step="10.0" class="form-input" required />
            </div>
            <div class="form-group">
                <label for="image" class="form-label">Image Link:</label>
                <input type="text" id="image" name="image" class="form-input" required />
            </div>
            <div class="form-group">
                <input type="submit" name="action" value="AddCake" class="custom-button" />
            </div>
            <div class="form-group">
                <a href ="admin.jsp" >Don't want to add Cake anymore?</a> 
            </div>
                            
        </form>
    </div>
</body>
</html>