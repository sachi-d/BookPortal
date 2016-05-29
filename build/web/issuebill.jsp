<%-- 
    Document   : Create bill
    Created on : Mar 21, 2016, 9:26:00 PM
    Author     : Sachi
--%>

<%@page import="java.util.Calendar"%>
<%@page import="Model.Book"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Issue bill</title>
        <link rel="shortcut icon" href="admin/images/logo.png">

        <!-- Custom Theme files -->
        <link href="admin/css/style.css" rel='stylesheet' type='text/css' />
        <link href="admin/css/font-awesome.css" rel="stylesheet"> 
        <link href="admin/css/bootstrap.min.css" rel="stylesheet"> 
        <script src="admin/js/jquery.min.js"></script>
        <script src="admin/js/bootstrap.min.js"></script>

        <!-- Mainly scripts -->
        <script src="admin/js/jquery.metisMenu.js"></script>
        <script src="admin/js/jquery.slimscroll.min.js"></script>
        <!-- Custom and plugin javascript -->
        <link href="admin/css/custom.css" rel="stylesheet">
        <script src="admin/js/custom.js"></script>
        <script src="admin/js/screenfull.js"></script>
        <!--autcocomplete-->
        <link rel="stylesheet" href="js/autocomplete/jquery-ui.css">
        <script src="js/autocomplete/jquery-1.10.2.js"></script>
        <script src="js/autocomplete/jquery-ui.js"></script>
    </head>
    <body>
        <%
            if (session.getAttribute("user") != null) {
                User uu = (User) session.getAttribute("user");
                if (uu.getULevel() == 2) {
        %>
        <%@include file="admin_sidebar.jsp" %>

        <div id="wrapper">
            <!-- - -->

            <div id="page-wrapper" class="gray-bg dashbard-1">
                <div class="content-main">
                    <div class="grid-form" >
                        <div class="grid-form1"> 
                            <!--<div class="col-md-12">-->
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
                                        Bill added successfully.</label><hr>
                                </div>
                                <%
                                        }
                                    }
                                %>

                            </div>
                            <!--<div class="col-md-12">-->
                            <h3 class="head-top">Issue a bill</h3>
                            <form action="Savebill" method="POST"> 
                                <div id="printableArea" class="col-md-12" >

                                    <!--  - - - - - - - - - - - - - - - - - - - - - - STORE DETAILS-->

                                    <div  class="col-md-6" style="width: 50%">
                                        <img src="admin/images/logo-full.png" alt="logo">
                                        <h5>
                                            27, Happy Street,Colombo 3 <br>
                                            2 123 456<br>
                                            www.thebookportal.lk<br>
                                        </h5>
                                        <br>
                                    </div>
                                    <div class="col-md-6" style="width: 50%">
                                        <h3 id="forms-example" class="" style="border:2px solid #d95459; display: inline; line-height: 50px; padding: 0 0 0 5px;">Invoice </h3><br>
                                        <label>Date: </label><%= new Date()%><br>
                                        <label>Invoice no.:</label><%= DBDatalist.getInvoice()%><br>
                                        <label>Cashier: </label><%=uu.getFullname()%><br>
                                    </div>



                                    <!--  - - - - - - - - - - - - - - - - - - - - - -BILL CONTENT -->
                                    <div class="col-md-12" >
                                        <hr>
                                        <table class="tg" >
                                            <!--<thead>-->
                                            <tr>
                                                <th class="tg-yw4l">Item id</th>
                                                <th class="tg-yw4l">Title</th>
                                                <th class="tg-yw4l">Unit price (Rs.)</th>
                                                <th class="tg-yw4l">Quantity</th>
                                                <th class="tg-yw4l">Total (Rs.)</th>
                                            </tr>
                                            <!--                                            </thead>
                                                                                        <tbody>-->

                                            <%
                                                for (int i = 0; i < 10; i++) {
                                            %>

                                            <tr>
                                                <td class="tg-yw33"><input type="text" class="form-control" name="bookid_<%=i%>" id="bookid_<%=i%>" readonly=""></td>
                                                <td class="tg-yw33"><input type="text" class="form-control" name="title_<%=i%>" id="title_<%=i%>" ></td>
                                                <td class="tg-yw33"><input type="text" class="form-control" name="uprice_<%=i%>" id="uprice_<%=i%>" readonly=""></td>
                                                <td class="tg-yw33"><input type="number" class="form-control" name="q_<%=i%>" onkeyup="setUnitTot(<%=i%>)" id="q_<%=i%>"></td>
                                                <td class="tg-yw33"><input type="text" class="form-control" name="tot_<%=i%>" id="tot_<%=i%>" readonly=""></td>
                                            </tr>

                                            <%
                                                }
                                            %>


                                            <tr>
                                                <!--                                                <td class="tg-031e"></td>
                                                                                                <td class="tg-031e"></td>-->
                                                <td class="tg-031e" colspan="3" style="border: none"></td>
                                                <td class="tg-yw40" ><label>Sub total</label></td>
                                                <td class="tg-yw40"><input type="text" class="form-control" id="subtot" name="subtot" readonly=""></td>
                                            </tr>
                                            <!--</tbody>-->
                                        </table>
                                        <hr>
                                    </div>
                                </div>
                                <div class="clearfix"> </div>
                                <div class="col-md-8">
                                    <input hidden="" value="bookid_<%=0%>" name="trial">
                                    <input value="0" id="itemcount" name="itemcount">
                                    <input type="hidden" value="<%=uu.getIduser()%>" id="userid" name="userid">
                                </div>
                                <div class="col-md-2">
                                    <button type="submit" class="btn btn-lg btn-danger pull-right" onclick="PrintElem('printableArea')">Print</button>
                                    <!--<button type="button" class="btn btn-default pull-right" onclick="clearTable()">Print</button>-->
                                </div>
                                <div class="col-md-2">
                                    
                                    <button type="submit" class="btn btn-lg btn-danger pull-right" >Complete order</button>
                                </div>
                            </form>
                            <div class="clearfix"> </div>
                            <!--</div>-->

                            <!--</div>-->

                        </div>

                    </div>
                    <%@include file="admin_footer.jsp" %>
                </div>
            </div>
            <div class="clearfix"> </div>
        </div>
        <%
        } else {
        %>
        <%@include file="404.jsp" %>
        <%
                }
            } else {
                response.sendRedirect("login.jsp");
            }%>
        <script>
            function setUnitTot(ii) {
                uprice = document.getElementById('uprice_' + ii).value;
                quantity = document.getElementById('q_' + ii).value;
                tot = uprice * quantity;
                document.getElementById('tot_' + ii).value = tot;
                var subtot = 0;
                for (i = 0; i < 10; i++) {
                    var itot = document.getElementById('tot_' + i).value;
                    subtot = +subtot + +itot;
                }
                document.getElementById('subtot').value = subtot;
            }
        </script>
        <script>

            <%
               for (int i = 0; i < 10; i++) {
            %>
            $(function () {
                 var availableTags = <%= Book.bookListtoJSArray()%>;

                 $("#title_<%=i%>").autocomplete({
                    minLength: 0,
                    source: availableTags,
                    focus: function (event, ui) {
                         $("#title_<%=i%>").val(ui.item.label);
                        return false;
                    },
                    select: function (event, ui) {
                         $("#title_<%=i%>").val(ui.item.label);
                         $("#bookid_<%=i%>").val(ui.item.value);
                         $("#uprice_<%=i%>").val(ui.item.desc);
                         document.getElementById('title_<%=i%>').disabled = true;
                        x = document.getElementById('itemcount').value;
                        document.getElementById('itemcount').value = +x + 1;
                        return false;
                    }
                });
            });
            <%
               }
            %>
        </script>
        <!--scrolling js-->
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


             function PrintElem(elem)
             {
                 $('form input[type=text]').each(function () {
                     $(this).attr('value', $(this).val());
                 });
//                                            $('#printoutput').html($(elem).html());
                 var printContents = document.getElementById(elem).innerHTML;
                 var originalContents = document.body.innerHTML;

                 document.body.innerHTML = printContents;

                 window.print();

                 document.body.innerHTML = originalContents;
                 return true;
             }
        </script>

        <script>
            function clearTable() {
                for (i = 0; i < 10; i++) {
                    document.getElementById('#title_' + i).value = '';
                }
            }
        </script>
        <!--//scrolling js-->


    </body>

</html>
