<%-- 
    Document   : signup
    Created on : Mar 21, 2016, 8:31:58 PM
    Author     : Sachi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Signup</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <!--<meta name="keywords" content="Minimal Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template,--> 
        <!--Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />-->
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <link href="admin/css/bootstrap.min.css" rel='stylesheet' type='text/css' />
        <!-- Custom Theme files -->
        <link href="admin/css/style.css" rel='stylesheet' type='text/css' />
        <link href="admin/css/font-awesome.css" rel="stylesheet"> 
        <link rel="shortcut icon" href="admin/images/logo.png">
        <script src="admin/js/jquery.min.js"></script>
        <script src="admin/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="login">
            <h1><a href="index.jsp">Book Portal </a></h1>
            <div class="login-bottom">
                <h2>Register</h2>
                <div >
                    <div class="login-mail">
                        <input type="text" placeholder="First name" required="">
                        <i class="fa fa-envelope"></i>
                    </div>
                    <div class="login-mail">
                        <input type="text" placeholder="Last name" required="">
                        <i class="fa fa-user"></i>
                    </div>
                    <div class="login-mail">
                        <input type="text" placeholder="NIC" required="">
                        <i class="fa fa-user"></i>
                    </div>
                    <div class="login-mail">
                        <!--<label class="col-sm-3 control-label ">Category :</label>-->
                        <div>
                            <select name="category" id="category" class="form-control" >
                                <option value = "select" selected = "">Select user level..</option>
                                <option value = "National" >vdfgvdf</option>
                                <option value = "Provincial" >fddfdbsb</option>

                            </select>
                        </div>
                    </div>
                    <div class="login-mail">
                        <input type="text" placeholder="Username" required="">
                        <i class="fa fa-user"></i>
                    </div>
                    <div class="login-mail">
                        <input type="password" placeholder="Password" required="">
                        <i class="fa fa-lock"></i>
                    </div>
                    <div class="login-mail">
                        <input type="password" placeholder="Repeat password" required="">
                        <i class="fa fa-lock"></i>
                    </div>
                    <a class="news-letter" href="#">
                        <label class="checkbox1"><input type="checkbox" name="checkbox" ><i> </i>I agree with the terms</label>
                    </a>

                </div>
                <div class=" login-do">
                    <label class="hvr-shutter-in-horizontal login-sub">
                        <input type="submit" value="Submit">
                    </label>
                    <p>Already registered?</p>
                    <a href="login.jsp" class="hvr-shutter-in-horizontal">Login</a>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
        <!---->
        <%@include file="admin_footer.jsp" %>

        <!---->
        <!--scrolling js-->
        <script src="admin/js/jquery.nicescroll.js"></script>
        <script src="admin/js/scripts.js"></script>
        <!--//scrolling js-->
    </body>
</html>

