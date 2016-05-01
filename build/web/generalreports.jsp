<%-- 
    Document   : generalreports
    Created on : Mar 24, 2016, 6:29:50 PM
    Author     : Sachi
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Controller.DBDatalist"%>
<%@page import="Controller.DBDatalist"%>
<%@page import="Model.Report"%>
<%@page import="Model.Report"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>General reports</title>
        <link rel="shortcut icon" href="admin/images/logo.png">
        <link href="admin/css/hover.css" rel="stylesheet"> 
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


                            <!-- ----------------------GENERAL REPORTS TABLE ----------------->
                            <div class="col-md-12">
                                <h3 class="head-top">General reports</h3>

                                <div class="but_list">
                                    <div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
                                        <ul id="myTab" class="nav nav-tabs" role="tablist">
                                            <li role="presentation" class="active"><a href="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">Monthly reports</a></li>
                                            <li role="presentation"><a href="#profile" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profile">Annual reports</a></li>
                                        </ul>
                                        <div id="myTabContent" class="tab-content">
                                            <div role="tabpanel" class="tab-pane fade in active" id="home" aria-labelledby="home-tab">
                                                <!-- ---------------------------MONTHLY BRANCH REPORTS ----------------------------------------->
                                                <table class="tg" id="table_general_month">
                                                    <thead>
                                                        <tr>
                                                            <th class="tg-yw4l">Year</th>
                                                            <th class="tg-yw4l">Month</th>
                                                            <th class="tg-yw4l">Open report</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <%  
                                                            ArrayList<Report> arrReport = DBDatalist.getCustomReportList("MG");
                                                            if (arrReport != null) {
                                                                for (int i = 0; i < arrReport.size(); i++) {
                                                                    Report report = (Report) arrReport.get(i);

                                                        %>
                                                        <tr>
                                                            <td class="tg-yw40"><%= report.getYear()%></td>
                                                            <td class="tg-yw40"><%= report.getMonth()%></td>
                                                            <td class="tg-yw40"><a href="<%= report.getLocation()%>" target="blank"><%= report.getTitle()%></a></td>
                                                        </tr>
                                                        <%  }
                                                            }
                                                        %>
                                                    </tbody>

                                                </table>
                                            </div>
                                            <div role="tabpanel" class="tab-pane fade" id="profile" aria-labelledby="profile-tab">

                                                <!-- ---------------------------ANNUAL BRANCH REPORTS ----------------------------------------->
                                                <table class="tg" id="table_general_annual">
                                                    <thead>
                                                        <tr>
                                                            <th class="tg-yw4l">Year</th>
                                                            <th class="tg-yw4l">Open report</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <%
                                                            ArrayList<Report> arrReport2 = DBDatalist.getCustomReportList("AG");
                                                            if (arrReport != null) {
                                                                for (int i = 0; i < arrReport2.size(); i++) {
                                                                    Report report = (Report) arrReport2.get(i);

                                                        %>
                                                        <tr>
                                                            <td class="tg-yw40"><%= report.getYear()%></td>
                                                            <td class="tg-yw40"><a href="<%= report.getLocation()%>" target="blank"><%= report.getTitle()%></a></td>
                                                        </tr>
                                                        <%  }
                                                            }
                                                        %>
                                                    </tbody>

                                                </table>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="clearfix"> </div>


                        </div>
                        <!----->

                    </div>
                    <%@include file="admin_footer.jsp" %>
                </div>
            </div>
            <div class="clearfix"></div>
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
                $("#table_general_month").DataTable();
                $("#table_general_annual").DataTable();
            });
        </script>
    </body>
</html>
