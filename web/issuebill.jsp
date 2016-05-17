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
        <script>

            <%
                for (int i = 0; i < 10; i++) {
            %>
            $(function () {
                var availableTags = <%= Book.bookListtoJSArray()%>;

                $("#tags_<%=i%>").autocomplete({
                    minLength: 0,
                    source: availableTags,
                    focus: function (event, ui) {
                        $("#tags_<%=i%>").val(ui.item.label);
                        return false;
                    },
                    select: function (event, ui) {
                        $("#tags_<%=i%>").val(ui.item.label);
                        $("#tagid_<%=i%>").val(ui.item.value);
                        $("#tagname_<%=i%>").val(ui.item.desc);
                        document.getElementById('tags_<%=i%>').disabled = true;
                        return false;
                    }
                });
            });
            <%
                }
            %>
        </script>
        <script>
            function setUnitTot(ii) {
                uprice = document.getElementById('tagname_' + ii).value;
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
    </head>
    <body>
        <%
            if (null == session.getAttribute("user")) {
                response.sendRedirect("login.jsp");
            } else {
                User uu = (User) session.getAttribute("user");

        %>
        <%@include file="admin_sidebar.jsp" %>

        <div id="wrapper">
            <!-- - -->

            <div id="page-wrapper" class="gray-bg dashbard-1">
                <div class="content-main">
                    <div class="grid-form" >
                        <div class="grid-form1"> 
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

                                    <br>

                                    <!--  - - - - - - - - - - - - - - - - - - - - - -BILL CONTENT -->
                                    <div class="col-md-12" >

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
                                                    <td class="tg-yw33"><input type="text" class="form-control" disabled="" id="tagid_<%=i%>"></td>
                                                    <td class="tg-yw33"><input type="text" class="form-control"  id="tags_<%=i%>"></td>
                                                    <td class="tg-yw33"><input type="text" class="form-control" disabled="" id="tagname_<%=i%>"></td>
                                                    <td class="tg-yw33"><input type="text" class="form-control" required="" id="q_<%=i%>" onkeyup="setUnitTot(<%=i%>)"></td>
                                                    <td class="tg-yw33"><input type="text" class="form-control" disabled="" id="tot_<%=i%>"></td>
                                                </tr>

                                                <%
                                                    }
                                                %>


                                                <tr>
                                                    <!--                                                <td class="tg-031e"></td>
                                                                                                    <td class="tg-031e"></td>-->
                                                    <td class="tg-031e" colspan="3" style="border: none"></td>
                                                    <td class="tg-yw40" ><label>Sub total</label></td>
                                                    <td class="tg-yw40"><input type="text" class="form-control" id="subtot"></td>
                                                </tr>
                                            <!--</tbody>-->
                                        </table>
                                        <hr>
                                    </div>
                                </div>
                                <div class="clearfix"> </div>
                                <div class="col-md-8">

                                </div>
                                <div class="col-md-2">
                                    <button type="submit" class="btn btn-danger pull-right" onclick="PrintElem('printableArea')">Print</button>
                                </div>
                                <div class="col-md-2">
                                    <button type="button" class="btn btn-default pull-right" onclick="clearTable()">Clear all</button>
                                </div>
                            </form>
                            <div class="clearfix"> </div>
                        </div>
                        <!- - -->

                    </div>
                    <%@include file="admin_footer.jsp" %>
                </div>
            </div>
            <div class="clearfix"> </div>
        </div>
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
                                        }
        </script>

        <script>
            function clearTable() {
                for (i = 0; i < 10; i++) {
                    document.getElementById('#tags_'+i).value = '';
                }
            }
        </script>
        <!--//scrolling js-->

        <%}%>
    </body>

</html>
