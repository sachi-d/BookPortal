<%-- 
    Document   : viewuser
    Created on : Apr 16, 2016, 11:29:40 AM
    Author     : Sachi
--%>

<%@page import="Model.Report"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Book"%>
<%@page import="Model.Book"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View user</title>
        <link rel="shortcut icon" href="admin/images/logo.png">

        <link href="admin/css/bootstrap.min.css" rel='stylesheet' type='text/css' />

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
    </head>
    <body>
        <%@include file="admin_sidebar.jsp" %>
        <div id="wrapper">
            <!----->

            <div id="page-wrapper" class="gray-bg dashbard-1">
                <div class="content-main">
                    <div class="grid-form" >
                        <div class="grid-form1"> 
                            <div class="col-md-12">

                                <h3 class="head-top">User details</h3>
                                <%                                    if (request.getParameter("msg") != null) {
                                        if (request.getParameter("msg").equals("success")) {
                                %>
                                <label class="label label-success">User accepted sucessfully</label>
                                <%
                                } else if (request.getParameter("msg").equals("error")) {
                                %>
                                <label class="label label-warning">User not accepted. <br> Please try again</label>
                                    <%
                                    } else if (request.getParameter("msg").equals("rejected")) {
                                    %>
                                <label class="label label-default">User rejected. </label>
                                <%
                                        }
                                    }

                                    if (request.getParameter("user") != null) {
                                        int iduser = Integer.parseInt(request.getParameter("user"));
                                        User u = DBDatalist.getUser(iduser);
                                %>
                                <form class="form-horizontal">
                                    <div class="form-group">
                                        <div class="col-md-2"></div>
                                        <label class="col-md-2 "> Full name : </label>
                                        <div class="col-md-8">
                                            <p> <%= u.getFullname()%> </p>
                                        </div>

                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-2"></div>
                                        <label class="col-md-2 "> Branch : </label>
                                        <div class="col-md-8">
                                            <p> <%= u.getBranch().getName()%> </p>
                                        </div>

                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-2"></div>
                                        <label class="col-md-2 "> User level : </label>
                                        <div class="col-md-8">
                                            <p> <%= u.getUser_levelname()%> </p>
                                        </div>

                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-2"></div>
                                        <label class="col-md-2 "> User name : </label>
                                        <div class="col-md-8">
                                            <p> <%= u.getUsername()%> </p>
                                        </div>

                                    </div>
                                    <div class="form-group">
                                        <hr>
                                    </div>
                                    <%
                                        User myuser = (User) session.getAttribute("user");
                                        if(u.getStatus()==2){
                                    %>
                                    <div class="form-group">
                                        <div class="col-md-2"></div>
                                        <div class="col-md-2">
                                            <a href="executenotification?para=accept&user=<%= iduser%>"><button class="btn-sm btn-success" type="button">Accept <span class='fa fa-check'></span></button></a>
                                        </div>
                                        <div class="col-md-2">
                                            <a href="executenotification?para=reject&user=<%= iduser%>"><button class="btn-sm btn-danger" type="button">Reject <span class='fa fa-remove'></span></button></a>
                                        </div>
                                        <div class="col-md-2">
                                            <a href="notificationview.jsp"><button class="btn-sm btn-default" type="button">Go back <span class='fa fa-arrow-right'></span></button></a>

                                        </div>
                                        <div class="col-md-4"></div>
                                    </div>
                                    <%
                                        }
                                    %>


                                </form>
                                <%  }%>

                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                    <%@include file="admin_footer.jsp" %>
                </div>
            </div>
            <!--<div class="clearfix"></div>-->
        </div>
        <script src="admin/js/jquery.nicescroll.js"></script>
        <script src="admin/js/scripts.js"></script>

        <!-- jQuery 2.1.4 -->
        <script src="plugins/jQuery/jQuery-2.1.4.min.js"></script>
        <script src="plugins/jQueryUI/jquery-ui.js"></script>
        <!-- Bootstrap 3.3.2 JS -->
        <script src="js/bootstrap.min.js"></script>
        <!-- DATA TABES SCRIPT -->



        <script type="text/javascript" src="plugins/jQueryUI/jquery-ui.js"></script>
        <script type="text/javascript" src="js/jquery-ui-1.10.3.custom.min.js"></script>
        <script type="text/javascript" src="js/portBox.slimscroll.min.js"></script>
        <script type="text/javascript" src="js/validation.js"></script>

        <script type="text/javascript">
            $(function () {
                $("#table_notification").DataTable();
            });

            function goto(target) {
                location.href = target;
            }
            ;
        </script>


    </body>
</html>
