<%-- 
    Document   : home
    Created on : Mar 17, 2016, 11:26:04 AM
    Author     : Sachi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--        <meta name="description" content="">
        <meta name="author" content="">-->
        <title>Home | Book Portal</title>

<!--        <link href="admin/css/bootstrap.min.css" rel="stylesheet">
        <link href="site/css/font-awesome.min.css" rel="stylesheet">
        <link href="site/css/prettyPhoto.css" rel="stylesheet">
        <link href="site/css/price-range.css" rel="stylesheet">
        <link href="site/css/animate.css" rel="stylesheet">
        <link href="site/css/main.css" rel="stylesheet">
        <link href="site/css/responsive.css" rel="stylesheet">
        [if lt IE 9]>
        <script src="site/js/html5shiv.js"></script>
        <script src="site/js/respond.min.js"></script>
        <![endif]       
        <link rel="shortcut icon" href="site/images/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="site/images/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="site/images/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="site/images/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="site/images/ico/apple-touch-icon-57-precomposed.png">-->
    </head><!--/head-->

    <body>
        <%@include file="header.jsp" %>
        <section id="slider"><!--slider-->
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div id="slider-carousel" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#slider-carousel" data-slide-to="0" class="active"></li>
                                <li data-target="#slider-carousel" data-slide-to="1"></li>
                                <li data-target="#slider-carousel" data-slide-to="2"></li>
                            </ol>

                            <div class="carousel-inner">
                                <div class="item active">
                                    <div class="col-sm-6">
                                        <h1><span>E</span>-SHOPPER</h1>
                                        <h2>Free E-Commerce Template</h2>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
                                        <button type="button" class="btn btn-default get">Get it now</button>
                                    </div>
                                    <div class="col-sm-6">
                                        <img src="site/images/home/girl1.jpg" class="girl img-responsive" alt="" />
                                        <img src="site/images/home/pricing.png"  class="pricing" alt="" />
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="col-sm-6">
                                        <h1><span>E</span>-SHOPPER</h1>
                                        <h2>100% Responsive Design</h2>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
                                        <button type="button" class="btn btn-default get">Get it now</button>
                                    </div>
                                    <div class="col-sm-6">
                                        <img src="site/images/home/girl2.jpg" class="girl img-responsive" alt="" />
                                        <img src="site/images/home/pricing.png"  class="pricing" alt="" />
                                    </div>
                                </div>

                                <div class="item">
                                    <div class="col-sm-6">
                                        <h1><span>E</span>-SHOPPER</h1>
                                        <h2>Free Ecommerce Template</h2>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
                                        <button type="button" class="btn btn-default get">Get it now</button>
                                    </div>
                                    <div class="col-sm-6">
                                        <img src="site/images/home/girl3.jpg" class="girl img-responsive" alt="" />
                                        <img src="site/images/home/pricing.png" class="pricing" alt="" />
                                    </div>
                                </div>

                            </div>

                            <a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
                                <i class="fa fa-angle-left"></i>
                            </a>
                            <a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </div>

                    </div>
                </div>
            </div>
        </section><!--/slider-->

        <section>
            <div class="container">
                <div class="row">
                    <%@include file="sidebar.jsp" %>

                    <div class="col-sm-9 padding-right">
                        <div class="features_items"><!--features_items-->
                            <h2 class="title text-center">Featured Items</h2>


                            <div class="col-sm-4">
                                <div class="product-image-wrapper">
                                    <div class="single-products">
                                        <div class="productinfo text-center">
                                            <a data-toggle="modal" data-target="#myModal" >
                                                <img src="site/images/products/big bro boris.jpg" alt="" class="hvr-grow"  />
                                            </a>
                                            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                            <h2 class="modal-title">Add branch</h2>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="grid-form1">

                                                                <form class="form-horizontal">
                                                                    <div class="form-group">
                                                                        <label class="col-md-3 control-label"> Branch name :</label>
                                                                        <div class="col-md-9">
                                                                            <input class="form-control" >
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label class="col-md-3 control-label"> Address :</label>
                                                                        <div class="col-md-9">
                                                                            <input class="form-control" >
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label class="col-md-3 control-label"> Tel no. :</label>
                                                                        <div class="col-md-9">
                                                                            <input class="form-control" >
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label class="col-sm-3 control-label">Branch admin :</label>
                                                                        <div class="col-sm-9">
                                                                            <select name="child" class="form-control">
                                                                                <option value="select" selected="" disabled="">Select..</option>

                                                                                <option value="">fsdfsd</option>

                                                                            </select>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group">
                                                                        <div class="col-md-3 "></div><div class="col-md-3 "></div>
                                                                        <div class="col-md-3 ">
                                                                            <button type="submit" class="btn btn-primary form-control">Add branch</button>
                                                                        </div>
                                                                        <div class="col-md-3 ">
                                                                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                                                        </div>
                                                                    </div>
                                                                </form>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <!--                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                                                                            <button type="button" class="btn btn-primary">Save changes</button>-->
                                                        </div>
                                                    </div><!-- /.modal-content -->
                                                </div>
                                            </div>
                                            <h2>Book name</h2>
                                            <!--<h3><?php // echo  $row['name'] ?></h3>-->
                                            <p>Rs. 999</p>
                                            <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                        </div>

                                        <!--                                        <img class="hvr-grow" src="admin/images/add.png" 
                                                                                     style="position: fixed; bottom: 60px; right: 135px; z-index: 5; width: 50px; height: 50px;">-->


                                        <!--<li><a href=""><?php echo $row['name'] ?></a></li>-->

                                        <div class = "product-overlay">
                                            <div class = "overlay-content">
                                                <h2>$56</h2>
                                                <p>Easy Polo Black Edition</p>
                                                <a href = "#" class = "btn btn-default add-to-cart"><i class = "fa fa-shopping-cart"></i>Add to cart</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class = "choose">
                                        <ul class = "nav nav-pills nav-justified">
                                            <li><a href = "#"><i class = "fa fa-plus-square"></i>Add to wishlist</a></li>
                                            <li><a href = "#"><i class = "fa fa-plus-square"></i>Add to compare</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>

                            <div class="col-sm-4">
                                <div class="product-image-wrapper">
                                    <div class="single-products">
                                        <div class="productinfo text-center">
                                            <img src="site/images/home/product2.jpg" alt="" />
                                            <h2>$56</h2>
                                            <p>Easy Polo Black Edition</p>
                                            <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                        </div>
                                        <div class="product-overlay">
                                            <div class="overlay-content">
                                                <h2>$56</h2>
                                                <p>Easy Polo Black Edition</p>
                                                <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="choose">
                                        <ul class="nav nav-pills nav-justified">
                                            <li><a href="#"><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
                                            <li><a href="#"><i class="fa fa-plus-square"></i>Add to compare</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="product-image-wrapper">
                                    <div class="single-products">
                                        <div class="productinfo text-center">
                                            <img src="site/images/home/product3.jpg" alt="" />
                                            <h2>$56</h2>
                                            <p>Easy Polo Black Edition</p>
                                            <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                        </div>
                                        <div class="product-overlay">
                                            <div class="overlay-content">
                                                <h2>$56</h2>
                                                <p>Easy Polo Black Edition</p>
                                                <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="choose">
                                        <ul class="nav nav-pills nav-justified">
                                            <li><a href="#"><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
                                            <li><a href="#"><i class="fa fa-plus-square"></i>Add to compare</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>

                        </div><!--features_items-->


                    </div>
                </div>
            </div>
        </section>


        <%@include file="footer.jsp" %>



        <script src="site/js/jquery.js"></script>
        <script src="site/js/bootstrap.min.js"></script>
        <script src="site/js/jquery.scrollUp.min.js"></script>
        <script src="site/js/price-range.js"></script>
        <script src="site/js/jquery.prettyPhoto.js"></script>
        <script src="site/js/main.js"></script>
    </body>
</html>