<%-- 
    Document   : recentarrivals
    Created on : Apr 13, 2016, 12:12:32 PM
    Author     : Sachi
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Controller.DBDatalist"%>
<%@page import="Model.Book"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recent arrivals</title>
        <link rel="shortcut icon" href="admin/images/logo.png">
        <link href="admin/css/bootstrap.min.css" rel='stylesheet' type='text/css' />
        <link href="admin/css/style.css" rel='stylesheet' type='text/css' />
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
                                    <div class="bs-example2 bs-example-padded-bottom">
                                        <h3 class="head-top">Recent arrivals</h3>
                                        <p>List of books that are featured in the website under <a href="index.jsp" >recent arrivals </a> </p>
                                        <form class="form-horizontal">

                                            <div class="form-group">
                                                <div class="col-md-1">
                                                    <h4 class="table-header">#</h4>
                                                </div>
                                                <div class="col-md-4">
                                                    <h4 class="table-header">Title</h4>
                                                </div>
                                                <div class="col-md-4">
                                                    <h4 class="table-header">Type/Subject</h4>
                                                </div>

                                                <div class="col-md-3">
                                                    <h4 class="table-header">Purchased on</h4>
                                                </div>
                                            </div>

                                            <%                                                ArrayList<Book> arrBook = DBDatalist.getRecentBookList();
                                                if (arrBook != null) {
                                                    for (int i = 0; i < arrBook.size(); i++) {
                                                        Book book = (Book) arrBook.get(i);

                                            %>
                                            <div class="form-group">
                                                <div class="col-md-1">
                                                    <p><%= i + 1%> </p>
                                                </div>
                                                <div class="col-md-4">
                                                    <p ><%= book.getTitle()%></p>
                                                </div>
                                                <div class="col-md-4">
                                                    <p><%= book.getSubject().getType().getName() + " - " + book.getSubject().getName()%></p>
                                                </div>

                                                <div class="col-md-3">
                                                    <p><%= new SimpleDateFormat("dd-MM-yyyy").format(book.getPur_date())%></p>
                                                </div>

                                            </div>
                                            <%                                                    }
                                                }
                                            %>

                                        </form>

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
    </body>
</html>

