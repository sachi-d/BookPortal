<%-- 
    Document   : featuredbooks
    Created on : Mar 22, 2016, 7:09:57 PM
    Author     : Sachi
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Featured books</title>

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
                                        <h3 class="head-top">Featured books</h3>
                                        <form class="form-horizontal">
                                            <div class="form-group">
                                                <div class="col-md-1">
                                                    <h4 id="h4.-bootstrap-heading">#</h4>
                                                </div>
                                                <div class="col-md-3">
                                                    <h4 id="h4.-bootstrap-heading">Title</h4>
                                                </div>
                                                <div class="col-md-4">
                                                    <h4 id="h4.-bootstrap-heading">Type/Subject</h4>
                                                </div>
                                                <div class="col-md-2">
                                                    <h4 id="h4.-bootstrap-heading">Status</h4>
                                                </div>
                                                <div class="col-md-2">
                                                    <h4 id="h4.-bootstrap-heading">Action</h4>
                                                </div>
                                            </div>
                                            <% int count = 3;
                                                for (int i = 0; i < count; i++) {
                                            %>
                                            <div class="form-group">
                                                <div class="col-md-1">
                                                    <p><%= i + 1%> </p>
                                                </div>
                                                <div class="col-md-3">
                                                    <input class="form-control" disabled="" value="book title 1" >
                                                </div>
                                                <div class="col-md-4">
                                                    <input class="form-control" disabled="" value="book typr 1" >
                                                </div>
                                                <div class="col-md-2">
                                                    <span class="label label-success">Featured</span>
                                                </div>
                                                <div class="col-md-2">
                                                    <button data-toggle="modal" data-target="#myModalremove"  class="btn btn-xs btn-danger" type="button"><span class='fa fa-remove'></span></button>
<!--                                                                                                        <a data-toggle="modal" data-target="#myModalremove" >
                                                                                                            <img class="hvr-grow" src="admin/images/minus.png" 
                                                                                                                 style="  z-index: 5; width: 30px; height: 30px;">
                                                                                                        </a>-->
                                                </div>
                                            </div>
                                            <%
                                                }
                                                for (int j = count; j < 10; j++) {
                                            %>
                                            <div class="form-group">
                                                <div class="col-md-1">
                                                    <p> <%= j + 1%> </p>
                                                </div>
                                                <div class="col-md-3">
                                                    <input class="form-control" placeholder="start typing...">
                                                </div>
                                                <div class="col-md-4">
                                                    <input class="form-control" disabled>
                                                </div>
                                                <div class="col-md-2">
                                                    <span class="label label-danger">Empty slot</span>
                                                </div>
                                                <div class="col-md-2">
                                                    <button data-toggle="modal" data-target="#myModaladd" type="button" class="btn btn-xs btn-danger"><span class='fa fa-check'></span></button>
                                                    <!--                                                    <a data-toggle="modal" data-target="#myModaladd" >
                                                                                                            <img class="hvr-grow" src="admin/images/add_green.png" 
                                                                                                                 style="  z-index: 5; width: 30px; height: 30px;">
                                                                                                        </a>-->
                                                </div>
                                            </div>
                                            <%
                                                }
                                            %>
                                        </form>

                                        <div class="modal fade" id="myModalremove" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                        <h2 class="modal-title">Remove featured book?</h2>
                                                    </div>
                                                    <div class="modal-body">
                                                        <div class="grid-form1">

                                                            <form class="form-horizontal">
                                                                <div class="form-group">
                                                                    <p>Note:-<br> It will <strong>NOT</strong> be visible in the featured books section of the website. </p>
                                                                </div>
                                                                <div class="form-group">
                                                                    <div class="col-md-3 "></div><div class="col-md-3 "></div>
                                                                    <div class="col-md-3 ">
                                                                        <button type="submit" class="btn btn-danger form-control">Remove</button>
                                                                    </div>
                                                                    <div class="col-md-3 ">
                                                                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                                                    </div>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">

                                                    </div>
                                                </div><!--    /.modal-content -->
                                            </div>
                                        </div>
                                        <div class="modal fade" id="myModaladd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                        <h2 class="modal-title">Add featured book?</h2>
                                                    </div>
                                                    <div class="modal-body">
                                                        <div class="grid-form1">

                                                            <form class="form-horizontal">
                                                                <div class="form-group">
                                                                    <p>Note:-<br> It will be visible in the featured books section of the website. </p>
                                                                </div>
                                                                <div class="form-group">
                                                                    <div class="col-md-3 "></div><div class="col-md-3 "></div>
                                                                    <div class="col-md-3 ">
                                                                        <button type="submit" class="btn btn-success warning_2 form-control">Add</button>
                                                                    </div>
                                                                    <div class="col-md-3 ">
                                                                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                                                    </div>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">

                                                    </div>
                                                </div> <!--/.modal-content --->
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
    </body>
</html>
