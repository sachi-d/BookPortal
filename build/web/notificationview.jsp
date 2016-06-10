<%-- 
    Document   : inventoryinsert
    Created on : Mar 22, 2016, 5:33:36 PM
    Author     : Sachi
--%>

<%@page import="java.awt.Label"%>
<%@page import="Model.Report"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Book"%>
<%@page import="Model.Book"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Notifications</title>
        <link rel="shortcut icon" href="admin/images/logo.png">

        <link href="admin/css/bootstrap.min.css" rel='stylesheet' type='text/css' />
        <!-- DATA TABLES -->
        <link href="plugins/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
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
                                <div class="col-md-12">
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
                                    } else if (request.getParameter("msg").equals("ignoresuccess")) {
                                    %>
                                    <label class="label label-default">Message marked as read. </label>

                                    <%
                                        }
                                    %><div><br></div><%
                                        }
                                        %>
                                </div>
                                <h3 class="head-top">Notifications</h3>
                                <div class="but_list">
                                    <div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
                                        <ul id="myTab" class="nav nav-tabs" role="tablist">
                                            <li role="presentation" class="active"><a href="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">Unread notifications</a></li>
                                            <li role="presentation"><a href="#profile" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profile">All notifications</a></li>
                                        </ul>
                                        <%
                                            if (null != session.getAttribute("user")) {
                                        %>
                                        <div id="myTabContent" class="tab-content">
                                            <div role="tabpanel" class="tab-pane fade in active" id="home" aria-labelledby="home-tab">

                                                <!-- - - - - - - - - - - - - - - - - - - - - NEW NOTIFICATIONS - - - - - - - - - - - - - - - - - - - - -->
                                                <div class="form-horizontal">
                                                    <div class="form-group">
                                                        <div class="col-md-2">
                                                            <h5 class="table-header">Message </h5>
                                                        </div>

                                                        <div class="col-md-4">
                                                            <h5 class="table-header">New user / new report</h5>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <h5 class="table-header">Information</h5>
                                                        </div>

                                                        <div class="col-md-3">
                                                            <h5 class="table-header">Action</h5>
                                                        </div>

                                                        <hr>
                                                    </div>
                                                    <%
                                                        User ug = (User) session.getAttribute("user");
                                                        ArrayList<Notification> arrNotification = DBDatalist.getNewNotificationsforUser(ug.getIduser());
                                                        if (arrNotification.size() != 0) {
                                                            for (int i = 0; i < arrNotification.size(); i++) {
                                                                Notification not = arrNotification.get(i);

                                                    %>

                                                    <div class="form-group">
                                                        <div class="col-md-2">
                                                            <h5 ><%= not.getMessage()%> </h5>
                                                        </div>
                                                        <%
                                                            if (not.getType().equals("UserReg")) {
                                                        %>
                                                        <div class="col-md-4">
                                                            <h5 ><%= not.getNewuser().getFullname()%></h5>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <!--<button class="btn btn-link" data-toggle="modal" data-target="#myModal">View user details</button>-->
                                                            <!--                                                            <form action="viewuser" method="GET">
                                                                                                                            <input id="userid" name="userid" hidden="" value="">
                                                                                                                            <button type="submit" class="btn">View user details</button>
                                                                                                                        </form>-->
                                                            <a href="userview.jsp?user=<%= not.getNewuser().getIduser()%>">View user details</a>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <a href="executenotification?para=accept&user=<%= not.getNewuser().getIduser()%>&not=<%= not.getIdnotification()%>"><button class="btn-xs btn-success" type="button">Accept <span class='fa fa-check'></span></button></a>
                                                            <a href="executenotification?para=reject&user=<%= not.getNewuser().getIduser()%>&not=<%= not.getIdnotification()%>"><button class="btn-xs btn-danger" type="button">Reject <span class='fa fa-remove'></span></button></a>
                                                        </div>
                                                        <%
                                                        } else if (not.getType().equals("PurReqError")) {
                                                        %>
                                                        <div class="col-md-4">
                                                            <h5 style="color: red">Purchase request error</h5>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <p><%= not.getMessage()%></p>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <a href="executenotification?para=ignore&not=<%= not.getIdnotification()%>"><button class="btn-xs btn-default" type="button">Mark as read</button></a>
                                                        </div>
                                                        <%
                                                        } else {
                                                        %>
                                                        <div class="col-md-4">
                                                            <h5 ><%= not.getNewreport().getTitle()%></h5>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <%
                                                                if (not.getNewreport().getType().equals("MB") || not.getNewreport().getType().equals("AB")) {
                                                            %>
                                                            <a href="branchreports.jsp">Go to branch Reports</a>
                                                            <%
                                                            } else {
                                                            %>
                                                            <a href="generalreports.jsp">Go to general Reports</a>
                                                            <%
                                                                }
                                                            %>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <a href="executenotification?para=ignore&not=<%= not.getIdnotification()%>"><button class="btn-xs btn-default" type="button">Mark as read</button></a>
                                                        </div>
                                                        <%
                                                            }
                                                        %>

                                                        <hr>
                                                    </div>
                                                    <%                                        }

                                                    } else {
                                                    %>
                                                    <label class="label label-default">No new notifications</label>
                                                    <%
                                                        }

                                                    %>



                                                </div>

                                            </div>
                                            <div role="tabpanel" class="tab-pane fade" id="profile" aria-labelledby="profile-tab">

                                                <!-- - - - - - - - - - - - - - - - - - - - -ANNUAL BRANCH REPORTS - - - - - - - - - - - - - - - - - - - -->
                                                <table class="tg" id="table_notification">
                                                    <thead>
                                                        <tr>
                                                            <th class="tg-yw4l">Timestamp</th>
                                                            <th class="tg-yw4l">Message</th>
                                                            <th class="tg-yw4l">Type</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <%                                                            ArrayList<Notification> arrNotification2 = DBDatalist.getAllNotificationsforUser(ug.getIduser());
                                                            if (arrNotification2.size() != 0) {

                                                                for (int i = 0; i < arrNotification2.size(); i++) {
                                                                    Notification not = arrNotification2.get(i);

                                                        %>
                                                        <tr>
                                                            <td class="tg-yw40"><%= not.getTimestamp()%></td>
                                                            <%
                                                                if (not.getType().equals("UserReg")) {
                                                            %>
                                                            <td class="tg-yw40"><%= not.getNewuser().getFullname()%></td>
                                                            <td class="tg-yw40">New user registration</td>
                                                            <%
                                                            } else if (not.getType().equals("PurReqError")) {
                                                            %>
                                                            <td class="tg-yw40"><%= not.getMessage()%></td>
                                                            <td class="tg-yw40">Purchase request error</td>
                                                            <%
                                                            } else {
                                                            %>
                                                            <td class="tg-yw40"><%= not.getNewreport().getTitle() %></td>
                                                            <td class="tg-yw40">New report</td>
                                                            <%
                                                                }
                                                            %>

                                                        </tr>
                                                        <%  }
                                                            }
                                                        %>
                                                    </tbody>

                                                </table>
                                            </div>

                                        </div>
                                        <% } else {
                                                //response.sendError(404);
                                            }
                                        %>
                                    </div>
                                </div>


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
        <script src="plugins/datatables/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="plugins/datatables/dataTables.bootstrap.min.js" type="text/javascript"></script>

        <script type="text/javascript" src="plugins/jQueryUI/jquery-ui.js"></script>
        <script type="text/javascript" src="js/jquery-ui-1.10.3.custom.min.js"></script>
        <script type="text/javascript" src="js/portBox.slimscroll.min.js"></script>
        <script type="text/javascript" src="js/validation.js"></script>

        <script type="text/javascript">
            $(function () {
                $("#table_notification").DataTable();
            });
        </script>


    </body>
</html>
