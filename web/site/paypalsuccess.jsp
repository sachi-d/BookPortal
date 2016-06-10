<%-- 
    Document   : paypalsuccess
    Created on : May 13, 2016, 8:35:42 AM
    Author     : Sachi
--%>

<%@page import="Model.Purchaserequest"%>
<%@page import="Model.Bill"%>
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
        <%
            if (request.getParameter("payment_status").equals("Completed")) {
        %>

        <%@include file="header.jsp" %>

        <section id="cart_items">
            <%                         //                String mm=request.getParameter("item_name")+request.getParameter("item_number")+request.getParameter("payment_status")+request.getParameter("mc_gross")+
                //                        request.getParameter("mc_currency")+request.getParameter("txn_id")+request.getParameter("receiver_email")+request.getParameter("payer_email")+request.getParameter("custom");
//                String name = request.getParameter("first_name") +" "+ request.getParameter("last_name") + request.getParameter("address1") + request.getParameter("shipping_address");
                System.out.println("before getparam");
                String billedname = request.getParameter("first_name") + " " + request.getParameter("last_name");
                System.out.println("got name");
                String shippedname = (String) session.getAttribute("customer_name");
                String shippedaddress = (String) session.getAttribute("customer_address");
                HashMap<Book, Integer> items = shoppingCart.getItems();
                boolean addbill = Savebill.saveOnlineBill(shoppingCart);
                System.out.println("afteronlinebill");
                if (addbill) {
                    int idbill = Bill.getLastBillID();
                    String cus_name = billedname;
                    String cus_address = shippedaddress;
                    String cus_email = request.getParameter("receiver_email");
                    boolean setPur_req = Purchaserequest.insertPurchaseRequest(cus_name, cus_address, cus_email, idbill);
                    System.out.println("after purreq");
                    if (!setPur_req) {
                        Purchaserequest.notifyPaymentError(cus_name, cus_address, cus_email, idbill);
                    }
            %>
            <div class="container">
                <div class="col-md-12">
                    <form>
                        <div class="form-group">
                            <div class="col-md-12">Your bill was successfully added.</div>
                            <div class="col-md-3">  Bill ID : </div><div class="col-md-9"><%=idbill%> </div>
                            <div class="col-md-3">Paypal transaction ID :</div><div class="col-md-9"><%=request.getParameter("txn_id")%></div>
                            <div class="col-md-3">Total value : </div><div class="col-md-9"> <%=request.getParameter("mc_currency") + request.getParameter("mc_gross")%> = Rs. <%=shoppingCart.getTotal()%></div>
                            <div class="col-md-3">Billed to :</div><div class="col-md-9"><%=billedname%></div>
                            <div class="col-md-3">Shipped to :</div><div class="col-md-9"><%=shippedname%></div>
                            <div class="col-md-3"></div><div class="col-md-9"><%=shippedaddress%></div>
                            <div class="col-md-12"><hr></div>
                            <br>
                        </div>
                    </form>
                            <!--<hr><div class="clearfix"></div>-->
                </div>
                            
                <div class="table-responsive cart_info">

                    <table class="table table-condensed">
                        <%                            if (shoppingCart.getCartSize() != 0) {
                        %>
                        <thead>
                            <tr class="cart_menu">
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
        <%
            } else {
                response.sendRedirect("paypalcancel.jsp");
            }
        %>
    </body>
</html>