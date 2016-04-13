<%-- 
    Document   : userlogview
    Created on : Mar 23, 2016, 9:59:36 AM
    Author     : Sachi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User logs</title>

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


                            <!-- ----------------------USER LOGS TABLE ----------------->
                            <div class="col-md-12">
                                <h3 class="head-top">User logs</h3>
                                <table class="tg" id="table_user">
                                    <thead>
                                        <tr>
                                            <th class="tg-yw4l">Timestamp</th>
                                            <th class="tg-yw4l">Username</th>
                                            <th class="tg-yw4l">User level</th>
                                            <th class="tg-yw4l">IP</th>

                                        </tr> 
                                    </thead>

                                    <tbody>
                                        <%
                                            for (int i = 0; i < 15; i++) { %>
                                        <tr>
                                            <td class="tg-yw40">njkg gfdkgln fdgjvksdjfg</td>
                                            <td class="tg-yw40">rol" id="exampleInputEmail1"></td>
                                            <td class="tg-yw40">input type="text" class="for</td>
                                            <td class="tg-yw40">rm-control" id="exkkk</td>

                                        </tr>
                                        <%  }
                                        %>
                                    </tbody>


                                </table>

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
        <!-- jQuery 2.1.4 -->
        <script src="plugins/jQuery/jQuery-2.1.4.min.js"></script>
        <script src="plugins/jQueryUI/jquery-ui.js"></script>
        <!-- Bootstrap 3.3.2 JS -->
        <script src="js/bootstrap.min.js"></script>
        <!-- DATA TABES SCRIPT -->
        <script src="plugins/datatables/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="plugins/datatables/dataTables.bootstrap.min.js" type="text/javascript"></script>

        <script type="text/javascript" src="plugins/jQueryUI/jquery-ui.js"></script>

        <script type="text/javascript">
            $(function () {
                $("#table_user").DataTable();
            });
        </script>
    </body>
</html>
