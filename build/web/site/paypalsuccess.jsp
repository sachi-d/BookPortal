<%-- 
    Document   : paypalsuccess
    Created on : May 13, 2016, 8:35:42 AM
    Author     : Sachi
--%>

<%@page import="Controller.Savebill"%>
<%@page import="java.util.HashMap"%>
<%@page import="Model.Book"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--        <meta name="description" content="">
                <meta name="author" content="">-->
        <title>Payment success!</title>

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
            <%                HashMap<Book, Integer> items = shoppingCart.getItems();
                boolean addbill = Savebill.saveOnlineBill(shoppingCart );
                if (addbill) {
            %>
            <div class="container">
                <div class="breadcrumbs">
                    <h3><strong>Your bill was successfully added. Thank you for choosing BookPortal.</strong></h3>
                </div>
                <div class="table-responsive cart_info">

                    <table class="table table-condensed">
                        <%                            if (shoppingCart.getCartSize() != 0) {
                        %>
                        <thead>
                            <tr>
                                <td class="image">Item</td>
                                <td class="description"></td>
                                <td class="price">Price (Rs.)</td>
                                <td class="quantity">Quantity</td>
                                <td class="total">Total</td>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (Book b : items.keySet()) {
                            %>
                            <tr>
                                <td class="cart_product">
                                    <a href=""><img src="../<%= b.getImage()%>" alt="" height="100"  ></a>
                                </td>
                                <td class="cart_description">
                                    <h4><a href=""><%=b.getTitle()%></a></h4>
                                    <p>ISBN: <%=b.getISBN()%></p>
                                </td>
                                <td class="cart_price">
                                    <p><%=b.getPrice()%></p>
                                </td>
                                <td class="cart_quantity">
                                    <div class="cart_quantity_button">
                                        <p> <%=items.get(b)%></p>
                                    </div>

                                </td>
                                <td class="cart_total">
                                    <p class="cart_total_price"><%=shoppingCart.getTotalperBook(b)%></p>
                                </td>

                            </tr>
                            <%
                                }
                            %>

                            <tr style="background-color: #f0f0f0">
                                <td class="cart_product">

                                </td>
                                <td class="cart_description">

                                </td>
                                <td class="cart_price">

                                </td>
                                <td class="cart_quantity">
                                    <p class="cart_total_price">Sub total</p>
                                </td>
                                <!-- The row displaying the total amount to be paid -->
                                <td class="cart_total">
                                    <p class="cart_total_price"><strong><%=shoppingCart.getTotal()%></strong></p>
                                </td>

                            </tr>
                        </tbody>

                        <%
                        } else {
                        %>
                        <label class="label label-default">Your cart is currently empty.<br> Please contact admin to settle any disputes. </label>
                            <%
                                }
                            %>
                    </table>

                </div>

            </div>
            <%
            } else {
            %>
            <div class="container">
                <label class="label label-danger">Something went wrong. Please contact admin to settle the dispute.</label>
            </div>
            <%
                }
            %>

        </section> <!--/#cart_items-->




        <%@include file="footer.jsp" %>



        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/price-range.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>
        <script>
            function incrementvalue(el1)
            {
                var value = parseInt(document.getElementById(el1).value, 10);
                value = isNaN(value) ? 0 : value;
                value++;
                document.getElementById(el1).value = value;
            }
            function incremenxtvalue(el1)
            {

            }
        </script>
    </body>
</html>