<%-- 
    Document   : viewbook
    Created on : Apr 20, 2016, 12:52:20 AM
    Author     : Sachi
--%>

<%@page import="Model.Author"%>
<%@page import="Model.Book"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--        <meta name="description" content="">
                <meta name="author" content="">-->
        <title>Book | Book Portal</title>

        <link href="admin/css/bootstrap.min.css" rel="stylesheet">
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
        <section>
            <div class="container">
                <div class="row">
                    <%@include file="sidebar.jsp" %>

                    <div class="col-sm-9 padding-right">
                        <div class="features_items"><!--features_items-->
                            <%                                if (request.getParameter("book") != null) {
                                    int idbook = Integer.parseInt(request.getParameter("book"));
                                    Book b = DBDatalist.getBook(idbook);
                            %>
                            <h2 class="title text-center">Book Details</h2>

                            <div class="col-md-5">
                                <div class="view-product">
                                    <img src="../<%= b.getImage()%>" alt="" style="width: 100%;height: auto;" />

                                </div>
                            </div>
                            <div class="col-md-7">
                                <div class="product-information"><!--/product-information-->
                                    <%
                                        if (b.getFeatured() == 1) {
                                    %>
                                    <img src="images/product-details/featured.jpg" class="newarrival" alt="" />
                                    <%
                                        }
                                    %>

                                    <h2><%= b.getTitle()%></h2>
                                    <p><%=b.getSubject().getType().getName()%> - <%= b.getSubject().getName()%> </p>
                                    <p><%=b.getLanguage()%> </p>
                                    <!--<img src="images/product-details/rating.png" alt="" />-->
                                    <form action="../Executecart" method="POST">
                                        <input hidden="" value="<%=b.getIdbook()%>" name="id">
                                        <input hidden="" value="add" name="para">
                                        <span>
                                            <span>Rs. <%= b.getPrice()%></span>
                                            <!--                                        <label>Quantity:</label>
                                                                                    <input type="text" value="3" />-->

                                            <button type="submit" class="btn btn-default cart">
                                                <i class="fa fa-shopping-cart"></i>
                                                Add to cart
                                            </button>
                                        </span>
                                    </form>
                                    <div class="form-group">
                                        <label class="col-md-3">Author(s): </label>
                                        <div class="col-md-9">
                                            <%
                                                ArrayList<Author> auth = DBDatalist.getAuthorfromBook(b.getIdbook());
                                                if (auth != null) {
                                                    for (int i = 0; i < auth.size(); i++) {
                                            %>
                                            <p><%= auth.get(i).getName()%></p>
                                            <%
                                                }
                                            } else {
                                            %>
                                            <p>Not specified</p>
                                            <%
                                                }
                                            %>
                                        </div>
                                    </div>  

                                    <div class="form-group">
                                        <label class="col-md-3">ISBN: </label>
                                        <div class="col-md-9">
                                            <p><%= b.getISBN()%></p>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3">Edition: </label>
                                        <div class="col-md-9">
                                            <p><%= b.getEdition()%></p>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3">Publisher: </label>
                                        <div class="col-md-9">
                                            <p><%= b.getPublisher().getName()%></p>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3">Pub. date: </label>
                                        <div class="col-md-9">
                                            <p><%= b.getPub_date()%></p>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3">Description: </label>
                                        <div class="col-md-9">
                                            <p><%= b.getDescription()%></p>
                                        </div>
                                    </div>



                                    <!--<a href=""><img src="images/product-details/share.png" class="share img-responsive"  alt="" /></a>-->
                                </div>
                            </div>


                            <%
                                }%>

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
