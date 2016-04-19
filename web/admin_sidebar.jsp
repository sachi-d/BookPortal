<%-- 
    Document   : admin_sidebar
    Created on : Mar 22, 2016, 1:42:40 PM
    Author     : Sachi
--%>

<%@page import="Model.Purchaserequest"%>
<%@page import="Model.Notification"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Controller.DBDatalist"%>
<%@page import="Model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

        <!--<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>-->
        <link href="admin/css/bootstrap.min.css" rel='stylesheet' type='text/css' />
        <!--<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />-->
        <!-- Custom Theme files -->
        <link href="admin/css/style.css" rel='stylesheet' type='text/css' />
        <link href="admin/css/font-awesome.css" rel="stylesheet"> 
        <script src="admin/js/jquery.min.js"></script>
        <script src="admin/js/bootstrap.min.js"></script>

        <!-- Mainly scripts -->
        <script src="admin/js/jquery.metisMenu.js"></script>
        <script src="admin/js/jquery.slimscroll.min.js"></script>
        <!-- Custom and plugin javascript -->
        <link href="admin/css/custom.css" rel="stylesheet">
        <script src="admin/js/custom.js"></script>
        <script src="admin/js/screenfull.js"></script>
        <script>
            $(function () {
                $('#supported').text('Supported/allowed: ' + !!screenfull.enabled);

                if (!screenfull.enabled) {
                    return false;
                }



                $('#toggle').click(function () {
                    screenfull.toggle($('#container')[0]);
                });



            });
        </script>
    </head>
    <%
        HttpSession ses = request.getSession();
        if (null == ses.getAttribute("user")) {
            response.sendRedirect("login.jsp");
        } else {
    %>
    <body>
        <%
            User u = (User) session.getAttribute("user");
        %>
        <nav class="navbar-default navbar-static-top" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <h1> <a class="navbar-brand" href="index.jsp">Book Portal</a></h1>         
            </div>
            <div class=" border-bottom">
                <!--                                                <div class="full-left">
                                                                    <section class="full-top">
                                                                        <button id="toggle"><i class="fa fa-arrows-alt"></i></button>	
                                                                    </section>
                                                                    <form class=" navbar-left-right">
                                                                        <input type="text"  value="Search..." onfocus="this.value = '';" onblur="if (this.value == '') {
                                                                                    this.value = 'Search...';
                                                                                }">
                                                                        <input type="submit" value="" class="fa fa-search">
                                                                    </form>
                                                                    <div class="clearfix"> </div>
                                                                </div>-->


                <!-- Brand and toggle get grouped for better mobile display -->

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="drop-men" >
                    <ul class=" nav_1">
                        <%
                            if (u.getUser_levelname().equals("Admin")) {
                        %>
                        <!-- - - - - - - - - - - - - - Purchase requests - - - - - - - - - - - - - - - - - -->
                        <li class="dropdown at-drop">
                            <%
                                ArrayList<Purchaserequest> arrPurchaserequest = DBDatalist.getNewPurreqList();
                                if (arrPurchaserequest != null) {
                            %>
                            <a href="#" class="dropdown-toggle dropdown-at " data-toggle="dropdown"><i class="fa fa-shopping-cart"></i> <% if (arrPurchaserequest.size() != 0) {%><span class="number"><%= arrPurchaserequest.size()%></span><%} %></a>
                            <ul class="dropdown-menu menu1 " role="menu" >

                                <%
                                    for (int i = 0; i < arrPurchaserequest.size(); i++) {
                                        Purchaserequest pur = (Purchaserequest) arrPurchaserequest.get(i);

                                %>
                                <li><a href="purreqview.jsp">

                                        <div class="user-new">
                                            <p>New purchase request</p>
                                            <span><%=  pur.getIdbill().getDate() %></span>
                                        </div>
                                        <div class="user-new-left">
                                            <i class="fa fa-shopping-cart"></i>
                                        </div>
                                        <div class="clearfix"> </div>
                                    </a>
                                </li>
                                <%                                        }
                                    }
                                %>

                                <li><a href="purreqview.jsp" class="view">View all purchase requests</a></li>
                            </ul>
                        </li>
                        <%
                            }
                        %>
                        <li class="dropdown at-drop">
                            <%
                                ArrayList<Notification> arrNotification = DBDatalist.getNewNotificationsforUser(u.getIduser());
                                if (arrNotification != null) {
                            %>
                            <a href="#" class="dropdown-toggle dropdown-at " data-toggle="dropdown"><i class="fa fa-globe"></i> <% if (arrNotification.size() != 0) {%><span class="number"><%= arrNotification.size()%></span><%} %></a>
                            <ul class="dropdown-menu menu1 " role="menu" >

                                <%
                                    for (int i = 0; i < arrNotification.size(); i++) {
                                        Notification not = (Notification) arrNotification.get(i);

                                %>
                                <li><a href="notificationview.jsp">

                                        <div class="user-new">
                                            <p><%=  not.getMessage()%></p>
                                            <span><%=  not.getTimestamp()%></span>
                                        </div>
                                        <div class="user-new-left">
                                            <%
                                                if (not.getType().equals("UserReg")) {    %>
                                            <i class="fa fa-user-plus"></i>
                                            <%
                                            } else if (not.getType().equals("ReportAlert")) {
                                            %>
                                            <i class="fa fa-pencil"></i>
                                            <%
                                                }
                                            %>

                                        </div>
                                        <div class="clearfix"> </div>
                                    </a>
                                </li>
                                <%                                        }
                                    }
                                %>

                                <li><a href="notificationview.jsp" class="view">View all notifications</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle dropdown-at" data-toggle="dropdown"><span class=" name-caret"><%= u.getFullname()%><i class="caret"></i></span><img src="admin/images/user.png" alt="profile pic"></a>
                            <ul class="dropdown-menu " role="menu">
                                <li><a href="signout"><i class="fa fa-user"></i>Logout</a></li>
                            </ul>
                        </li>

                    </ul>
                </div><!-- /.navbar-collapse -->
                <div class="clearfix">
                </div>
                <div class="navbar-default sidebar" role="navigation">
                    <div class="sidebar-nav navbar-collapse">
                        <ul class="nav" id="side-menu">
                            <li>
                                <a href="inventoryview.jsp" class=" hvr-bounce-to-right"><i class="fa fa-book nav_icon"></i> <span class="nav-label">Inventory</span> </a>
                            </li>
                            <li>
                                <a href="stockview.jsp" class=" hvr-bounce-to-right"><i class="fa fa-pie-chart nav_icon"></i> <span class="nav-label">Branch stock</span> </a>
                            </li>
                            <li>
                                <a href="issuebill.jsp" class=" hvr-bounce-to-right"><i class="fa fa-file-text-o nav_icon"></i> <span class="nav-label">Issue a bill</span> </a>
                            </li>
                            <li>
                                <a href="branchview.jsp" class=" hvr-bounce-to-right"><i class="fa fa-sitemap nav_icon"></i> <span class="nav-label">Branches</span> </a>
                            </li>
                            <li>
                                <a href="featuredbooks.jsp" class=" hvr-bounce-to-right"><i class="fa fa-star nav_icon"></i> <span class="nav-label">Featured books</span> </a>
                            </li>
                            <li>
                                <a href="recentarrivals.jsp" class=" hvr-bounce-to-right"><i class="fa fa-clock-o nav_icon"></i> <span class="nav-label">Recent arrivals</span> </a>
                            </li>
                            <li>
                                <a href="userlogview.jsp" class=" hvr-bounce-to-right"><i class="fa fa-users nav_icon"></i> <span class="nav-label">User logs</span> </a>
                            </li>
                            <li>
                                <a href="generalreports.jsp" class=" hvr-bounce-to-right"><i class="fa fa-line-chart nav_icon"></i> <span class="nav-label">General reports</span> </a>
                            </li>
                            <li>
                                <a href="branchreports.jsp" class=" hvr-bounce-to-right"><i class="fa fa-th-large nav_icon"></i> <span class="nav-label">Branch reports</span> </a>
                            </li>
                            <li>
                                <a href="billview.jsp" class=" hvr-bounce-to-right"><i class="fa fa-th-list nav_icon"></i> <span class="nav-label">Issued bills</span> </a>
                            </li>

                        </ul>
                    </div>
                </div>
            </div>
        </nav>
        <script src="admin/js/jquery.nicescroll.js"></script>
        <script src="admin/js/scripts.js"></script>
    </body>
    <%
        }
    %>
</html>
