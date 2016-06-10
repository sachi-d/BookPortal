<%-- 
    Document   : header
    Created on : Mar 17, 2016, 11:27:52 AM
    Author     : Sachi
--%>

<%@page import="java.util.Enumeration"%>
<%@page import="Model.Cart"%>
<%@page import="Model.Subject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Type"%>
<%@page import="Controller.DBDatalist"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <link href="css/ddmenu.css" rel="stylesheet">

        <!--[if lt IE 9]>
        <script src="js/html5shiv.js/"></script>
        <script src="js/respond.min.js/"></script>
        <![endif]-->       
        <link rel="shortcut icon" href="images/home/logo.png">
        <!--        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
                <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
                <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
                <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">-->
    </head><!--/head-->

    <body>	
        <%
            String str = request.getRequestURL() + "?";
            Enumeration<String> paramNames = request.getParameterNames();
            while (paramNames.hasMoreElements()) {
                String paramName = paramNames.nextElement();
                String[] paramValues = request.getParameterValues(paramName);
                for (int i = 0; i < paramValues.length; i++) {
                    String paramValue = paramValues[i];
                    str = str + paramName + "=" + paramValue;
                }
                str = str + "&";
            }
            String URL = str.substring(0, str.length() - 1);
            String[] m = URL.split("site/", 2);
            String pagename = m[1];
//            String uri = request.getRequestURI();
//            String pageName = uri.substring(uri.lastIndexOf("/") + 1);
            session.setAttribute("currentpage", pagename);
        %>
        <div>
            <%
                Cart shoppingCart = (Cart) session.getAttribute("cart");
                if (shoppingCart == null) {
                    shoppingCart = new Cart();
                    session.setAttribute("cart", shoppingCart);
                }
                String customer_name = (String) session.getAttribute("customer_name");
                if (customer_name == null) {
                    session.setAttribute("customer_name", "");
                }
                String customer_address = (String) session.getAttribute("customer_address");
                if (customer_address == null) {
                    session.setAttribute("customer_address", "");
                }
            %>
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
                                    <a href="home.jsp"><img src="images/home/logo.png" alt="" /></a>
                                </div>
                            </div>
                            <div class="col-sm-8">
                                <div class="shop-menu pull-right">
                                    <ul class="nav navbar-nav">
                                        <li><a href="home.jsp"><i class="fa fa-home"></i> Home</a></li>
                                        <!--<li><a href=""><i class="fa fa-star"></i> Wishlist</a></li>-->
                                        <!--<li><a href="checkout.php" ><i class="fa fa-crosshairs"></i> Checkout</a></li>-->
                                        <li><a href="cart.jsp"><i class="fa fa-shopping-cart"></i> Cart<% if (shoppingCart.getCartSize() != 0) {%><span class="number"><%= shoppingCart.getCartSize()%></span><% } %></a></li>
                                        <li><a href="aboutus.jsp"><i class="fa fa-pencil"></i> About us</a></li>
                                        <li><a href="contactus.jsp"><i class="fa fa-phone"></i> Contact us</a></li>
                                        <li><a href="cart.jsp" ><i class="fa fa-money"></i>Checkout!</a></li>
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
                                <nav id="ddmenu">
                                    <ul>  
                                        <%
                                            ArrayList<Type> arrType = DBDatalist.getTypeList();
                                            if (arrType != null) {
                                                for (int i = 0; i < arrType.size(); i++) {
                                                    Type type = (Type) arrType.get(i);
                                        %>
                                        <li>
                                            <a class="top-heading" href="viewbooklist.jsp?type=<%=type.getIdType()%>"><%= type.getName()%></a>
                                            <i class="caret"></i>
                                            <div class="dropdown">
                                                <div class="dd-inner">
                                                    <%
                                                        ArrayList<Subject> sublist = DBDatalist.getSubjectsfromType(type);
                                                        if (sublist != null) {
                                                            for (int j = 0; j < sublist.size(); j++) {
                                                                Subject s = sublist.get(j);
                                                                if (j % 7 == 0) {
                                                                    if (j != 0) {
                                                    %>
                                                    </ul>
                                                    <% }
                                                    %>
                                                    <ul class="column">
                                                        <%
                                                            }
                                                        %>
                                                        <li><p><a href="viewbooklist.jsp?sub=<%=s.getIdsubject()%>"><%= s.getName()%></a></p></li>
                                                                    <%
                                                                        }
                                                                    %>
                                                    </ul>
                                                    <%
                                                        }
                                                    %>
                                                </div>

                                            </div>
                                        </li>
                                        <%
                                                }
                                            }
                                        %>


                                    </ul>
                                </nav>

                            </div>
                            <div class = "col-sm-3">

                                <!--                                <div class = "search_box pull-right">-->
                                <div class = "search_box pull-right">
                                    <form action="searchresult.jsp" method="GET">
                                        <input type = "text" placeholder = "Search for books" name="keyword" pattern="[^'\x22\x40\x21\x23\x24\x25\x5E\x26*\x28\x29\x5C\x2F\x3D]+"/>
                                        <input type="hidden" name="action" value="search" />

                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div><!--/header-bottom-->
            </header><!--/header-->
        </div>
        <script src="js/ddmenu.js"></script>
    </body>
</html>
