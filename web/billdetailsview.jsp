<%-- 
    Document   : billdetailsview
    Created on : Apr 18, 2016, 10:14:35 PM
    Author     : Sachi
--%>

<%@page import="java.util.HashMap"%>
<%@page import="Model.Book"%>
<%@page import="Model.Bill"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View bill details</title>
        <link rel="shortcut icon" href="admin/images/logo.png">
        
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

                                <h3 class="head-top">Bill details</h3>
                                <%                                        if (request.getParameter("msg") != null) {
                                %>
                                <label class="label label-success">Request marked as <%= request.getParameter("msg")%></label>
                                %><div><br></div><%                                        }

                                    if (request.getParameter("purreq") != null) {
                                        int purreq = Integer.parseInt(request.getParameter("purreq"));
                                        Purchaserequest pur = DBDatalist.getPurchaserequest(purreq);
                                        Bill bill = pur.getIdbill();
                                    %>
                                <form class="form-horizontal">
                                    <div class="form-group">
                                        <div class="col-md-2"></div>
                                        <label class="col-md-2 "> Customer : </label>
                                        <div class="col-md-8">
                                            <p> <%= pur.getCustomer()%> </p>
                                        </div>

                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-2"></div>
                                        <label class="col-md-2 "> Address : </label>
                                        <div class="col-md-8">
                                            <p> <%= pur.getAddress()%> </p>
                                        </div>

                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-2"></div>
                                        <label class="col-md-2 "> Date : </label>
                                        <div class="col-md-8">
                                            <p> <%= pur.getIdbill().getDate()%> </p>
                                        </div>

                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-2"></div>
                                        <label class="col-md-2 "> Bill ID : </label>
                                        <div class="col-md-8">
                                            <p> <%= pur.getIdbill().getIdbill()%> </p>
                                            <%
                                                if (pur.getStatus().equals("New")) {
                                            %><label class="label label-warning">New</label><%
                                                    } else if (pur.getStatus().equals("Accepted")) {
                                            %><label class="label label-primary">Accpted</label><%
                                                        }
                                            %>
                                        </div>

                                    </div>
                                    <div class="form-group">
                                        <hr>
                                        <div class="col-md-2"></div>
                                        <label class="col-md-2 " > Bill items : </label>
                                        <label class="col-md-3 " style="text-decoration: underline"> Item </label>
                                        <label class="col-md-3 " style="text-decoration: underline"> ISBN </label>
                                        <label class="col-md-2 " style="text-decoration: underline"> Quantity </label>
                                    </div>
                                    <div class="form-group">

                                        <%  HashMap<Book, Integer> h = bill.getItems();
                                            for (Book b : h.keySet()) {
                                        %>
                                        <div class="col-md-4"></div>
                                        <div class="col-md-3">       <p>   <%= b.getTitle()%> <br></p><hr></div>
                                        <div class="col-md-3">       <p>   <%= b.getISBN() %> <br></p><hr></div>
                                        <div class="col-md-2">       <p>   <%= h.get(b)%> <br></p><hr></div>
                                                <%
                                                    }%>

                                    </div>
                                    <div class="form-group">
                                        <hr>
                                        <div class="col-md-2"></div>
                                        <label class="col-md-2 "> Total : </label>
                                        <div class="col-md-8">
                                            <p> Rs. <%= pur.getIdbill().getTotal()%> </p>
                                        </div>
                                        <hr>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-8"></div>
                                        <%
                                            String stat = pur.getStatus();
                                            if (stat.equals("New")) {
                                        %>

                                        <div class="col-md-2">
                                            <a href="executepurreq?para=accept&pur=<%= pur.getIdpurreq()%>"><button class="btn-sm btn-success" type="button">Accept <span class='fa fa-check'></span></button></a>
                                        </div>
                                        <%
                                        } else if (stat.equals("Accepted")) {
                                        %>

                                        <div class="col-md-2">
                                            <a href="executepurreq?para=process&pur=<%= pur.getIdpurreq()%>"><button class="btn-sm btn-danger" type="button">Close<span class='fa fa-remove'></span></button></a>
                                        </div>
                                        <%
                                            }
                                        %>                                       

                                        <div class="col-md-2">
                                            <a href="purreqview.jsp"><button class="btn-sm btn-default" type="button">Go back <span class='fa fa-arrow-right'></span></button></a>

                                        </div>
                                        <!--<div class="col-md-4"></div>-->
                                    </div>

                                </form>
                                <%  }%>

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

        <!-- jQuery 2.1.4 -->
        <script src="plugins/jQuery/jQuery-2.1.4.min.js"></script>
        <script src="plugins/jQueryUI/jquery-ui.js"></script>
        <!-- Bootstrap 3.3.2 JS -->
        <script src="js/bootstrap.min.js"></script>
        <!-- DATA TABES SCRIPT -->



        <script type="text/javascript" src="plugins/jQueryUI/jquery-ui.js"></script>
        <script type="text/javascript" src="js/jquery-ui-1.10.3.custom.min.js"></script>
        <script type="text/javascript" src="js/portBox.slimscroll.min.js"></script>
        <script type="text/javascript" src="js/validation.js"></script>

        <script type="text/javascript">
            $(function () {
                $("#table_notification").DataTable();
            });

            function goto(target) {
                location.href = target;
            }
            ;
        </script>


    </body>
</html>

