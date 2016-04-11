<%-- 
    Document   : inventoryview
    Created on : Mar 22, 2016, 5:15:58 PM
    Author     : Sachi
--%>

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
                                <h3 class="head-top">Inventory</h3>

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
                                            <%
                                                for (int i = 0; i < 10; i++) { %>
                                            <tr>
                                                <td class="tg-yw40">343-35266</td>
                                                <td class="tg-yw40">SAMPLE TITLE1</td>
                                                <td class="tg-yw40">Author 123</td>
                                                <td class="tg-yw40">type1</td>
                                                <td class="tg-yw40">subject1</td>
                                                <td class="tg-yw40">language1</td>
                                                <td class="tg-yw40">pub1</td>
                                            </tr>
                                            <%  }
                                                for (int i = 0; i < 10; i++) { %>
                                            <tr>
                                                <td class="tg-yw40">123-35216</td>
                                                <td class="tg-yw40">dasdbouih</td>
                                                <td class="tg-yw40">fdsfsd 123</td>
                                                <td class="tg-yw40">fwbg</td>
                                                <td class="tg-yw40">bbef</td>
                                                <td class="tg-yw40">wbvs</td>
                                                <td class="tg-yw40">swbwe</td>
                                            </tr>
                                            <%  }
                                            %>
                                            <tr>
                                                <td class="tg-yw40">7897</td>
                                                <td class="tg-yw40">sachithra</td>
                                                <td class="tg-yw40">malsha 123</td>
                                                <td class="tg-yw40">fwbg</td>
                                                <td class="tg-yw40">ach</td>
                                                <td class="tg-yw40">wbvs</td>
                                                <td class="tg-yw40">swbwe</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <!--                                    <table id="table_principal" class="table table-bordered table-striped table-condensed">
                                                                            <thead>
                                                                                <tr>
                                                                                    <th>#</th>
                                                                                    <th>First Name</th>
                                                                                    <th>Last Name</th>
                                                                                </tr>
                                                                            </thead>
                                                                            <tbody>
                                    
                                                                                <tr>
                                                                                    <td>3</td>
                                                                                    <td>dddr.getFname()%></td>
                                                                                    <td>ddd user.getLname()%></td>
                                                                                </tr>
                                    
                                                                            </tbody>
                                                                        </table>-->

                                </div>

                                <!-- ---------------- ADD NEW INVENTORY ITEM --------------------->
                                <div class="bs-example2 bs-example-padded-bottom">
                                    <input data-toggle="modal" data-target="#myModal" type="image" src="admin/images/add.png" alt="Add" style="position: fixed; bottom: 60px; right: 135px; z-index: 5; width: 50px; height: 50px;">
                                    <!--                                    <a data-toggle="modal" data-target="#myModal" >
                                                                            <img class="hvr-grow" src="admin/images/add.png" 
                                                                                 style="position: fixed; bottom: 60px; right: 135px; z-index: 5; width: 50px; height: 50px;">
                                                                        </a>-->
                                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                    <h2 class="modal-title">Add inventory item</h2>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="grid-form1">

                                                        <form class="form-horizontal">
                                                            <div class="form-group">
                                                                <label class="col-md-3 control-label"> Name :</label>
                                                                <div class="col-md-9">
                                                                    <input class="form-control" >
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-md-3 control-label"> ISBN :</label>
                                                                <div class="col-md-9">
                                                                    <input class="form-control" >
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-3 control-label">Author 1 :</label>
                                                                <div class="col-sm-9">
                                                                    <select name="child" class="form-control">
                                                                        <option value="select" selected="" disabled="">Select..</option>

                                                                        <option value="">fsdfsd</option>

                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-3 control-label">Author 2 :</label>
                                                                <div class="col-sm-9">
                                                                    <select name="child" class="form-control">
                                                                        <option value="select" selected="" disabled="">Select..</option>

                                                                        <option value="">fsdfsd</option>

                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-3 control-label">Author 3 :</label>
                                                                <div class="col-sm-9">
                                                                    <select name="child" class="form-control">
                                                                        <option value="select" selected="" disabled="">Select..</option>

                                                                        <option value="">fsdfsd</option>

                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-md-3 control-label"> Description :</label>
                                                                <div class="col-md-9">
                                                                    <textarea rows="3" class="form-control" ></textarea>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-3 control-label">Publisher :</label>
                                                                <div class="col-sm-9">
                                                                    <select name="child" class="form-control">
                                                                        <option value="select" selected="" disabled="">Select..</option>

                                                                        <option value="">fsdfsd</option>

                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-3 control-label">Published date:</label>
                                                                <div class="col-md-9">
                                                                    <input class="form-control" type="date" >
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-3 control-label">Language :</label>
                                                                <div class="col-sm-3">
                                                                    <select name="child" class="form-control">
                                                                        <option value="select" selected="" disabled="">Select..</option>

                                                                        <option value="">fsdfsd</option>

                                                                    </select>
                                                                </div>
                                                                <label class="col-md-3 control-label"> Edition :</label>
                                                                <div class="col-md-3">
                                                                    <input class="form-control" >
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-3 control-label">Type :</label>
                                                                <div class="col-sm-3">
                                                                    <select name="child" class="form-control">
                                                                        <option value="select" selected="" disabled="">Select..</option>

                                                                        <option value="">fsdfsd</option>

                                                                    </select>
                                                                </div>
                                                                <label class="col-sm-3 control-label">Subject :</label>
                                                                <div class="col-sm-3">
                                                                    <select name="child" class="form-control">
                                                                        <option value="select" selected="" disabled="">Select..</option>

                                                                        <option value="">fsdfsd</option>

                                                                    </select>
                                                                </div>
                                                            </div>

                                                            <button type="submit" class="btn btn-default">Submit</button>
                                                        </form>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                    <button type="button" class="btn btn-primary">Save changes</button>
                                                </div>
                                            </div><!-- /.modal-content -->
                                        </div>
                                    </div>
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
