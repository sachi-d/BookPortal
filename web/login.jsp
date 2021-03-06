<%-- 
    Document   : login
    Created on : Mar 21, 2016, 9:15:04 PM
    Author     : Sachi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Login</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="shortcut icon" href="admin/images/logo.png">

        <link href="admin/css/bootstrap.min.css" rel='stylesheet' type='text/css' />
        <!-- Custom Theme files -->
        <link href="admin/css/style.css" rel='stylesheet' type='text/css' />
        <link href="admin/css/font-awesome.css" rel="stylesheet"> 
        <script src="admin/js/jquery.min.js"></script>
        <script src="admin/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="login">
            <h1><a href="site/home.jsp" target="blank">Book Portal </a></h1>

            <div class="login-bottom">
                <div class="col-md-12">
                    <%                        if (request.getParameter("msg") != null) {
                            if (request.getParameter("msg").equals("error")) {
                    %>
                    <div class="col-md-12 text-center">
                        <label class="alert alert-warning"><i class="fa fa-warning"></i> Warning:
                            Login failed. <br/>Please try again.</label><hr>
                    </div>
                    <%
                        }
                        if (request.getParameter("msg").equals("success")) {
                    %>
                    <div class="col-md-12 text-center">
                        <label class="alert alert-success"><i class="fa fa-check"></i> Success:
                            Login successful</label><hr>
                    </div>
                    <%
                            }
                        }
                    %>

                </div>
                <h2>Login</h2>
                <form action="login" method="POST">
                    <div class="col-md-6">
                        <div class="login-mail">
                            <input type="text" placeholder="Username" required="" name="uname">
                            <i class="fa fa-user"></i>
                        </div>
                        <div class="login-mail">
                            <input type="password" placeholder="Password" required="" name="pw">
                            <i class="fa fa-lock"></i>
                        </div>
                    </div>
                    <div class="col-md-6 login-do">
                        <label class="hvr-shutter-in-horizontal login-sub">
                            <input type="submit" value="login">
                        </label>
                        <p>Do not have an account?</p>
                        <a href="signup.jsp" class="hvr-shutter-in-horizontal">Signup</a>
                    </div>

                    <div class="clearfix"> </div>
                </form>
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

