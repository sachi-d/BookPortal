<%-- 
    Document   : featuredbooks
    Created on : Mar 22, 2016, 7:09:57 PM
    Author     : Sachi
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Controller.DBDatalist"%>
<%@page import="Model.Book"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Featured books</title>
        <link href="admin/css/bootstrap.min.css" rel='stylesheet' type='text/css' />
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

                                <h3 class="head-top">Featured books</h3>
                                <form class="form-horizontal" action="savebook">

                                    <div class="form-group">
                                        <div class="col-md-1">
                                            <h4 id="q">#</h4>
                                        </div>
                                        <div class="col-md-2">
                                            <h4 id="w">Status</h4>
                                        </div>
                                        <div class="col-md-3">
                                            <h4 id="e">Title</h4>
                                        </div>
                                        <div class="col-md-4">
                                            <h4 id="r">Type/Subject</h4>
                                        </div>

                                        <div class="col-md-2">
                                            <h4 id="t">Action</h4>
                                        </div>
                                    </div>

                                    <%                                        ArrayList<Book> arrBook = DBDatalist.getFeaturedBookList();
                                        if (arrBook != null) {

                                            for (int i = 0; i < arrBook.size(); i++) {
                                                Book book = (Book) arrBook.get(i);

                                    %>
                                    <div class="form-group">
                                        <div class="col-md-1">
                                            <p><%= i + 1%> </p>
                                        </div>
                                        <div class="col-md-2">
                                            <span class="label label-success">Featured</span>
                                        </div>
                                        <div class="col-md-3">
                                            <input class="form-control" disabled="" value="<%= book.getTitle()%>" style="color: black">
                                        </div>
                                        <div class="col-md-4">
                                            <input class="form-control" disabled="" value="<%= book.getSubject().getType().getName() + " - " + book.getSubject().getName()%>" style="color: black">
                                        </div>

                                        <div class="col-md-2">
                                            <!--<button data-toggle="modal" data-target="#myModalremove"  class="btn-xs btn-danger" type="button" >Remove <span class='fa fa-remove'></span></button>-->
                                            <a href="savebook?para=fremove&book=<%= book.getIdbook()%>"><button class="btn-xs btn-danger" type="button">Remove <span class='fa fa-remove'></span></button></a>
                                        </div>
                                    </div>

                                    <%                                                    }
                                    %>
                                    <div class="form-group">
                                        <div class="col-md-1">
                                            <p> <%= arrBook.size() + 1%> </p>
                                        </div>
                                        <div class="col-md-2">
                                            <span class="label label-warning">Empty slot</span>
                                        </div>

                                        <div class="col-md-3">
                                            <input hidden="" id="para" name="para" value="fadd">
                                            <!--<input class="form-control" placeholder="start typing..." id="newfeatbook" name="newfeatbook">-->
                                            <select id="newfeatbook" name="newfeatbook" class="form-control" onclick="settype()">
                                                <option value="select" selected="" disabled="">Select..</option>
                                                <%
                                                    ArrayList<Book> bb = DBDatalist.getBookList();
                                                    if (bb != null) {

                                                        for (int i = 0; i < bb.size(); i++) {
                                                            Book book = (Book) bb.get(i);
                                                            if (book.getFeatured() != 1) {
                                                %>
                                                <option value="<%=book.getIdbook()%>"><%=book.getTitle()%></option>
                                                <%
                                                            }
                                                        }
                                                    }
                                                %>
                                            </select>

                                        </div>
                                        <div class="col-md-4">
                                            <input class="form-control" disabled>
                                        </div>

                                        <div class="col-md-2">
                                            <!--<button data-toggle="modal" data-target="#myModaladd" type="button" class="btn-xs btn-primary">Add <span class='fa fa-check'></span></button>-->
                                            <button class="btn-xs btn-primary" type="submit" disabled="" id="addnewfeat">Add <span class='fa fa-check'></span></button>
                                        </div>
                                    </div>
                                    <%
                                        }
                                    %>
                                    <%
                                        for (int j = arrBook.size() + 1; j < 9; j++) {
                                    %>
                                    <div class="form-group">
                                        <div class="col-md-1">
                                            <p> <%= j + 1%> </p>
                                        </div>
                                        <div class="col-md-2">
                                            <span class="label label-warning">Empty slot</span>
                                        </div>
                                        <div class="col-md-3">
                                            <input class="form-control"  disabled="" >
                                        </div>
                                        <div class="col-md-4">
                                            <input class="form-control" disabled>
                                        </div>

                                        <div class="col-md-2">
                                            <!--<button data-toggle="modal" data-target="#myModaladd" type="button" class="btn-xs btn-primary">Add <span class='fa fa-check'></span></button>-->
                                            <a href="savebook?para=fadd&book="><button class="btn-xs btn-default" type="button" disabled="">Add <span class='fa fa-check'></span></button></a>
                                        </div>
                                    </div>
                                    <%
                                        }
                                    %>

                                </form>
                       
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
        <script type="text/javascript">
            function settype(){
                var id=docu;
                document.getElementById('addnewfeat').disabled=false;
            }
            </script>

    </body>
</html>
