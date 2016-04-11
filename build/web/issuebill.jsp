<%-- 
    Document   : Create bill
    Created on : Mar 21, 2016, 9:26:00 PM
    Author     : Sachi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Issue bill</title>
    </head>
    <body>
        <%@include file="admin_sidebar.jsp" %>

        <div id="wrapper">
            <!----->

            <div id="page-wrapper" class="gray-bg dashbard-1">
                <div class="content-main">
                    <div class="grid-form" >
                        <div class="grid-form1"> 
                            <h3 class="head-top">Issue a bill</h3>
                            <form> 
                                <div id="printableArea" class="col-md-12" >

                                    <!--  ---------------------------------STORE DETAILS-->

                                    <div  class="col-md-6" style="width: 50%">
                                        <img src="admin/images/logo-full.png">
                                        <h5>
                                            27, Happy Street,Colombo 3 <br>
                                            2 123 456<br>
                                            www.thebookportal.lk<br>
                                        </h5>
                                        <br>
                                    </div>
                                    <div class="col-md-6" style="width: 50%">
                                        <h3 id="forms-example" class="" style="border:2px solid #d95459; display: inline; line-height: 50px; padding: 0 0 0 5px;">Invoice </h3><br>
                                        <label>Date:</label><br>
                                        <label>Invoice no.:</label><br>
                                        <label>Cashier:</label><br>
                                    </div>

                                    <br>

                                    <!--  --------------------------------BILL CONTENT -->
                                    <div class="col-md-12">

                                        <table class="tg">
                                            <tr>
                                                <th class="tg-yw4l">Item ID</th>
                                                <th class="tg-yw4l">Description</th>
                                                <th class="tg-yw4l">Unit price</th>
                                                <th class="tg-yw4l">Quantity</th>
                                                <th class="tg-yw4l">Total</th>
                                            </tr>
                                            <%
                                                for (int i = 0; i < 10; i++) { %>
                                            <tr>
                                                <td class="tg-yw40"><input type="text" class="form-control" id="exampleInputEmail1"></td>
                                                <td class="tg-yw40"><input type="text" class="form-control" id="exampleInputEmail1"></td>
                                                <td class="tg-yw40"><input type="text" class="form-control" id="exampleInputEmail1"></td>
                                                <td class="tg-yw40"><input type="text" class="form-control" id="exampleInputEmail1"></td>
                                                <td class="tg-yw40"><input type="text" class="form-control" id="exampleInputEmail1"></td>
                                            </tr>
                                            <%  }
                                            %>
                                            <tr>
                                                <!--                                                <td class="tg-031e"></td>
                                                                                                <td class="tg-031e"></td>-->
                                                <td class="tg-031e" colspan="3" style="border: none"></td>
                                                <td class="tg-yw40" ><label>Sub total</label></td>
                                                <td class="tg-yw40"><input type="text" class="form-control" id="exampleInputEmail1"></td>
                                            </tr>
                                        </table>

                                    </div>
                                </div>
                                <div class="clearfix"> </div>
                                <div class="col-md-4">

                                    <button type="submit" class="btn btn-danger" onclick="printDiv('printableArea')">Print</button>
                                </div>
                            </form>
                        </div>
                        <!----->

                    </div>
                    <%@include file="admin_footer.jsp" %>
                </div>
            </div>
            <div class="clearfix"> </div>
        </div>
        <!--scrolling js-->
        <script src="admin/js/jquery.nicescroll.js"></script>
        <script src="admin/js/scripts.js"></script>
        <script type="text/javascript">
                                        function printDiv(divName) {
                                            var printContents = document.getElementById(divName).innerHTML;
                                            var originalContents = document.body.innerHTML;

                                            document.body.innerHTML = printContents;

                                            window.print();

                                            document.body.innerHTML = originalContents;
                                        }
        </script>
        <!--//scrolling js-->
        <!---->

    </body>

</html>
