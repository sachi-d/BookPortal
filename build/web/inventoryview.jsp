<%-- 
    Document   : inventoryview
    Created on : Mar 22, 2016, 5:15:58 PM
    Author     : Sachi
--%>

<%@page import="Model.Subject"%>
<%@page import="Model.Type"%>
<%@page import="Model.Language"%>
<%@page import="sun.reflect.LangReflectAccess"%>
<%@page import="Model.Publisher"%>
<%@page import="Model.Author"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Controller.DBDatalist"%>
<%@page import="Model.Book"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inventory</title>
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
                                            Item added successfully.</label><hr>
                                    </div>
                                    <%
                                            }
                                        }
                                    %>

                                </div>

                                <div class="col-md-12" >
                                    <form action="bookinsert.jsp">
                                    <div class="col-md-4 pull-left">
                                        <h3 >Inventory</h3>
                                    </div>
                                    <div class="col-md-4">

                                    </div>
                                    <div class="col-md-4 ">
                                        
                                            <button class="btn btn-lg btn-default pull-right"  >Add new item <img src="admin/images/add.png" alt="Add Branch" style="width: 20px;height: 20px;"></button>
                                        
                                    </div>
                                    </form>
                                        
                                </div>

                                <!-- ---------------- BOOKS TABLE ------------------------------->
                                <div class="col-md-12">

                                    <table class="tg" id="table_book">
                                        <thead>
                                            <tr>
                                                <th class="tg-inv1">ISBN</th>
                                                <th class="tg-inv1">Title</th>
                                                <th class="tg-inv1">Author(s)</th>
                                                <th class="tg-inv1">Type</th>
                                                <th class="tg-inv1">Subject</th>
                                                <th class="tg-inv1">Language</th>
                                                <th class="tg-inv1">Publisher</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%                                                ArrayList<Book> arrBook = DBDatalist.getBookList();
                                                if (arrBook != null) {
                                                    for (int i = 0; i < arrBook.size(); i++) {
                                                        Book book = (Book) arrBook.get(i);

                                            %>
                                            <tr>
                                                <td class="tg-yw40"><%= book.getISBN()%></td>
                                                <td class="tg-yw40"><%= book.getTitle()%></td>
                                                <td class="tg-yw40"><% for (int j = 0; j < book.getAuthors().size(); j++) {%>
                                                    <%= book.getAuthors().get(j).toString()%> <br>
                                                    <% }%></td>
                                                <td class="tg-yw40"><%= book.getSubject().getType().getName()%></td>
                                                <td class="tg-yw40"><%= book.getSubject().getName()%></td>
                                                <td class="tg-yw40"><%= book.getLanguage()%></td>
                                                <td class="tg-yw40"><%= book.getPublisher().getName()%></td>
                                            </tr>
                                            <%                                                    }
                                                }%>

                                        </tbody>
                                    </table>


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
        <script type="text/javascript">
            function removeOptions(selectbox) {
                var i;
                for (i = selectbox.options.length - 1; i >= 0; i--) {
                    selectbox.remove(i);
                }
            }



        </script>      

    </body>
</html>
