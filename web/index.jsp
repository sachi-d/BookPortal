<%-- 
    Document   : admin_home
    Created on : Apr 12, 2016, 7:56:46 PM
    Author     : Sachi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link rel="shortcut icon" href="admin/images/logo.png">
        <!-- DATA TABLES -->
        <link href="plugins/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        <!--<link rel="stylesheet" type="text/css" href="plugins/datatables/media/css/dataTables.bootstrap.css">-->

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
                                    if (request.getParameter("msg").equals("incorrect")) {
                                %>
                                <div class="col-md-12 text-center">
                                    <!--<div class="callout callout-danger" style="margin-bottom: 0!important;">-->												
                                    <label class="label-warning"><i class="fa fa-warning"></i> Warning:
                                        Incorrect details</label><hr>
                                    <!--</div>-->
                                </div>
                                <%
                                    }
                                    if (request.getParameter("msg").equals("success")) {
                                %>
                                <div class="col-md-12 text-center">
                                    <!--<div class="callout callout-danger" style="margin-bottom: 0!important;">-->												
                                    <label class="label-warning"><i class="fa fa-warning"></i> Warning:
                                        Success</label><hr>
                                    <!--</div>-->
                                </div>
                                <%
                                        }
                                    }
                                %>
                                <h3 class="head-top">Home</h3>

                                <!--                                <div class="full-left">
                                                                    <form class=" navbar-left-right" style="padding: 5px;border: 2px solid #c7c7c7;">
                                                                        <input type="text"  value="Search..." onfocus="this.value = '';" onblur="if (this.value == '') {
                                                                                    this.value = 'Search...';
                                                                                }">
                                                                        <input type="submit" value="" class="fa fa-search">
                                                                    </form>
                                                                    <div class="clearfix"> </div>
                                                                </div>-->

                                <!-- ---------------- BOOKS TABLE ------------------------------->
                                <div class="col-md-12">



                                </div>


                            </div>
                            <div class="clearfix"> </div>
                        </div>
                    </div>
                    <%@include file="admin_footer.jsp" %>
                </div>

            </div>
            <div class="clearfix"></div>
        </div>
        <script src="admin/js/jquery.nicescroll.js"></script>
        <script src="admin/js/scripts.js"></script>

        <!--        <script src="plugins/jQuery/jquery-1.12.2.min.js"></script>
                <script src="plugins/jQueryUI/jquery-ui.js"></script>
        
                <script src="admin/js/bootstrap.min.js"></script>
                 DATA TABES SCRIPT 
                <script src="plugins/datatables/media/js/jquery.dataTables.min.js" type="text/javascript"></script>
                <script src="plugins/datatables/media/js/dataTables.bootstrap.min.js" type="text/javascript"></script>-->


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
                $("#table_book").DataTable();
            });
        </script>
    </body>
  
</html>