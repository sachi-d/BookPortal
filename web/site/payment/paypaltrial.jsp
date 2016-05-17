<%-- 
    Document   : paypaltrial
    Created on : May 13, 2016, 8:20:57 AM
    Author     : Sachi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!--<meta http-equiv=Content-Type content=text/html; charset=UTF-8>-->
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="POST"> 
            <input type="hidden" name="business" value="bookportal@bookportal.lk"><!--Your business account details-->        
            <input type="hidden" name="cmd" value="_xclick">        
            <input type="hidden" name="item_name" value="Item name"><!--Buying item name-->
            <input type="hidden" name="amount" value="item value"><!--Buying item value-->
            <input type="hidden" name="currency_code" value="USD">
            <input type="hidden" name="return" value="http://localhost:8080/BookPortal/site/payment/paypalsuccess.jsp"><!--Where to return to after successful transaction-->
            <input type="hidden" name="rm" value="2">
            <input type="hidden" name="cancel_return" value="http://localhost:8080/BookPortal/site/payment/paypalcancel.jsp"> <!--Where to return to after cancelling a transaction-->
            <input type="image" name="submit" src="https://www.paypal.com/en_US/i/btn/btn_buynow_LG.gif" alt="PayPal - The safer, easier way to pay online">
            <img alt="" border="0" width="1" height="1" src="https://www.paypal.com/en_US/i/scr/pixel.gif" >
        </form>


    </body>
</html>
