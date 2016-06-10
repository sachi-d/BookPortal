<%-- 
    Document   : viewbooklist
    Created on : Apr 19, 2016, 10:39:43 PM
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
        <title>Book list | Book Portal</title>

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
                        <div class="features_items">
                            <h2 class="title text-center">Book filter</h2>
                            <%                                Subject sub;
                                Type type;
                                ArrayList<Book> blist;
                                if (request.getParameter("sub") != null) {
                                    int idsubject = Integer.parseInt(request.getParameter("sub"));
                                    sub = DBDatalist.getSubject(idsubject);
                                    blist = DBDatalist.getBookListfromSubject(idsubject);
                            %>
                            <h2 class="title text-center"><%= sub.getName()%></h2>

                            <%
                            } else if (request.getParameter("type") != null) {
                                int idtype = Integer.parseInt(request.getParameter("type"));
                                type = DBDatalist.getType(idtype);
                                blist = DBDatalist.getBookListfromType(idtype);
                            %>
                            <h2 class="title text-center"><%= type.getName()%></h2>
                            <%
                                } else {
                                    blist = new ArrayList();
                                }
                                if (blist != null) {
                                    for (int i = 0; i < blist.size(); i++) {
                                        Book b = blist.get(i);
                                        int q = Stock.getAvailability(b.getIdbook());
                            %>

                            <div class="col-sm-4">
                                <div class="product-image-wrapper">
                                    <div class="single-products">
                                        <div class="productinfo text-center">
                                            <a href="viewbook.jsp?book=<%=b.getIdbook()%>"><img src="../<%= b.getImage()%>" alt="<%=b.getTitle()%>" style="border: solid 1px #919191"/></a>
                                            <h2><%=b.getTitle()%></h2>
                                            <p><a href="viewbooklist.jsp?sub=<%=b.getSubject().getIdsubject()%>"><%=b.getSubject().getName()%></a></p>
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
