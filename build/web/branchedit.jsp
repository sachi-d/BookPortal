<%-- 
    Document   : branchedit
    Created on : Jun 5, 2016, 7:14:33 PM
    Author     : Sachi
--%>

<%@page import="Model.Branch"%>
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

                int idbranch = 0;
                String param = "null";
                if (request.getParameter("edit") != null) {
                    idbranch = Integer.parseInt(request.getParameter("edit"));
                    param="edit";
                } else if (request.getParameter("remove") != null) {
                    idbranch = Integer.parseInt(request.getParameter("remove"));
                    param="remove";
                }
                Branch branch = DBDatalist.getBranch(idbranch);

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
                                        param="null";
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
                                            Branch edited/removed successfully.</label><hr>
                                    </div>
                                    <%
                                            }
                                        }
                                    %>

                                </div>

                                <!-- - - - - - - - - - - - - - - - - - -BRANCH TABLE - - - - - - - - - - - - - - - - - ----->
                                <%
                                    if (param.equals("edit")) {
                                %>
                                <div class="col-md-12" >
                                    <div class="col-md-4 pull-left">
                                        <h3 >Edit branch</h3>
                                    </div>
                                    <div class="col-md-8">

                                    </div>

                                </div>
                                <div class="col-md-12">

                                    <form class="form-horizontal" action="savebranch" method="GET">
                                        <div class="form-group">
                                            <label class="col-md-3 control-label"> Branch name :</label>
                                            <div class="col-md-9">
                                                <input class="form-control" name="name" value="<%=branch.getName()%>">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label"> Address :</label>
                                            <div class="col-md-9">
                                                <input class="form-control" name="address" value="<%=branch.getAddress()%>">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label"> Tel no. :</label>
                                            <div class="col-md-9">
                                                <input class="form-control" name="telno" value="<%=branch.getTelNo()%>">
                                            </div>
                                        </div>


                                        <div class="form-group">
                                            <div class="col-md-3 "></div><div class="col-md-3 "></div>
                                            <div class="col-md-3 ">
                                                <input type="hidden" name="idbranch" value="<%=idbranch%>">
                                                <input type="hidden" name="para" value="edit">
                                                <button type="submit" class="btn btn-primary form-control">Edit</button>
                                            </div>
                                            <div class="col-md-3 ">
                                                <a href="branchview.jsp">Cancel and go back</a>
                                            </div>
                                        </div>
                                    </form>

                                </div> 
                                <%
                                } else if(param.equals("remove")){
                                %>
                                <div class="col-md-12" >
                                    <div class="col-md-4 pull-left">
                                        <h3 >Remove branch</h3>
                                    </div>
                                    <div class="col-md-8">

                                    </div>

                                </div>
                                <h4>Are you sure you want to remove branch <strong><%=branch.getName()%></strong>?</h4>
                                <br><br><br>
                                <form class="form-horizontal" action="savebranch" method="GET">
                                    <div class="form-group">
                                        <div class="col-md-3 "></div><div class="col-md-3 "></div>
                                        <div class="col-md-3 ">
                                            <input type="hidden" name="idbranch" value="<%=idbranch%>">
                                            <input type="hidden" name="para" value="remove">
                                            <button type="submit" class="btn btn-danger form-control">Remove</button>
                                        </div>
                                        <div class="col-md-3 ">
                                            <a href="branchview.jsp">Cancel and go back</a>
                                        </div>
                                    </div>
                                </form>
                                <%
                                    }
                                %>
                                
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
        <script type="text/javascript">
            function editWarn() {

            }
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