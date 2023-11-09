<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="purchase.OrderDTO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Invoice</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="icon" href="img/fav-icon.png" type="image/x-icon" />
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>More Than Happy</title>

        <!-- Icon css link -->
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="vendors/linearicons/style.css" rel="stylesheet">
        <link href="vendors/flat-icon/flaticon.css" rel="stylesheet">
        <link href="vendors/stroke-icon/style.css" rel="stylesheet">
        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Rev slider css -->
        <link href="vendors/revolution/css/settings.css" rel="stylesheet">
        <link href="vendors/revolution/css/layers.css" rel="stylesheet">
        <link href="vendors/revolution/css/navigation.css" rel="stylesheet">
        <link href="vendors/animate-css/animate.css" rel="stylesheet">

        <!-- Extra plugin css -->
        <link href="vendors/owl-carousel/owl.carousel.min.css" rel="stylesheet">
        <link href="vendors/magnifc-popup/magnific-popup.css" rel="stylesheet">
        <link href="vendors/jquery-ui/jquery-ui.min.css" rel="stylesheet">
        <link href="vendors/nice-select/css/nice-select.css" rel="stylesheet">

        <link href="css/style.css" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet">
        <style>
            body {
                font-family: Arial, sans-serif;
            }
            .invoice {
                max-width: 800px;
                margin: 0 auto;
                padding: 20px;
                background: #f9f9f9;
                border: 1px solid #ddd;
            }
            .invoice h1 {
                text-align: center;
            }
            .invoice table {
                width: 100%;
                border-collapse: collapse;
            }
            .invoice th, .invoice td {
                padding: 10px;
                border: 1px solid #ddd;
            }
            .invoice th {
                text-align: left;
                background: #f2f2f2;
            }
            .invoice td {
                text-align: right;
            }
            .invoice .total {
                font-weight: bold;
            }
        </style>
    </head>
    <body>
         <header class="main_header_area">
            <div class="top_header_area row m0">
                <div class="container">
                    <div class="float-left">
                        <a href="0794486799"><i class="fa fa-phone" aria-hidden="true"></i>0794486799</a>
                        <a href="thuyvi10061998@gmail.com"><i class="fa fa-envelope-o" aria-hidden="true"></i>
                            thuyvi10061998@gmail.com</a>
                    </div>	
                    <div class="float-right">
                        <ul class="h_social list_style">
                            <li><a href="https://www.facebook.com/profile.php?id=100068924952791"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="https://www.instagram.com/morethanhappy_cakedecor/"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="main_menu_area">
                <div class="container">
                    <nav class="navbar navbar-expand-lg navbar-light bg-light">
                        <a class="navbar-brand" href="index.jsp">
                            <img src="img/logo.png" alt="">
                            <img src="img/logo-2.png" alt="">
                        </a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse"
                                data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                aria-expanded="false" aria-label="Toggle navigation">
                            <span class="my_toggle_menu">
                                <span></span>
                                <span></span>
                                <span></span>
                            </span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav mr-auto">
                                <li><a href="cake.jsp">Our Cakes</a></li>
                                <li><a href="about-us.jsp">About Us</a></li>
                                <li class="shop_cart"><a href="cart.jsp"><i class="lnr lnr-cart"></i></a></li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
        </header>

        <!--================End Main Header Area =================-->
        <section class="banner_area">
            <div class="container">
                <div class="banner_text">
                    <h3>Invoice</h3>
                    <ul>
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="invoice.jsp">Invoice</a></li>
                    </ul>
                </div>
            </div>
        </section>

        <div class="invoice">
            <h1>Invoice</h1>
            <table>
                <tr>
                    <th>Order ID</th>
                    <td>${ORDER.orderID}</td>
                </tr>
                <tr>
                    <th>Date</th>
                    <td>${ORDER.date}</td>
                </tr>
                <tr>
                    <th>User ID</th>
                    <td>${ORDER.userID}</td>
                </tr>
                <tr>
                    <th>Phone</th>
                    <td>${ORDER.phone}</td>
                </tr>
                <tr>
                    <th>Address</th>
                    <td>${ORDER.address}</td>
                </tr>
                <tr>
                    <th>Total</th>
                    <td class="total">${ORDER.total}</td>
                </tr>
            </table>
        </div>
        
        <footer class="footer_area">
            <div class="footer_widgets">
                <div class="container">
                    <div class="row footer_wd_inner">
                        <div class="col-lg-3 col-6">
                            <aside class="f_widget f_about_widget">
                                <img src="img/footer-logo.png" alt="">
                                <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui bland itiis praesentium voluptatum deleniti atque corrupti.</p>
                                <ul class="nav">
                                    <li><a href="https://www.facebook.com/profile.php?id=100068924952791"><i class="fa fa-facebook"></i></a></li>
                                    <li><a href="https://www.instagram.com/morethanhappy_cakedecor/"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                                </ul>
                            </aside>
                        </div>
                        <div class="col-lg-3 col-6">
                            <aside class="f_widget f_link_widget">  
                            </aside>
                        </div>
                        <div class="col-lg-3 col-6">
                            <aside class="f_widget f_link_widget">
                                <div class="f_title">
                                    <h3>Work Times</h3>
                                </div>
                                <ul class="list_style">
                                    <li><a href="#">Open Daily : 8 am - 9 pm</a></li>
                                </ul>
                            </aside>
                        </div>
                        <div class="col-lg-3 col-6">
                            <aside class="f_widget f_contact_widget">
                                <div class="f_title">
                                    <h3>Contact Info</h3>
                                </div>
                                <h4>0794486799</h4>
                                <p>More Than Happy <br />S1.02 Vinhome Grandpark Q9, Ho Chi Minh City, Vietnam</p>
                                <h5>thuyvi10061998@gmail.com</h5>
                            </aside>
                        </div>
                    </div>
                </div>
            </div>
        </footer>

    </body>
</html>
