<%-- 
    Document   : purreqview
    Created on : Apr 18, 2016, 9:54:00 PM
    Author     : Sachi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Purchase requests</title>
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
                                    <%                                        String msg = request.getParameter("msg");
                                        if (msg != null) {
                                            if (msg.equals("error")) {
                                    %>
                                    <label class="label label-warning">Something went wrong. <br> Please try again.</label>
                                        <%
                                        } else {
                                        %>
                                    <label class="label label-success">Request marked as <%= msg%></label>
                                    <div><br></div>
                                        <%                                        }
                                            }
                                        %>
                                </div>
                                <h3 class="head-top">Purchase requests</h3>
                                <div class="but_list">
                                    <div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
                                        <ul id="myTab" class="nav nav-tabs" role="tablist">
                                            <li role="presentation" class="active"><a href="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">New purchase requests</a></li>
                                            <li role="presentation"><a href="#profile" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profile">All purchase requests</a></li>
                                        </ul>
                                        <div id="myTabContent" class="tab-content">
                                            <div role="tabpanel" class="tab-pane fade in active" id="home" aria-labelledby="home-tab">

                                                <!-- - - - - - - - - - - - - - - - - - - - - NEW NOTIFICATIONS - - - - - - - - - - - - - - - - - - - - -->
                                                <div class="form-horizontal">
                                                    <div class="form-group">
                                                        <div class="col-md-2">
                                                            <h5 class="table-header">Customer </h5>
                                                        </div>

                                                        <div class="col-md-4">
                                                            <h5 class="table-header">Address</h5>
                                                        </div>
                                                        <div class="col-md-2">
                                                            <h5 class="table-header">Bill details</h5>
                                                        </div>

                                                        <div class="col-md-2">
                                                            <h5 class="table-header">Status</h5>
                                                        </div>
                                                        <div class="col-md-2">
                                                            <h5 class="table-header">Action</h5>
                                                        </div>
                                                        <hr>
                                                    </div>
                                                    <%
                                                        ArrayList<Purchaserequest> arrPurchase = DBDatalist.getNewPurreqList();
                                                        if (arrPurchase != null) {
                                                            for (int i = 0; i < arrPurchase.size(); i++) {
                                                                Purchaserequest pur = (Purchaserequest) arrPurchase.get(i);

                                                    %>

                                                    <div class="form-group">
                                                        <div class="col-md-2">
                                                            <h5 ><%= pur.getCustomer()%> </h5>
                                                        </div>

                                                        <div class="col-md-4">
                                                            <h5 ><%= pur.getAddress()%></h5>
                                                        </div>
                                                        <div class="col-md-2">
                                                            <a href="billdetailsview.jsp?purreq=<%= pur.getIdpurreq()%>">View bill details</a>
                                                        </div>
                                                        <%
                                                            String stat = pur.getStatus();
                                                            if (stat.equals("New")) {
                                                        %>
                                                        <div class="col-md-2">
                                                            <label class="label label-warning">New</label>
                                                        </div>
                                                        <div class="col-md-2">
                                                            <a href="executepurreq?para=accept&pur=<%= pur.getIdpurreq()%>"><button class="btn-xs btn-success" type="button">Accept <span class='fa fa-check'></span></button></a>
                                                        </div>
                                                        <%
                                                        } else if (stat.equals("Accepted")) {
                                                        %>
                                                        <div class="col-md-2">
                                                            <label class="label label-primary">Accepted</label>
                                                        </div>
                                                        <div class="col-md-2">
                                                            <a href="executepurreq?para=process&pur=<%= pur.getIdpurreq()%>"><button class="btn-xs btn-danger" type="button">Close<span class='fa fa-remove'></span></button></a>
                                                        </div>
                                                        <%
                                                            }
                                                        %>
                                                        <hr>
                                                    </div>
                                                    <%                                        }

                                                    } else {
                                                    %>
                                                    <label class="label label-default">No new purchase requests</label>
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
                                                            <th class="tg-yw4l">Customer</th>
                                                            <th class="tg-yw4l">Address</th>
                                                            <th class="tg-yw4l">Bill Id</th>
                                                            <th class="tg-yw4l">Status</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <%
                                                            ArrayList<Purchaserequest> arrPurchaserequest2 = DBDatalist.getPurreqList();
                                                            if (arrPurchaserequest2 != null) {

                                                                for (int i = 0; i < arrPurchaserequest2.size(); i++) {
                                                                    Purchaserequest pur = (Purchaserequest) arrPurchaserequest2.get(i);

                                                        %>
                                                        <tr>
                                                            <td class="tg-yw40"><%= pur.getIdbill().getDate()%></td>
                                                            <td class="tg-yw40"><%= pur.getCustomer()%></td>
                                                            <td class="tg-yw40"><%= pur.getAddress()%></td>
                                                            <td class="tg-yw40"><%= pur.getIdbill().getIdbill()%></td>
                                                            <td class="tg-yw40"><%= pur.getStatus()%></td>
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
