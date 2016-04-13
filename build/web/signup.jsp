<%-- 
    Document   : signup
    Created on : Mar 21, 2016, 8:31:58 PM
    Author     : Sachi
--%>

<%@page import="Controller.DBDatalist"%>
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
                <div class="col-md-12">
                    <%
                        if (request.getParameter("msg") != null) {
                            if (request.getParameter("msg").equals("error")) {
                    %>
                    <div class="col-md-12 text-center">
                        <label class="label-warning"><i class="fa fa-warning"></i> Warning:
                            Oopsee! Something went wrong. <br/>Please try again.</label><hr>
                    </div>
                    <%
                        }
                        if (request.getParameter("msg") == "available") {
                    %>
                    <div class="col-md-12 text-center">
                        <!--<div class="callout callout-danger" style="margin-bottom: 0!important;">-->												
                        <label class="label-warning"><i class="fa fa-warning"></i> Warning:
                            Username is available. Please try with another.</label><hr>
                        <!--</div>-->
                    </div>
                    <%
                            }
                        }
                    %>

                </div>

                <h2>Register</h2>
                <form action="saveuser" method="POST">
                    <div >
                        <div class="login-mail">
                            <input type="text" placeholder="First name" required="" name="fname">
                            <i class="fa fa-user"></i>
                        </div>
                        <div class="login-mail">
                            <input type="text" placeholder="Last name" required="" name="lname">
                            <i class="fa fa-user"></i>
                        </div>
                        <div class="login-mail">
                            <input name="NIC" type="text" placeholder="NIC" required="" maxlength="10" >

                            <i class="fa fa-credit-card"></i>
                        </div>
                        <div class="login-mail">
                            <!--<label class="col-sm-3 control-label ">Category :</label>-->
                            <div>
                                <select name="userlevel" id="category" class="form-control" >
                                    <option value = "select" selected = "">Select user level..</option>
                                    <option value = "0" >Admin</option>
                                    <option value = "1" >Branch admin</option>
                                    <option value = "1" >Sales staff</option>
                                </select>
                            </div>
                        </div>
                        <div class="login-mail">
                            <!--<label class="col-sm-3 control-label ">Category :</label>-->
                            <div>
                                <select name="branch" id="category" class="form-control" >
                                    <option value = "select" selected = "">Select branch..</option>
                                    <option value = "1" >Nugegoda</option>
                                    <option value = "2" >Rathnapura</option>

                                </select>
                            </div>
                        </div>
                        <div class="login-mail">
                            <input type="text" placeholder="Username" required="" name="uname">
                            <i class="fa fa-user"></i>
                        </div>
                        <div class="login-mail">
                            <input type="password" placeholder="Password" required="" name="pw">
                            <i class="fa fa-lock"></i>
                        </div>
                        <div class="login-mail">
                            <input type="password" placeholder="Repeat password" required="" name="pw2">
                            <i class="fa fa-lock"></i>
                        </div>
                        <a class="news-letter" href="#">
                            <label class="checkbox1"><input type="checkbox" name="checkbox" ><i> </i>I agree with the terms</label>
                        </a>

                    </div>
                    <div class=" login-do">
                        <label class="hvr-shutter-in-horizontal login-sub">
                            <!--<input type="submit" value="Submit">-->
                            <button type="submit" class="btn btn-primary">Register</button>
                        </label>
                        <p>Already registered?</p>
                        <a href="login.jsp" class="hvr-shutter-in-horizontal">Login</a>
                    </div>
                </form>
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

