<%-- 
    Document   : billview
    Created on : Apr 11, 2016, 12:04:42 AM
    Author     : Sachi
--%>

<%@page import="Model.Book"%>
<%@page import="java.util.HashMap"%>
<%@page import="Controller.DBDatalist"%>
<%@page import="Model.Bill"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Issued bills</title>

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


                            <!-- ----------------------ISSUED BILLS TABLE ----------------->
                            <div class="col-md-12">
                                <h3 class="head-top">Issued bills</h3>
                                <table class="tg" id="table_bill">
                                    <thead>
                                        <tr>
                                            <th class="tg-yw4l">Bill ID</th>
                                            <th class="tg-yw4l">Date</th>
                                            <th class="tg-yw4l">Branch</th>
                                            <th class="tg-yw4l">Processed by</th>
                                            <th class="tg-yw4l">Items</th>
                                            <th class="tg-yw4l">Quantity</th>
                                            <th class="tg-yw4l">Total</th>
                                            <th class="tg-yw4l">Payment method</th>
                                        </tr> 
                                    </thead>

                                    <tbody>
                                        <%                                            
                                            ArrayList<Bill> arrBill = DBDatalist.getBillList();
                                            if (arrBill != null) {
                                               
                                                for (int i = 0; i < arrBill.size(); i++) {
                                                    Bill bill = (Bill) arrBill.get(i);
                                        %>
                                        <tr>
                                            <td class="tg-yw40"><%= bill.getIdbill()%></td>
                                            <td class="tg-yw40"><%= bill.getDate()%></td>
                                            <td class="tg-yw40"><%= bill.getIssue_user().getBranch().getName() %></td>
                                            <td class="tg-yw40"><%= bill.getIssue_user().getFullname()%></td>
                                            <td class="tg-yw40">
                                                <%  HashMap<Book, Integer> h = bill.getItems();
                                                    for (Book b : h.keySet()) {
                                                %>
                                                <%= b.getTitle()%> <br>

                                                <%
                                                    }%></td>

                                            <td class="tg-yw40">
                                                <%
                                                    for (Integer q : h.values()) {
                                                %>
                                                <%= q %> <br>

                                                <%
                                                    }%></td>

                                            <td class="tg-yw40"><%= bill.getTotal()%></td>
                                            <td class="tg-yw40"><%= bill.getPaymethod()%></td>
                                        </tr>
                                        <%  }
                                            }
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
                $("#table_bill").DataTable();
            });
        </script>
    </body>
</html>

