<%-- 
    Document   : stockview
    Created on : Apr 15, 2016, 9:44:48 PM
    Author     : Sachi
--%>

<%@page import="Model.Book"%>
<%@page import="Model.Stock"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Purchases</title>
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
                                <div class="col-md-12">
                                    <%                        if (request.getParameter("msg") != null) {
                                            if (request.getParameter("msg").equals("error")) {
                                    %>
                                    <div class="col-md-12 text-center">
                                        <label class="alert alert-warning"><i class="fa fa-warning"></i> Warning:
                                            Oops! Something went wrong. <br/>Please try again.</label><hr>
                                    </div>
                                    <%
                                        }
                                        if (request.getParameter("msg").equals("success")) {
                                    %>
                                    <div class="col-md-12 text-center">
                                        <label class="alert alert-success"><i class="fa fa-check"></i> Success:
                                            Branch added successfully.</label><hr>
                                    </div>
                                    <%
                                            }
                                        }
                                    %>

                                </div>

                                <!-- - - - - - - - - - - - - - - - - - -STOCK TABLE - - - - - - - - - - - - - - - - - ----->
                                <div class="col-md-12" >
                                    <div class="col-md-4 pull-left">
                                        <h3 >Stock purchases</h3>
                                    </div>
                                    <div class="col-md-4">

                                    </div>
                                    <div class="col-md-4 ">
                                        <%
                                            User usr = (User) session.getAttribute("user");
                                            if (usr.getULevel() == 1) {
                                        %>
                                        <button class="btn btn-lg btn-default pull-right" data-toggle="modal" data-target="#myModal">Add new stock <img src="admin/images/add.png" alt="Add Branch" style="width: 20px;height: 20px;"></button>
                                            <%
                                                }
                                            %>
                                    </div>
                                </div>
                                <div class="col-md-12">

                                    <table class="tg" id="table_stock">
                                        <thead>
                                            <tr>
                                                <th class="tg-yw4l">Branch name</th>
                                                <th class="tg-yw4l">Book</th>
                                                <th class="tg-yw4l">Quantity</th>
                                                <th class="tg-yw4l">Date</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                ArrayList<Stock> arrStock = DBDatalist.getStockList();
                                                if (arrStock != null) {
                                                    for (int i = 0; i < arrStock.size(); i++) {
                                                        Stock stock = (Stock) arrStock.get(i);

                                            %>
                                            <tr>
                                                <td class="tg-yw40"><%= stock.getBranch().getName()%></td>
                                                <td class="tg-yw40"><%= stock.getBook().getTitle()%></td>
                                                <td class="tg-yw40"> <%= stock.getQuantity()%></td>
                                                <td class="tg-yw40"> <%= stock.getDate()%></td>
                                            </tr>
                                            <%  }
                                                }
                                            %>
                                        </tbody>

                                    </table>


                                </div>
                                <!-- - - - - - - - - - - - - - - - - - - ADD BRANCH - - - - - - - - - - - - - - - - - -->
                                <div class="bs-example2 bs-example-padded-bottom">

                                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                    <h2 class="modal-title">Add new branch stock</h2>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="grid-form1">

                                                        <form class="form-horizontal" action="savestock" method="POST">
                                                            <div class="form-group">
                                                                <label class="col-md-3 control-label"> Branch name :</label>
                                                                <div class="col-md-9">
                                                                    <% User u = (User) session.getAttribute("user");%>
                                                                    <input class="form-control" name="branch" disabled=""
                                                                           value="<%= u.getBranch().getName()%>">
                                                                    <input hidden="" value="<%= u.getBranch().getIdbranch()%>" name="idbranch">
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-md-3 control-label"> Book :</label>
                                                                <div class="col-sm-9">
                                                                    <!--                                                                    <input type="text" name="book" id="book">
                                                                                                                                        <input type="hidden" name="bookid" id="bookid">-->
                                                                    <select name="book" class="form-control">
                                                                        <option value="select" selected="" disabled="">Select..</option>
                                                                        <%
                                                                            ArrayList<Book> arrBook = DBDatalist.getBookList();
                                                                            if (arrBook != null) {

                                                                                for (int i = 0; i < arrBook.size(); i++) {
                                                                                    Book book = (Book) arrBook.get(i);
                                                                        %>
                                                                        <option value="<%=book.getIdbook()%>"><%=book.getTitle()%></option>
                                                                        <%
                                                                                }
                                                                            }
                                                                        %>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-md-3 control-label"> Quantity :</label>
                                                                <div class="col-md-9">
                                                                    <input class="form-control" name="quantity" type="number">
                                                                </div>
                                                            </div>


                                                            <div class="form-group">
                                                                <div class="col-md-3 "></div><div class="col-md-3 "></div>
                                                                <div class="col-md-3 ">
                                                                    <button type="submit" class="btn btn-primary ">Add new stock</button>
                                                                </div>
                                                                <div class="col-md-3 ">
                                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                                                </div>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <!--                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                                                                    <button type="button" class="btn btn-primary">Save changes</button>-->
                                                </div>
                                            </div><!-- /.modal-content -->
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

