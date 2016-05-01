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
                        <li class="active">Shopping Cart</li>
                    </ol>
                </div>
                <div class="table-responsive cart_info">

                    <table class="table table-condensed">
                        <%                        HashMap<Book, Integer> items = shoppingCart.getItems();
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
                                    <!--                                    <a class="cart_quantity_delete" href=""><i class="fa fa-times"></i></a>-->
                                </td>
                            </tr>
                            <%
                                }
                            %>

                            <tr>
                                <td class="cart_product">

                                </td>
                                <td class="cart_description">

                                </td>
                                <td class="cart_price">

                                </td>
                                <td class="cart_quantity">
                                    <hr>
                                    <p class="cart_total_price">Sub total</p>
                                </td>
                                <td class="cart_total">
                                    <hr>
                                    <p class="cart_total_price"><strong><%=shoppingCart.getTotal()%></strong></p>
                                </td>
                                <td class="cart_delete">
                                    <!--                                    <hr>
                                                                        <a class="cart_quantity_delete" href=""><i class="fa fa-times"></i></a>-->
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
                    <h3>What would you like to do next?</h3>
                    <p>Choose if you have a discount code or reward points you want to use or would like to estimate your delivery cost.</p>
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <div class="chose_area">
                            <ul class="user_option">
                                <li>
                                    <input type="checkbox">
                                    <label>Use Coupon Code</label>
                                </li>
                                <li>
                                    <input type="checkbox">
                                    <label>Use Gift Voucher</label>
                                </li>
                                <li>
                                    <input type="checkbox">
                                    <label>Estimate Shipping & Taxes</label>
                                </li>
                            </ul>
                            <ul class="user_info">
                                <li class="single_field">
                                    <label>Country:</label>
                                    <select>
                                        <option>United States</option>
                                        <option>Bangladesh</option>
                                        <option>UK</option>
                                        <option>India</option>
                                        <option>Pakistan</option>
                                        <option>Ucrane</option>
                                        <option>Canada</option>
                                        <option>Dubai</option>
                                    </select>

                                </li>
                                <li class="single_field">
                                    <label>Region / State:</label>
                                    <select>
                                        <option>Select</option>
                                        <option>Dhaka</option>
                                        <option>London</option>
                                        <option>Dillih</option>
                                        <option>Lahore</option>
                                        <option>Alaska</option>
                                        <option>Canada</option>
                                        <option>Dubai</option>
                                    </select>

                                </li>
                                <li class="single_field zip-field">
                                    <label>Zip Code:</label>
                                    <input type="text">
                                </li>
                            </ul>
                            <a class="btn btn-default update" href="">Get Quotes</a>
                            <a class="btn btn-default check_out" href="">Continue</a>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="total_area">
                            <ul>
                                <li>Cart Sub Total <span>$59</span></li>
                                <li>Eco Tax <span>$2</span></li>
                                <li>Shipping Cost <span>Free</span></li>
                                <li>Total <span>$61</span></li>
                            </ul>
                            <a class="btn btn-default update" href="">Update</a>
                            <a class="btn btn-default check_out" href="">Check Out</a>
                        </div>
                    </div>
                </div>
            </div>
        </section><!--/#do_action-->


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