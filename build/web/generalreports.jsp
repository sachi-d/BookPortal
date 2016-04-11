<%-- 
    Document   : generalreports
    Created on : Mar 24, 2016, 6:29:50 PM
    Author     : Sachi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>General reports</title>
        <link href="admin/css/hover.css" rel="stylesheet"> 
        <!-- DATA TABLES -->
        <link href="plugins/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
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
                                <table class="tg" id="table_gen_report">
                                    <thead>
                                        <tr>
                                        <th class="tg-yw4l">Year</th>
                                        <th class="tg-yw4l">Month</th>
                                        <th class="tg-yw4l">Open report</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            for (int i = 0; i < 10; i++) { %>
                                    <tr>
                                        <td class="tg-yw40">2014</td>
                                        <td class="tg-yw40">gesgrh</td>
                                        <td class="tg-yw40"><a href="">Open report</a></td>
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
                $("#table_gen_report").DataTable();
            });
        </script>
    </body>
</html>
