<%@page import="dao.CakeDAO"%>
<%@page import="java.util.List"%>
<%@ page import="dto.CakeDTO" %>
<%@ page contentType="text/html; charset=UTF-8" %>
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

        <link href="css/style.css" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet">

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <style>
            .horizontal-form {
                display: flex;
                align-items: center; 
            }

            .navbar-nav {
                display: flex;
                list-style: none;
                padding: 0;
                margin: 0;
            }

            .navbar-nav li {
                margin-right: 10px; 
            }

            .navbar-nav li:last-child {
                margin-right: 0;
            }
        </style>
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
                                <form action="MainController" method="POST" class="horizontal-form">
                                    <ul class="navbar-nav mr-auto">
                                        <li class="shop_cart"><input style="background-color:  #f195b2; border: none; color: white; border-radius: 22px" type="submit" name="action" value="View" /></li>
                                        <li><input style="background-color:  #f195b2; border: none; color: white; border-radius: 22px" type="submit" name="action" value="Logout" /></li>
                                    </ul>
                                </form>

                            </ul>
                        </div>
                        <h6><% String message = (String) request.getAttribute("MESSAGE");
                            if (message == null) {
                                message = "";
                            }
                        %>
                        <%= message%></h6>
                    </nav>
                </div>
            </div>
        </header>
        <!--================End Main Header Area =================-->

        <!--================End Main Header Area =================-->
        <section class="banner_area">
            <div class="container">
                <div class="banner_text">
                    <h3>Our Cakes</h3>
                    <ul>
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="cakes.jsp">Services</a></li>
                    </ul>
                </div>
            </div>
        </section>
        <!--================End Main Header Area =================-->

        <!--================Blog Main Area =================-->
        <section class="our_cakes_area p_100">
            <div class="container">
                <div class="main_title">
                    <h2>Our Cakes</h2>
                </div>
                <%
                    List<CakeDTO> listCake = CakeDAO.getListCake();
                    if (listCake != null && !listCake.isEmpty()) {
                        int count = 0; // Initialize a count to keep track of cards per row

                        for (CakeDTO cake : listCake) {
                            if (count % 3 == 0) {
                                // Start a new row for every 3 cards
                %>
                <div class="row">
                    <%
                        }

                    %>
                    <div class="col-lg-4 col-md-4 col-6">
                        <div class="cake_feature_item">
                            <div class="cake_img" style="height: 250px; overflow: hidden;"> 
                                <img src="<%= cake.getImage()%>" alt="Cake Image" style="height: 100%; width: auto;">
                            </div>
                            <div class="cake_text">
                                <h4><%= cake.getPrice()%></h4>
                                <h3><%= cake.getDescription()%></h3>
                                <form action="BuyController" method="POST">
                                    <div class="form-group">
                                        <input type="hidden" name="cmbCake" value="<%= cake.getCakeID() + '-' + cake.getDescription() + '-' + cake.getPrice()%>">
                                    </div>
                                    <div class="form-group">
                                        <input type="hidden" name="cmbQuantity" value="1">
                                    </div>
                                    <div class="form-group">
                                        <input type="hidden" name="action" value="Buy">
                                        <input type="submit" class="buy-button" value="Buy" style="background-color: #f195b2; border: none; color: white; border-radius: 22px; padding: 10px 20px; font-size: 16px;">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <%
                        count++;
                        if (count % 3 == 0) {
                    %>
                </div>
                <%
                        }
                    }
                    if (count % 3 != 0) {
                %>
            </div>
            <%
                }
            } else {
            %>
            <p>No cakes available at the moment.</p>
            <%
                }
            %>

        </div>
    </section>     
    <!--================End Blog Main Area =================-->

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
    <script src="vendors/datetime-picker/js/moment.min.js"></script>
    <script src="vendors/datetime-picker/js/bootstrap-datetimepicker.min.js"></script>
    <script src="vendors/nice-select/js/jquery.nice-select.min.js"></script>
    <script src="vendors/jquery-ui/jquery-ui.min.js"></script>
    <script src="vendors/lightbox/simpleLightbox.min.js"></script>

    <script src="js/theme.js"></script>
</body>

</html>