<%-- 
    Document   : currentstockview
    Created on : May 21, 2016, 9:54:31 PM
    Author     : Sachi
--%>

<%@page import="Model.Book"%>
<%@page import="Model.Stock"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Branch Stock</title>
        <link rel="shortcut icon" href="admin/images/logo.png">

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


                                <!-- - - - - - - - - - - - - - - - - - -STOCK TABLE - - - - - - - - - - - - - - - - - ----->
                                <div class="col-md-12" >
                                    <div class="col-md-4 pull-left">
                                        <h3 >Branch stock</h3>
                                    </div>
                                    <div class="col-md-8">

                                    </div>

                                </div>
                                <div class="col-md-12">

                                    <table class="tg" id="table_stock">
                                        <thead>
                                            <tr>
                                                <th class="tg-yw4l">Branch name</th>
                                                <th class="tg-yw4l">Book</th>
                                                <th class="tg-yw4l">Quantity</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%                                                ArrayList<Stock> arrStock = DBDatalist.getCurrentStockList();
                                                if (arrStock != null) {
                                                    for (int i = 0; i < arrStock.size(); i++) {
                                                        Stock stock = (Stock) arrStock.get(i);

                                            %>
                                            <tr>
                                                <td class="tg-yw40"><%= stock.getBranch().getName()%></td>
                                                <td class="tg-yw40"><%= stock.getBook().getTitle()%></td>
                                                <td class="tg-yw40"> <%= stock.getQuantity()%></td>
                                            </tr>
                                            <%  }
                                                }
                                            %>
                                        </tbody>
                                    </table>
                                </div>                             
                            </div>
                            <div class="clearfix"></div>
                        </div>
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
                $("#table_stock").DataTable();
            });
        </script>
    </body>
</html>

