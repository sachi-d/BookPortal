<%-- 
    Document   : cart
    Created on : Mar 26, 2016, 9:23:03 PM
    Author     : Sachi
--%>

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
        <title>Cart</title>

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
        <link rel="shortcut icon" href="images/logo.png">
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
                        <li class="active">Shopping Cart</li>

                    </ol>

                </div>

                <div class="table-responsive cart_info">

                    <table class="table table-condensed">
                        <%                            HashMap<Book, Integer> items = shoppingCart.getItems();
                            if (shoppingCart.getCartSize() != 0) {
                        %>
                        <thead>
                            <tr class="cart_menu">
                                <td class="image">Item</td>
                                <td class="description"></td>
                                <td class="price">Price (Rs.)</td>
                                <td class="quantity">Quantity</td>
                                <td class="total">Total</td>
                                <td></td>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (Book b : items.keySet()) {
                                    System.out.println(b.getImage());
                            %>
                            <tr>
                                <td class="cart_product">
                                    <a href="viewbook.jsp?book=<%=b.getIdbook()%>"><img src="../<%= b.getImage()%>" alt="" height="100"  ></a>
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
                                        <a href="../Executecart?para=increment&id=<%= b.getIdbook()%>" > + </a>
                                        <input class="cart_quantity_input" type="text" name="quantity" value="<%=items.get(b)%>" autocomplete="off" size="2" disabled="" style="background-color: white;border: 1px solid #CE3C2D">

                                        <a href="../Executecart?para=decrement&id=<%= b.getIdbook()%>"> - </a>
                                    </div>

                                </td>
                                <td class="cart_total">
                                    <p class="cart_total_price"><%=shoppingCart.getTotalperBook(b)%></p>
                                </td>
                                <td class="cart_delete">
                                    <form action="../Executecart" method="POST">
                                        <input hidden="" value="<%=b.getIdbook()%>" name="id">
                                        <input hidden="" value="remove" name="para">
                                        <button type="submit" class="btn btn-default">
                                            <i class="fa fa-times"></i>
                                        </button>
                                    </form>

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
                                <td class="cart_delete">

                                </td>
                            </tr>
                        </tbody>

                        <%
                        } else {
                        %>
                        <label class="label label-default">Your cart is currently empty.</label>
                        <%
                            }
                        %>
                    </table>

                </div>

            </div>
        </section> <!--/#cart_items-->

        <section id="do_action">
            <div class="container">
                <div class="heading">
                    <!--                    <div class="col-md-3">
                                            <h3>Checkout to complete your order</h3>
                                            <hr>
                    
                                            <button class="btn btn-danger" onclick="emptyCart()">Empty the cart</button>
                    
                                        </div>-->

                    <div class="col-md-6">
                        <form action="../Executecart" method="GET">
                            <input hidden="" name="para" value="saveShipping">
                            <div class="form-group">
                                <h2 class="modal-title">Add shipping information</h2>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label"> Name:</label>
                                <div class="col-md-9">
                                    <input class="form-control" name="name" value="<%=customer_name%>" id="customer_name">
                                    <br>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label"> Shipping address:</label>
                                <div class="col-md-9">
                                    <textarea class="form-control" name="address" id="customer_address"><%=customer_address%></textarea>
                                    <br>
                                </div>
                            </div>
                            <div class="form-group">

                                <div class="col-md-9"></div>
                                <div class="col-md-3"><button type="submit" class="btn btn-warning" >Save Details</button></div>
                            </div>
                        </form>
                    </div>

                    <div class="col-md-6">
                        <div class="chose_area">
                            <h3 style="text-align: center">Checkout with <img src="https://www.paypalobjects.com/webstatic/de_DE/i/de-pp-logo-100px.png" border="0" alt="PayPal Logo"></h3>
                            <h3 style="text-align: center;">Total bill value : <span style="color: #E74C3C">Rs. <%=shoppingCart.getTotal()%></span></h3>
                            <p style="text-align: center"><button class="btn btn-success"  data-toggle="modal" data-target="#myModal" >Pay Now</button></p>

                        </div>

                    </div>

                </div>

            </div>
        </section>/
        <div class="bs-example2 bs-example-padded-bottom">

            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h2 class="modal-title">Confirm order?</h2>
                        </div>
                        <div class="modal-body">
                            <div class="grid-form1">
                                <div class="form-group">
                                    <label class="col-md-3 control-label"> Name:</label>
                                    <%
                                        boolean isnameset = false;
                                        if (session.getAttribute("customer_name").equals("")) {
                                            isnameset = false;
                                    %>
                                    <p style="color: red">Please enter a valid Shipping name.</p>
                                    <%
                                    } else {
                                        isnameset = true;
                                    %><p><%=session.getAttribute("customer_name")%></p><%
                                        }%>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label"> Shipping address:</label>
                                    <%
                                        boolean isaddressset = false;
                                        if (session.getAttribute("customer_address").equals("")) {
                                            isaddressset = false;
                                    %>
                                    <p style="color: red">Please enter a valid Shipping Address.</p>
                                    <%
                                    } else {
                                        isaddressset = true;
                                    %><p><%=session.getAttribute("customer_address")%></p><%
                                        }%>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">Total bill value : </label>
                                    <%
                                        double USDtotal = shoppingCart.getTotalinUSD();
                                    %>
                                    <p><span>USD <%=USDtotal%></span> at rate USD : LKR <%=shoppingCart.getLKRtoUSDrate()%></p>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">Checkout with :</label>
                                    <p><img src="https://www.paypalobjects.com/webstatic/de_DE/i/de-pp-logo-100px.png" border="0" alt="PayPal Logo"></p>
                                </div>

                                <div class="form-group">

                                    <form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="POST"> 
                                        <input type="hidden" name="business" value="bookportal@bookportal.lk">
                                        <input type="hidden" name="cmd" value="_xclick">
                                        <input type="hidden" name="item_name" value="Total bill">
                                        <input type="hidden" name="amount" value="<%=USDtotal%>">

                                        <input type="hidden" name="currency_code" value="USD">
                                        <input type="hidden" name="return" value="http://localhost:8080/BookPortal/site/paypalsuccess.jsp">
                                        <input type="hidden" name="rm" value="2">
                                        <input type="hidden" name="cancel_return" value="http://localhost:8080/BookPortal/site/paypalcancel.jsp"> 
                                        <%
                                            if (shoppingCart.getTotal() != 0 && isnameset && isaddressset) {
                                        %>
                                        <p style = "text-align: center"> <input type = "image" name = "submit" src = "https://www.paypal.com/en_US/i/btn/btn_buynow_LG.gif" alt = "PayPal - The safer, easier way to pay online" > 
                                            <% }
                                            %>
                                            <img alt="" border="0" width="1" height="1" src="https://www.paypal.com/en_US/i/scr/pixel.gif" >
                                    </form>
                                </div>

                            </div>
                        </div>
                        <div class="modal-footer">
                            <!--                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                                            <button type="button" class="btn btn-primary">Save changes</button>-->
                        </div>
                    </div><!-- /.modal-content -->
                </div>
            </div>
        </div>

        <%@include file="footer.jsp" %>



        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/price-range.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>

        <script>
            function validate() {
                if (document.getElementById('customer_name') === "" || document.getElementById('customer_address') === "") {
                    alert('Please enter valid shipping details.');
                    return false;
                }
                return true;
            }
        </script>
        <script>
            function incrementvalue(el1) {
                var value = parseInt(document.getElementById(el1).value, 10);
                value = isNaN(value) ? 0 : value;
                value++;
                document.getElementById(el1).value = value;
            }
        </script>
    </body>
</html>