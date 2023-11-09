<%@page import="purchase.Item"%>
<%@page import="purchase.Cart"%>
<!DOCTYPE html>
<html lang="en">

    <head>
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

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>

        <!--================Main Header Area =================-->
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

        <!--================End Main Header Area =================-->
        <section class="banner_area">
            <div class="container">
                <div class="banner_text">
                    <h3>Cart</h3>
                    <ul>
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="cart.jsp">Cart</a></li>
                    </ul>
                </div>
            </div>
        </section>
        <!--================End Main Header Area =================-->

        <!--================Cart Table Area =================-->
        <section class="cart_table_area p_100">
            <% Cart cart = (Cart) session.getAttribute("CART");
                if (cart != null && cart.getCart().size() > 0) { %>
            <div class="container">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Image</th>
                                <th scope="col">Description</th>
                                <th scope="col">Price</th>
                                <th scope="col">Quantity</th>
                                <th scope="col">Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% int count = 1;
                                double total = 0;
                                for (Item i : cart.getCart().values()) {
                                    total += i.getQuantity() * i.getPrice();
                            %>
                        <form action="MainController" method="POST">
                            <tr>
                                <td>
                                    <input style="max-width: 100px" type="hidden" name="id" value="<%= i.getId()%>" readonly=""><%= i.getId()%>
                                </td>
                                <td>
                                    <img style="max-width: 100px; height: auto;" src="<%= i.getImage()%>" alt="Cake Image">
                                </td>
                                <td><%= i.getDescription()%></td>
                                <td><%= i.getPrice()%></td>
                                <td>
                                    <input style="max-width: 100px" type="number" name="quantity" value="<%= i.getQuantity()%>" min="1" required="">
                                </td>
                                <td><%= i.getQuantity() * i.getPrice()%> </td>
                                <td>
                                    <input type="submit" name="action" value="Edit">
                                </td>
                                <td>
                                    <input type="submit" name="action" value="Remove">
                                </td>
                            </tr>
                        </form>
                        <% }%>
                        </tbody>
                    </table>
                </div>
                        <a style="margin-left: 5%; color: black" href="cake.jsp">Add more</a>
                <div class="row cart_total_inner">
                    <div class="col-lg-7"></div>
                    <div class="col-lg-5">
                        <div class="cart_total_text">
                            <div class="cart_head">
                                Cart Total
                            </div>
                            <div class="total">
                                <h4 style="margin-left: 73%">Total: <%= total%> $</h4>
                            </div>
                            <% } else {%>
                            <div class="empty">
                                <h2> Your cart is Empty!!</h2>
                            </div>
                            <%}%>
                            
                            <div class="cart_footer">
                                <form action="MainController" method="POST">
                                    <input style="margin-left: 80%" type="submit" name="action" value="CheckOut">
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--================End Cart Table Area =================-->

        <!--================Footer Area =================-->
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
        <!--================End Footer Area =================-->






        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="js/jquery-3.2.1.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <!-- Rev slider js -->
        <script src="vendors/revolution/js/jquery.themepunch.tools.min.js"></script>
        <script src="vendors/revolution/js/jquery.themepunch.revolution.min.js"></script>
        <script src="vendors/revolution/js/extensions/revolution.extension.actions.min.js"></script>
        <script src="vendors/revolution/js/extensions/revolution.extension.video.min.js"></script>
        <script src="vendors/revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
        <script src="vendors/revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
        <script src="vendors/revolution/js/extensions/revolution.extension.navigation.min.js"></script>
        <!-- Extra plugin js -->
        <script src="vendors/owl-carousel/owl.carousel.min.js"></script>
        <script src="vendors/magnifc-popup/jquery.magnific-popup.min.js"></script>
        <script src="vendors/isotope/imagesloaded.pkgd.min.js"></script>
        <script src="vendors/isotope/isotope.pkgd.min.js"></script>
        <script src="vendors/datetime-picker/js/moment.min.js"></script>
        <script src="vendors/datetime-picker/js/bootstrap-datetimepicker.min.js"></script>
        <script src="vendors/nice-select/js/jquery.nice-select.min.js"></script>
        <script src="vendors/jquery-ui/jquery-ui.min.js"></script>
        <script src="vendors/lightbox/simpleLightbox.min.js"></script>

        <script src="js/theme.js"></script>
    </body>

</html>