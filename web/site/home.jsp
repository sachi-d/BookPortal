<%-- 
    Document   : home
    Created on : Mar 17, 2016, 11:26:04 AM
    Author     : Sachi
--%>

<%@page import="Model.Cart"%>
<%@page import="Model.Book"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--        <meta name="description" content="">
                <meta name="author" content="">-->
        <title>Home | Book Portal</title>

        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/prettyPhoto.css" rel="stylesheet">
        <link href="css/price-range.css" rel="stylesheet">
        <link href="css/animate.css" rel="stylesheet">
        <link href="css/main.css" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!--<link href="css/" rel="stylesheet">-->
        <!--        [if lt IE 9]>
                <script src="js/html5shiv.js"></script>
                <script src="js/respond.min.js"></script>
                <![endif]       -->
        <link rel="shortcut icon" href="images/logo.png">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
    </head><!--/head-->

    <body>
        
        <%@include file="header.jsp" %>
        <section id="slider"><!--slider-->
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <%                            ArrayList<Book> blist = DBDatalist.getFeaturedBookList();
                            Book fbook1 = blist.get(0); %>
                        <div id="slider-carousel" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#slider-carousel" data-slide-to="0" class="active"></li>
                                    <%
                                        for (int k = 1; k < blist.size(); k++) {
                                    %>
                                <li data-target="#slider-carousel" data-slide-to="<%=k%>"></li>
                                    <%
                                        }
                                    %>
                            </ol>

                            <div class="carousel-inner">
                                <div class="item active">
                                    <div class="col-sm-6">
                                        <h1><span><%=fbook1.getTitle()%></span></h1>
                                        <h2><%= fbook1.getSubject().getType().getName() + "-" + fbook1.getSubject().getName()%></h2>
                                        <p><%= fbook1.getShortDescription()%> </p>
                                        <a href="viewbook.jsp?book=<%=fbook1.getIdbook()%>" ><button type="button" class="btn btn-default get">Get it now</button></a>
                                    </div>
                                    <div class="col-sm-6">
                                        <a href="viewbook.jsp?book=<%=fbook1.getIdbook()%>" ><img src="../<%= fbook1.getImage()%>" class="girl img-responsive" alt="" /></a>
                                        <img src="images/home/pricing.png"  class="pricing" alt="" />
                                    </div>
                                </div>
                                <%
                                    for (int i = 1; i < blist.size(); i++) {
                                        Book bb = blist.get(i);
                                %>
                                <div class="item">
                                    <div class="col-sm-6">
                                        <h1><span><%=bb.getTitle()%></span></h1>
                                        <h2><%= bb.getSubject().getType().getName() + "-" + bb.getSubject().getName()%></h2>
                                        <p><%= bb.getShortDescription()%> </p>
                                        <a href="viewbook.jsp?book=<%=bb.getIdbook()%>"><button type="button" class="btn btn-default get">Get it now</button></a>
                                    </div>
                                    <div class="col-sm-6">
                                        <a href="viewbook.jsp?book=<%=bb.getIdbook()%>" ><img src="../<%= bb.getImage()%>" class="girl img-responsive" alt="" /></a>
                                        <img src="images/home/pricing.png"  class="pricing" alt="" />
                                    </div>
                                </div>
                                <%
                                    }
                                %>

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
                            <h2 class="title text-center">Featured Books</h2>

                            <%                                if (blist != null) {
                                    for (int i = 0; i < blist.size(); i++) {
                                        Book b = blist.get(i);
                            %>
                            <div class="col-sm-4">
                                <div class="product-image-wrapper">
                                    <div class="single-products">
                                        <div class="productinfo text-center">
                                            <a href="viewbook.jsp?book=<%=b.getIdbook()%>" >
                                                <img src="../<%= b.getImage()%>" alt="" class="hvr-grow" style="border: solid 1px #919191" />
                                            </a>
                                            <h3><%= b.getTitle()%></h3>
                                            <p><%= b.getSubject().getName()%></p>
                                            <form action="../Executecart" method="POST">
                                                <input hidden="" value="<%=b.getIdbook()%>" name="id">
                                                <input hidden="" value="add" name="para">
                                                <button type="submit" class="btn btn-default add-to-cart">
                                                    <i class="fa fa-shopping-cart"></i>
                                                    Add to cart
                                                </button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%
                                    }
                                }
                            %>

                        </div><!--recent_items-->

                        <div class="features_items"><!--features_items-->
                            <h2 class="title text-center">Recent arrivals</h2>

                            <%                                ArrayList<Book> blist2 = DBDatalist.getRecentBookList();
                                if (blist2 != null) {
                                    for (int i = 0; i < blist2.size(); i++) {
                                        Book b = blist2.get(i);
                            %>
                            <div class="col-sm-4">
                                <div class="product-image-wrapper">
                                    <div class="single-products">
                                        <div class="productinfo text-center">
                                            <a href="viewbook.jsp?book=<%=b.getIdbook()%>" >
                                                <img src="../<%= b.getImage()%>" alt="" class="hvr-grow" style="border: solid 1px #919191" />
                                            </a>
                                            <h3><%= b.getTitle()%></h3>
                                            <p><%= b.getSubject().getName()%></p>
                                            <form action="../Executecart" method="POST">
                                                <input hidden="" value="<%=b.getIdbook()%>" name="id">
                                                <input hidden="" value="add" name="para">
                                                <button type="submit" class="btn btn-default add-to-cart">
                                                    <i class="fa fa-shopping-cart"></i>
                                                    Add to cart
                                                </button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%
                                    }
                                }
                            %>

                        </div><!--features_items-->


                    </div>
                </div>
            </div>
        </section>


        <%@include file="footer.jsp" %>



        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/price-range.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>