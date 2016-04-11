<?php include 'DBCon.php'; ?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <!--        <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <meta name="description" content="">
                <meta name="author" content="">-->
        <title>Header</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/prettyPhoto.css" rel="stylesheet">
        <link href="css/price-range.css" rel="stylesheet">
        <link href="css/animate.css" rel="stylesheet">
        <link href="css/main.css" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet">
        <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->       
        <link rel="shortcut icon" href="images/ico/favicon.ico">
        <!--        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
                <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
                <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
                <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">-->
    </head><!--/head-->

    <body>	
        <div>
            <header id="header"><!--header-->
                <div class="header_top"><!--header_top-->
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="contactinfo">
                                    <ul class="nav nav-pills">
                                        <li><a href=""><i class="fa fa-phone"></i> +2 123 456</a></li>
                                        <li><a href=""><i class="fa fa-envelope"></i> info@bookportal.lk</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="social-icons pull-right">
                                    <ul class="nav navbar-nav">
                                        <li><a href=""><i class="fa fa-facebook"></i></a></li>
                                        <li><a href=""><i class="fa fa-twitter"></i></a></li>
                                        <li><a href=""><i class="fa fa-linkedin"></i></a></li>
                                        <li><a href=""><i class="fa fa-dribbble"></i></a></li>
                                        <li><a href=""><i class="fa fa-google-plus"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div><!--/header_top-->

                <div class="header-middle"><!--header-middle-->
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-4">
                                <div class="logo pull-left">
                                    <a href="index.html"><img src="images/home/logo.png" alt="" /></a>
                                </div>
                                <!--                                <div class="btn-group pull-right">
                                                                    <div class="btn-group">
                                                                        <button type="button" class="btn btn-default dropdown-toggle usa" data-toggle="dropdown">
                                                                            USA
                                                                            <span class="caret"></span>
                                                                        </button>
                                                                        <ul class="dropdown-menu">
                                                                            <li><a href="">Canada</a></li>
                                                                            <li><a href="">UK</a></li>
                                                                        </ul>
                                                                    </div>
                                
                                                                    <div class="btn-group">
                                                                        <button type="button" class="btn btn-default dropdown-toggle usa" data-toggle="dropdown">
                                                                            DOLLAR
                                                                            <span class="caret"></span>
                                                                        </button>
                                                                        <ul class="dropdown-menu">
                                                                            <li><a href="">Canadian Dollar</a></li>
                                                                            <li><a href="">Pound</a></li>
                                                                        </ul>
                                                                    </div>
                                                                </div>-->
                            </div>
                            <div class="col-sm-8">
                                <div class="shop-menu pull-right">
                                    <ul class="nav navbar-nav">
                                        <li><a href="index.php"><i class="fa fa-home"></i> Home</a></li>
                                        <!--<li><a href=""><i class="fa fa-star"></i> Wishlist</a></li>-->
                                        <li><a href="checkout.php" ><i class="fa fa-crosshairs"></i> Checkout</a></li>
                                        <li><a href="cart.php"><i class="fa fa-shopping-cart"></i> Cart</a></li>
                                        <li><a href="aboutus.php"><i class="fa fa-pencil"></i> About us</a></li>
                                        <li><a href="contact-us.php"><i class="fa fa-phone"></i> Contact us</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div><!--/header-middle-->

                <div class="header-bottom"><!--header-bottom-->
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-9">
                                <div class="navbar-header">
                                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                        <span class="sr-only">Toggle navigation</span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                    </button>
                                </div>
                                <div class="mainmenu pull-left">
                                    <ul class="nav navbar-nav collapse navbar-collapse">

                                        <li class="dropdown"><a href="#">By type<i class="fa fa-angle-down"></i></a>
                                            <ul role="menu" class="sub-menu">
                                                <?php
                                                $res = mysqli_query($con, "SELECT name FROM type ");
                                                if ($res) {
                                                    while ($row = mysqli_fetch_array($res)) {
                                                        ?>
                                                        <li><a href=""><?php echo $row['name'] ?></a></li>
                                                    <?php
                                                    }
                                                }
                                                ?>
                                            </ul>
                                        </li>
                                        <li class = "dropdown"><a href = "#">By Language<i class = "fa fa-angle-down"></i></a>
                                            <ul role = "menu" class = "sub-menu">
                                               <?php
                                                $res = mysqli_query($con, "SELECT name FROM language ");

                                                if ($res) {
                                                    while ($row = mysqli_fetch_array($res)) {
                                                        ?>
                                                        <li><a href=""><?php echo $row['name'] ?></a></li>
                                                    <?php
                                                    }
                                                }
                                                ?>
                                            </ul>
                                        </li>
                                        <!--<li class = "dropdown"><a href = "#">Blog<i class = "fa fa-angle-down"></i></a>
                                        <ul role = "menu" class = "sub-menu">
                                        <li><a href = "blog.html">Blog List</a></li>
                                        <li><a href = "blog-single.html">Blog Single</a></li>
                                        </ul>
                                        </li>
                                        <li><a href = "404.html">404</a></li>
                                        <li><a href = "contact-us.html">Contact</a></li> -->
                                    </ul>
                                </div>
                            </div>
                            <div class = "col-sm-3">
                                <div class = "search_box pull-right">
                                    <input type = "text" placeholder = "Search"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div><!--/header-bottom-->
            </header><!--/header-->
        </div>

    </body>
</html>