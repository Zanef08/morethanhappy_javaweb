<%-- 
    Document   : admin
    Created on : Oct 10, 2023, 10:29:38 PM
    Author     : Zane
--%>

<%@page import="purchase.OrderDetailDTO"%>
<%@page import="dto.CakeDTO"%>
<%@page import="java.util.List"%>
<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>

            .side-section {
                width: 20%;
                float: left;
                padding: 20px;
            }

            .main-content {
                width: 80%;
                float: left;
            }

            .btn-group {
                float: left;
                margin-right: 20px; 
            }

            .title {
                text-align: center;
                clear: both; 
            }
            .Logout {
                float: right;
                margin-right: 20px;
                margin-top: 10px;
            }

            section {
                padding: 20px;
            }

            .table img {
                max-width: 100px;
            }

            .table th, .table td {
                text-align: center;
            }
            .centered-heading {
                text-align: center;
                align-items: center;
            }
            .custom-button {
                background-color: #f195b2;
                color: white;
                width: 150px;
            }
            .center-container {
                display: flex;
                flex-direction: column;
                align-items: center;
            }
            .custom-button-group {
                text-align: center;
            }
        </style>
    </head>
    <body>
    <html>
        <body>  
            <%
                UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                if (loginUser == null || !("AD".equals(loginUser.getRoleID()))) {
                    response.sendRedirect("login.jsp");
                    return;
                }
                String search = request.getParameter("search");
                if (search == null) {
                    search = "";
                }
            %>

            <a href="MainController?action=Logout" class="Logout">Logout</a>       
            <div class="center-container">
                <div>
                    <h1>Welcome: <%= loginUser.getFullName()%></h1>
                </div>

                <div class="custom-button-group" role="group">
                    <button type="button" class="btn custom-button" onclick="showSection('section1')">Orders</button>
                    <button type="button" class="btn custom-button" onclick="showSection('section2')">Manage Users</button>
                    <button type="button" class="btn custom-button" onclick="showSection('section3')">Manage Cakes</button>
                </div>
            </div>
            <!-- Phần 1 -->
            <div id="section1" style="display:none;">
                <h2 class="centered-heading">Manage Orders</h2>
                <%
                    String show = request.getParameter("show");
                    if (show == null) {
                        show = "";
                    }
                %>
                <br />
                <form action="MainController">
                    <input type="text" placeholder="Search by Date" name="show" value="<%= show%>" />
                    <input type="submit" name="action" value="Show" />
                </form>
                <%
                    List<OrderDetailDTO> orders = (List<OrderDetailDTO>) request.getAttribute("LIST_ORDERS");
                    if (orders != null) {
                        if (orders.size() > 0) {
                %>
                <table class="table" border="1">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Order ID</th>
                            <th>Date</th>
                            <th>User ID</th>
                            <th>Phone</th>
                            <th>Address</th>
                            <th>Cake ID</th>
                            <th>Quantity</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            int count = 1;
                            for (OrderDetailDTO order : orders) {
                        %>
                        <tr>
                            <td><%= count++%></td>
                            <td><%= order.getOrderID() %></td>
                            <td><%= order.getDate() %></td>
                            <td><%= order.getUserID() %></td>
                            <td><%= order.getPhone() %></td>
                            <td><%= order.getAddress() %></td>
                            <td><%= order.getCakeID() %></td>
                            <td><%= order.getQuantity() %></td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
                <div class="error-message">
                    <%
                        String error = (String) request.getAttribute("ERROR");
                        if (error == null) {
                            error = "";
                        }
                    %>
                    <%= error%>
                </div>
                <%
                        }
                    }
                %>
            </div>

            <!-- Phần 2 -->
            <div id="section2" style="display:none;">
                <h2 class="centered-heading">Manage Users</h2>
                </br>
                <form action ="MainController">
                    <input type ="text" placeholder="Search by FullName " name ="search" value="<%=search%>" />
                    <input type ="submit" name ="action" value ="Search" />
                </form>
                <%
                    List<UserDTO> listUser = (List<UserDTO>) request.getAttribute("LIST_USER");
                    if (listUser != null) {
                        if (listUser.size() > 0) {
                %>
                <!--<table border="1">-->
                </br>
                <table class="table" border="1">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>User ID</th>
                            <th>Full Name</th>
                            <th>Role ID</th>
                            <th>Password</th>
                            <th>Update</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            int count = 1;
                            for (UserDTO user : listUser) {
                        %>

                    <form action="MainController">
                        <tr>
                            <td><%= count++%></td>
                            <td><%= user.getUserID()%></td>
                            <td>
                                <input type="text" name="fullName" value="<%= user.getFullName()%>" required=""/>
                            </td>
                            <td>
                                <input type="text" name="roleID" value="<%= user.getRoleID()%>" required=""/>
                            </td>
                            <td><%= user.getPassword()%></td>

                            <td>
                                <input type="submit" name="action" value="Update"/>
                                <input type="hidden" name="userID" value="<%= user.getUserID()%>"/>
                                <input type="hidden" name="search" value="<%= search%>"/>
                            </td>
                            <td>
                                <a href="MainController?search=<%=search%>&action=Delete&userID=<%=user.getUserID()%>">Delete</a>
                            </td>
                        </tr>
                    </form>

                    <%
                        }
                    %>
                    </tbody>
                </table>
                <div class="error-message">
                    <%
                        String error = (String) request.getAttribute("ERROR");
                        if (error == null) {
                            error = "";
                        }
                    %>
                    <%= error%>
                </div>

                <%
                        }
                    }
                %>
            </div>

            <!-- Phần 3 -->
            <div id="section3" style="display:none;">
                <h2 class="centered-heading">Manage Cakes</h2>
                <%
                    String submit = request.getParameter("submit");
                    if (submit == null) {
                        submit = "";
                    }
                %>

                <form action ="MainController">
                    <input type ="text" placeholder="Search by Cake ID " name ="submit" value="<%=submit%>" />
                    <input type ="submit" name ="action" value ="Submit" />
                    <div class="link">Create Cake? <a href="addCake.jsp">Click here</a></br></div>
                </form>
                <%
                    List<CakeDTO> listCake = (List<CakeDTO>) request.getAttribute("LIST_CAKE");
                    if (listCake != null) {
                        if (listCake.size() > 0) {
                %>
                </br>
                <table class="table" border="1">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Cake ID</th>
                            <th>Cake Name</th>
                            <th>Description</th>
                            <th>Price</th>
                            <th>Image</th>
                            <th>Update</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            int count = 1;
                            for (CakeDTO cake : listCake) {
                        %>

                    <form action="MainController">
                        <tr>
                            <td><%= count++%></td>
                            <td><%= cake.getCakeID()%></td>
                            <td>
                                <input type="text" name="cakeName" value="<%= cake.getCakeName()%>" required=""/>
                            </td>
                            <td>
                                <input type="text" name="description" value="<%= cake.getDescription()%>" required=""/>
                            </td>
                            <td>
                                <input type="number" name="price" value="<%= cake.getPrice()%>"/>
                            </td>
                            <td>
                                <img src="<%= cake.getImage()%>" alt="image">
                            </td>


                            <td>
                                <input type="submit" name="action" value="UpdateCake"/>
                                <input type="hidden" name="cakeID" value="<%= cake.getCakeID()%>"/>
                                <input type="hidden" name="submit" value="<%= submit%>"/>
                            </td>
                            <td>
                                <a href="MainController?submit=<%=submit%>&action=DeleteCake&cakeID=<%= cake.getCakeID()%>">Delete</a>
                            </td>
                        </tr>
                    </form>

                    <%
                        }
                    %>
                    </tbody>
                </table>
                <div class="error-message">
                    <%
                        String error = (String) request.getAttribute("ERROR");
                        if (error == null) {
                            error = "";
                        }
                    %>
                    <%= error%>
                </div>

                <%
                        }
                    }
                %>
            </div>


            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
            <script>
                        function showSection(sectionId) {
                            // Ẩn tất cả các phần
                            document.getElementById('section1').style.display = 'none';
                            document.getElementById('section2').style.display = 'none';
                            document.getElementById('section3').style.display = 'none';

                            // Hiển thị phần được chọn
                            document.getElementById(sectionId).style.display = 'block';
                        }
            </script>
        </body>
    </html>

