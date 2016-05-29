<%-- 
    Document   : branchview
    Created on : Mar 22, 2016, 6:48:00 PM
    Author     : Sachi
--%>

<%@page import="Model.User"%>
<%@page import="Model.Branch"%>
<%@page import="Controller.DBDatalist"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Branches</title>
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
        <%
            User usr = (User) session.getAttribute("user");
            if (usr.getULevel() == 0) {
        %>
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

                                <!-- - - - - - - - - - - - - - - - - - -BRANCH TABLE - - - - - - - - - - - - - - - - - ----->
                                <div class="col-md-12" >
                                    <div class="col-md-4 pull-left">
                                        <h3 >Branches</h3>
                                    </div>
                                    <div class="col-md-4">

                                    </div>
                                    <div class="col-md-4 ">
                                        <button class="btn btn-lg btn-default pull-right" data-toggle="modal" data-target="#myModal">Add new branch <img src="admin/images/add.png" alt="Add Branch" style="width: 20px;height: 20px;"></button>
                                    </div>
                                </div>
                                <div class="col-md-12">



                                    <table class="tg" id="table_branch">
                                        <thead>
                                            <tr>
                                                <th class="tg-yw4l">Branch name</th>
                                                <th class="tg-yw4l">Address</th>
                                                <th class="tg-yw4l">Tel no.</th>
                                                <th class="tg-yw4l">Branch admin</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%                                                ArrayList<Branch> arrBranch = DBDatalist.getBranchList();
                                                if (arrBranch != null) {
                                                    for (int i = 0; i < arrBranch.size(); i++) {
                                                        Branch branch = (Branch) arrBranch.get(i);

                                            %>
                                            <tr>
                                                <td class="tg-yw40"><%= branch.getName()%></td>
                                                <td class="tg-yw40"><%= branch.getAddress()%></td>
                                                <td class="tg-yw40"><%= branch.getTelNo()%></td>
                                                <td class="tg-yw40">
                                                    <%
                                                        User u = DBDatalist.getBranchadminfromBranch(branch);
                                                        if (u != null) {
                                                    %>
                                                    <%= u.getFullname()%> 
                                                    <% } %></td>
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
                                                    <h2 class="modal-title">Add branch</h2>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="grid-form1">

                                                        <form class="form-horizontal" action="savebranch" method="POST">
                                                            <div class="form-group">
                                                                <label class="col-md-3 control-label"> Branch name :</label>
                                                                <div class="col-md-9">
                                                                    <input class="form-control" name="name" >
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-md-3 control-label"> Address :</label>
                                                                <div class="col-md-9">
                                                                    <input class="form-control" name="address">
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-md-3 control-label"> Tel no. :</label>
                                                                <div class="col-md-9">
                                                                    <input class="form-control" name="telno">
                                                                </div>
                                                            </div>


                                                            <div class="form-group">
                                                                <div class="col-md-3 "></div><div class="col-md-3 "></div>
                                                                <div class="col-md-3 ">
                                                                    <button type="submit" class="btn btn-primary form-control">Add branch</button>
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
//                $("#table_branch").DataTable();
            });
        </script>
        <%
        } else {
        %>
        <%@include file="404.jsp" %>
        <%
            }
        %>
    </body>
</html>
