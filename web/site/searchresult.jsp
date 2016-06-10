<%-- 
    Document   : searchresult
    Created on : Apr 30, 2016, 3:11:24 PM
    Author     : Sachi
--%>

<%@page import="Model.Stock"%>
<%@page import="Model.Book"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--        <meta name="description" content="">
                <meta name="author" content="">-->
        <title>Search results</title>

        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/prettyPhoto.css" rel="stylesheet">
        <link href="css/price-range.css" rel="stylesheet">
        <link href="css/animate.css" rel="stylesheet">
        <link href="css/main.css" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet">
        <!--                [if lt IE 9]>
                        <script src="js/html5shiv.js"></script>
                        <script src="js/respond.min.js"></script>
                        <![endif]       -->
        <link rel="shortcut icon" href="images/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
    </head><!--/head-->

    <body>
        
        <%@include file="header.jsp" %>

        <section id="cart_items">
            <div class="container">
                <div class="breadcrumbs">
                    <ol class="breadcrumb">
                        <li><a href="home.jsp">Home</a></li>
                        <li class="active">Search results</li>
                    </ol>
                </div>
                <div class="col-md-12">

                    <%                        if (request.getParameter("keyword") == null) {

                    %>

                    <div class="col-md-12 text-center">
                        <label class="alert alert-warning"><i class="fa fa-times"></i> Warning:
                            No search keyword</label><hr>
                    </div>
                    <%                        } else {
                        String name = request.getParameter("keyword");
                        ArrayList<Book> results = DBDatalist.getBookListfromName(name);
                        if (results == null) {
                    %>
                    <div class="col-md-12 text-center">
                        <label class="alert alert-warning"><i class="fa fa-times"></i> 
                            No results found</label><hr>
                    </div>
                    <%
                    } else {
                    %>
                    <div class="col-md-12">
                        <h3>Search results for "<%=name%>" - <%=results.size()%> results found</h3>
                        <hr>
                    </div>
                    <%
                        for (Book b : results) {
                            int q=Stock.getAvailability(b.getIdbook());
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
                                         <%
                                                    if (q > 0) {
                                                %>
                                                <button type="submit" class="btn btn-default add-to-cart">
                                                    <i class="fa fa-shopping-cart"></i>
                                                    Add to cart
                                                </button>
                                                <%
                                                } else {
                                                %>
                                                <button type="submit" class="btn btn-default add-to-cart" disabled="">
                                                    <i class="fa fa-shopping-cart"></i>
                                                    <strike>Add to cart</strike>
                                                </button>
                                                <%
                                                    }
                                                %>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%                            }
                            }
                        }
                    %>



                </div>
            </div>
        </section> <!--/#cart_items-->

        <%@include file="footer.jsp" %>



        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/price-range.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>