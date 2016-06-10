<%-- 
    Document   : reportview
    Created on : May 16, 2016, 8:35:23 PM
    Author     : Sachi
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormatSymbols"%>
<%@page import="Model.Branch"%>
<%@page import="Model.ReportTemplates.AnnualGeneralItem"%>
<%@page import="Model.ReportTemplates.AnnualBranch"%>
<%@page import="Controller.DBDatalist"%>
<%@page import="Model.ReportTemplates.MonthlyGeneralItem"%>
<%@page import="Model.ReportTemplates.MonthlyReport"%>
<%@page import="Model.ReportTemplates.AnnualBranchItem"%>
<%@page import="Model.ReportTemplates.AnnualReport"%>
<%@page import="Model.ReportTemplates.MonthlyBranchItem"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.User"%>
<%@page import="Model.ReportTemplates.MonthlyBranch"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Report</title>
        <link href="admin/css/bootstrap.min.css" rel='stylesheet' type='text/css' />
        <!-- Custom Theme files -->
        <link href="admin/css/style.css" rel='stylesheet' type='text/css' />
        <link href="admin/css/font-awesome.css" rel="stylesheet"> 
        <script src="admin/js/jquery.min.js"></script>
        <script src="admin/js/bootstrap.min.js"></script>
        <!--graph-->
        <link rel="stylesheet" href="admin/css/graph.css">
        <link rel="stylesheet" href="admin/css/owl.carousel.css" type="text/css" />

        <!-- Mainly scripts -->
        <script src="admin/js/jquery.metisMenu.js"></script>
        <script src="admin/js/jquery.slimscroll.min.js"></script>
        <!-- Custom and plugin javascript -->
        <link href="admin/css/custom.css" rel="stylesheet">
        <script src="admin/js/custom.js"></script>
        <script src="admin/js/screenfull.js"></script>
        <script>
            function printClose() {
                setTimeout(function () {
                    window.print();
                }, 2000);
                window.onfocus = function () {
//                    setTimeout(function () {
                    window.close();
//                    }, 2000);
                }
            }
        </script>
        <style type="text/css">
            /*@page { size:12in 11in }*/
            @media print{@page {size: 16in 10in }}
        </style>
    </head>

    <body>
        <!--<body onload="printClose()">-->
        <%
            String salesArray = "null";
            String purchaseArray = "null";
            int month = 0;
            int branchid = 0;
            Branch branch = null;
            String monthname = "null";
            String type = request.getParameter("type");
            int year = Integer.parseInt(request.getParameter("year"));
            if (!request.getParameter("month").equals("null")) {
                month = Integer.parseInt(request.getParameter("month"));
                monthname = new DateFormatSymbols().getMonths()[month - 1];
            }
            if (!request.getParameter("branch").equals("null")) {
                branchid = Integer.parseInt(request.getParameter("branch"));
                branch = DBDatalist.getBranch(branchid);
            }
        %>
        <!--<div id="wrapper">-->
        <!----->

        <!--<div id="page-wrapper" class="gray-bg dashbard-1">-->
        <div class="col-md-12">
            <div class="content-main">
                <div class="grid-form" >

                    <div class="grid-form1"> 
                        <div class="col-md-12">
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
                                <label>Date: </label><%= new Date()%><br>
                                <label>Report no.:</label>132<br>
                            </div>
                        </div> 
                        <!--<div class="col-md-12">-->
                        <%
                            if (type.equals("AG")) {
                                AnnualReport annualgen = new AnnualReport(year);
                                annualgen.generate();
                                ArrayList<AnnualGeneralItem> annualgen_purs = annualgen.getPurchaserecords();
                                ArrayList<AnnualGeneralItem> annualgen_sales = annualgen.getSalesrecords();
                                salesArray = annualgen.AGSalestoJSArray();
                                purchaseArray = annualgen.AGPurchasestoJSArray();
                        %>


                        <h3 class="head-top" style="text-align: center">Annual general report for the year <%=year%> </h3>
                        <div class="content-top">
                            <div class="content-top-2">
                                <!--<div class="content-graph">-->
                                <div class="content-color">
                                    <div class="content-ch">
                                        <p><i></i> Purchases </p>

                                        <div class="clearfix"> </div>
                                    </div>
                                    <div class="content-ch1">
                                        <p><i></i> Sales</p>

                                        <div class="clearfix"> </div>
                                    </div>
                                </div>


                                <div class="graph-container">

                                    <div id="graph-lines"> </div>
                                    <div id="graph-bars"> </div>
                                </div>
                                <hr>
                                <!--</div>-->
                            </div>
                            <div class="clearfix"></div>
                            <!--<div class="content-top">-->
                            <div class="content-box">
                                <div class="head-top">
                                    <h3 style="text-align: center;text-decoration: underline"><br>Annual sales</h3>
                                </div>
                                <table class="tg" >
                                    <!--<thead>-->
                                    <tr>
                                        <th class="tg-yw4l">Branch ID</th>
                                        <th class="tg-yw4l">Branch</th>
                                        <th class="tg-yw4l">Quantity</th>
                                        <th class="tg-yw4l">Total (Rs.)</th>
                                    </tr>
                                    <!--                                            </thead>
                                                                                <tbody>-->

                                    <%
                                        for (AnnualGeneralItem b : annualgen_sales) {
                                    %>

                                    <tr>
                                        <td class="tg-yw33"><%=Branch.getBranchIDfromName(b.getBranch())%></td>
                                        <td class="tg-yw33"><%=b.getBranch()%></td>
                                        <td class="tg-yw33"><%=b.getQuantity()%></td>
                                        <td class="tg-yw33"><%=b.getMonetary_value()%></td>
                                    </tr>

                                    <%
                                        }
                                    %>


                                    <tr>
                                        <td class="tg-yw33">Total</td>
                                        <td class="tg-yw33"></td>
                                        <td class="tg-yw33" style="background-color: #e0e0e0;color: #000"><%=annualgen.getTotalsales()%></td>
                                        <td class="tg-yw33" style="background-color: #e0e0e0;color: #000"><%=annualgen.getTotalsalesincome()%></td>
                                    </tr>
                                    <!--</tbody>-->
                                </table>
                                <div class="clearfix"></div>
                            </div>

                            <!--</div>-->
                            <!--<div class="content-top">-->
                            <div class="content-box">
                                <div class="head-top">
                                    <h3 style="text-align: center;text-decoration: underline"><br>Annual purchases</h3>
                                </div>
                                <table class="tg" >
                                    <!--<thead>-->
                                    <tr>
                                        <th class="tg-yw4l">Branch ID</th>
                                        <th class="tg-yw4l">Branch</th>
                                        <th class="tg-yw4l">Quantity</th>
                                        <th class="tg-yw4l">Total (Rs.)</th>
                                    </tr>
                                    <!--                                            </thead>
                                                                                <tbody>-->

                                    <%
                                        for (AnnualGeneralItem b : annualgen_purs) {
                                    %>

                                    <tr>
                                        <td class="tg-yw33"><%=Branch.getBranchIDfromName(b.getBranch())%></td>
                                        <td class="tg-yw33"><%=b.getBranch()%></td>
                                        <td class="tg-yw33"><%=b.getQuantity()%></td>
                                        <td class="tg-yw33"><%=b.getMonetary_value()%></td>
                                    </tr>

                                    <%
                                        }
                                    %>


                                    <tr>
                                        <td class="tg-yw33">Total</td>
                                        <td class="tg-yw33"></td>
                                        <td class="tg-yw33" style="background-color: #e0e0e0;color: #000"><%=annualgen.getTotalpurchase()%></td>
                                        <td class="tg-yw33" style="background-color: #e0e0e0;color: #000"><%=annualgen.getTotalpurchaserevenue()%></td>
                                    </tr>
                                    <!--</tbody>-->
                                </table>
                                <div class="clearfix"></div>
                            </div>
                            <!--</div>-->
                            <div class="clearfix"> </div>

                        </div>



                        <%
                        } else if (type.equals("AB") && branch != null) {
                            AnnualBranch annualbranch = new AnnualBranch(branch, year);
                            ArrayList<AnnualBranchItem> annualbranch_sales = annualbranch.getSalesrecords();
                            ArrayList<AnnualBranchItem> annualbranch_purs = annualbranch.getPurchaserecords();
                            salesArray = annualbranch.ABSalestoJSArray();
                            purchaseArray = annualbranch.ABPurchasestoJSArray();
                        %>
                        <h3 class="head-top" style="text-align: center">Annual branch report <%=year%> for <%=branch.getName()%> branch</h3>
                        <div class="content-top">
                            <div class="col-md-12 content-top-2">
                                <div class="content-graph">
                                    <div class="content-color">
                                        <div class="content-ch">
                                            <p><i></i> Purchases </p>

                                            <div class="clearfix"> </div>
                                        </div>
                                        <div class="content-ch1">
                                            <p><i></i> Sales</p>

                                            <div class="clearfix"> </div>
                                        </div>
                                    </div>


                                    <div class="graph-container">

                                        <div id="graph-lines"> </div>
                                        <div id="graph-bars"> </div>
                                    </div>
                                    <hr>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="content-top">
                                <div class="content-box">
                                    <div class="head-top">
                                        <h3 style="text-align: center;text-decoration: underline"><br>Annual sales</h3>
                                    </div>
                                    <table class="tg" >
                                        <!--<thead>-->
                                        <tr>
                                            <th class="tg-yw4l">#</th>
                                            <th class="tg-yw4l">Month</th>
                                            <th class="tg-yw4l">Quantity</th>
                                            <th class="tg-yw4l">Total (Rs.)</th>
                                        </tr>
                                        <!--                                            </thead>
                                                                                    <tbody>-->

                                        <%
                                            for (AnnualBranchItem b : annualbranch_sales) {
                                        %>

                                        <tr>
                                            <td class="tg-yw33"><%=AnnualBranchItem.getMonthIDfromName(b.getMonth())%></td>
                                            <td class="tg-yw33"><%=b.getMonth()%></td>
                                            <td class="tg-yw33"><%=b.getQuantity()%></td>
                                            <td class="tg-yw33"><%=b.getMonetary_value()%></td>
                                        </tr>

                                        <%
                                            }
                                        %>


                                        <tr>
                                            <td class="tg-yw33">Total</td>
                                            <td class="tg-yw33" style="background-color: #e0e0e0;color: #000"></td>
                                            <td class="tg-yw33"><%=annualbranch.getTotalsales()%></td>
                                            <td class="tg-yw33" style="background-color: #e0e0e0;color: #000"><%=annualbranch.getSalesincome()%></td>
                                        </tr>
                                        <!--</tbody>-->
                                    </table>
                                    <div class="clearfix"></div>
                                </div>

                            </div>
                            <div class="content-top">
                                <div class="content-box">
                                    <div class="head-top">
                                        <h3 style="text-align: center;text-decoration: underline"><br>Annual purchases</h3>
                                    </div>
                                    <table class="tg" >
                                        <!--<thead>-->
                                        <tr>
                                            <th class="tg-yw4l">#</th>
                                            <th class="tg-yw4l">Month</th>
                                            <th class="tg-yw4l">Quantity</th>
                                            <th class="tg-yw4l">Total (Rs.)</th>
                                        </tr>
                                        <!--                                            </thead>
                                                                                    <tbody>-->

                                        <%
                                            for (AnnualBranchItem b : annualbranch_purs) {
                                        %>

                                        <tr>
                                            <td class="tg-yw33"><%=AnnualBranchItem.getMonthIDfromName(b.getMonth())%></td>
                                            <td class="tg-yw33"><%=b.getMonth()%></td>
                                            <td class="tg-yw33"><%=b.getQuantity()%></td>
                                            <td class="tg-yw33"><%=b.getMonetary_value()%></td>
                                        </tr>

                                        <%
                                            }
                                        %>


                                        <tr>
                                            <td class="tg-yw33" style="background-color: #e0e0e0;color: #000">Total</td>
                                            <td class="tg-yw33"></td>
                                            <td class="tg-yw33"><%=annualbranch.getTotalpurchases()%></td>
                                            <td class="tg-yw33" style="background-color: #e0e0e0;color: #000"><%=annualbranch.getPurchaserevenue()%></td>
                                        </tr>
                                        <!--</tbody>-->
                                    </table>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="clearfix"> </div>

                        <%

                        } else if (type.equals("MG") && month != 0) {
                            MonthlyReport monthgen = new MonthlyReport(month, year);
                            monthgen.generate();
                            ArrayList<MonthlyGeneralItem> monthgen_sales = monthgen.getSales();
                            ArrayList<MonthlyGeneralItem> monthgen_purs = monthgen.getPurchases();
                            salesArray = monthgen.MGSalestoJSArray();
                            purchaseArray = monthgen.MGPurchasestoJSArray();
                        %>
                        <h3 class="head-top" style="text-align: center">Monthly General report <%=monthname%> <%=year%> </h3>
                        <div class="content-top">
                            <div class="col-md-12 content-top-2">
                                <div class="content-graph">
                                    <div class="content-color">
                                        <div class="content-ch">
                                            <p><i></i> Purchases </p>

                                            <div class="clearfix"> </div>
                                        </div>
                                        <div class="content-ch1">
                                            <p><i></i> Sales</p>

                                            <div class="clearfix"> </div>
                                        </div>
                                    </div>


                                    <div class="graph-container">

                                        <div id="graph-lines"> </div>
                                        <div id="graph-bars"> </div>
                                    </div>

                                </div>
                                <hr>
                            </div>
                            <div class="clearfix"></div>
                            <div class="content-top">
                                <div class="content-box">
                                    <div class="head-top">
                                        <h3 style="text-align: center;text-decoration: underline"><br>Monthly sales</h3>
                                    </div>
                                    <table class="tg" >
                                        <!--<thead>-->
                                        <tr>
                                            <th class="tg-yw4l">Branch ID</th>
                                            <th class="tg-yw4l">Branch</th>
                                            <th class="tg-yw4l">Quantity</th>
                                            <th class="tg-yw4l">Total (Rs.)</th>
                                        </tr>
                                        <!--                                            </thead>
                                                                                    <tbody>-->

                                        <%
                                            for (MonthlyGeneralItem b : monthgen_sales) {
                                        %>

                                        <tr>
                                            <td class="tg-yw33"><%=Branch.getBranchIDfromName(b.getBranch())%></td>
                                            <td class="tg-yw33"><%=b.getBranch()%></td>
                                            <td class="tg-yw33"><%=b.getQuantity()%></td>
                                            <td class="tg-yw33"><%=b.getMonetary_value()%></td>
                                        </tr>

                                        <%
                                            }
                                        %>


                                        <tr>
                                            <td class="tg-yw33" style="background-color: #e0e0e0;color: #000">Total</td>
                                            <td class="tg-yw33"></td>
                                            <td class="tg-yw33"><%=monthgen.getTotalsales()%></td>
                                            <td class="tg-yw33" style="background-color: #e0e0e0;color: #000"><%=monthgen.getTotalsalesincome()%></td>
                                        </tr>
                                        <!--</tbody>-->
                                    </table>

                                </div>

                            </div>
                            <div class="content-top">
                                <div class="content-box">
                                    <div class="head-top">
                                        <h3 style="text-align: center;text-decoration: underline"><br>Monthly Purchases</h3>
                                    </div>
                                    <table class="tg" >
                                        <!--<thead>-->
                                        <tr>
                                            <th class="tg-yw4l">Branch ID</th>
                                            <th class="tg-yw4l">Branch</th>
                                            <th class="tg-yw4l">Quantity</th>
                                            <th class="tg-yw4l">Total (Rs.)</th>
                                        </tr>
                                        <!--                                            </thead>
                                                                                    <tbody>-->

                                        <%
                                            for (MonthlyGeneralItem b : monthgen_purs) {
                                        %>

                                        <tr>
                                            <td class="tg-yw33"><%=Branch.getBranchIDfromName(b.getBranch())%></td>
                                            <td class="tg-yw33"><%=b.getBranch()%></td>
                                            <td class="tg-yw33"><%=b.getQuantity()%></td>
                                            <td class="tg-yw33"><%=b.getMonetary_value()%></td>
                                        </tr>

                                        <%
                                            }
                                        %>


                                        <tr>
                                            <td class="tg-yw33" style="background-color: #e0e0e0;color: #000">Total</td>
                                            <td class="tg-yw33"></td>
                                            <td class="tg-yw33"><%=monthgen.getTotalpurchases()%></td>
                                            <td class="tg-yw33" style="background-color: #e0e0e0;color: #000"><%=monthgen.getTotalpurchaserevenue()%></td>
                                        </tr>
                                        <!--</tbody>-->
                                    </table>

                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <%

                        } else if (type.equals("MB") && branch != null && month != 0) {
                            MonthlyBranch monthbranch = new MonthlyBranch(year, month, branch);
                            ArrayList<MonthlyBranchItem> monthbranch_sales = monthbranch.getSales();
                            ArrayList<MonthlyBranchItem> monthbranch_purs = monthbranch.getPurchases();
                            salesArray = monthbranch.MBSalestoJSArray();
                            purchaseArray = monthbranch.MBPurchasestoJSArray();
                        %>
                        <h3 class="head-top">Monthly Branch report for <%=monthname%> <%=year%> for <%=branch.getName()%> branch</h3>
                        <div class="content-top">
                            <div class="content-top">
                                <div class="content-box">
                                    <div class="head-top">
                                        <h3 style="text-align: center;text-decoration: underline"><br>Monthly sales</h3>
                                    </div>
                                    <table class="tg" >
                                        <!--<thead>-->
                                        <tr>
                                            <th class="tg-yw4l">Book</th>
                                            <th class="tg-yw4l">Type</th>
                                            <th class="tg-yw4l">Unit price</th>
                                            <th class="tg-yw4l">Quantity</th>
                                            <th class="tg-yw4l">Total (Rs.)</th>
                                        </tr>
                                        <!--                                            </thead>
                                                                                    <tbody>-->

                                        <%
                                            for (MonthlyBranchItem b : monthbranch_sales) {
                                        %>

                                        <tr>
                                            <td class="tg-yw33"><%=b.getBook()%></td>
                                            <td class="tg-yw33"><%=b.getType()%></td>
                                            <td class="tg-yw33"><%=b.getUprice()%></td>
                                            <td class="tg-yw33"><%=b.getQuantity()%></td>
                                            <td class="tg-yw33"><%=b.getMonetary_value()%></td>
                                        </tr>

                                        <%
                                            }
                                        %>


                                        <tr>
                                            <td class="tg-yw33" style="background-color: #e0e0e0;color: #000">Total</td>
                                            <td class="tg-yw33"></td>
                                            <td class="tg-yw33"></td>
                                            <td class="tg-yw33"><%=monthbranch.getTotalsales()%></td>
                                            <td class="tg-yw33" style="background-color: #e0e0e0;color: #000"><%=monthbranch.getTotalsalesincome()%></td>
                                        </tr>
                                        <!--</tbody>-->
                                    </table>

                                    <div class="clearfix"></div>
                                </div>

                            </div>
                            <div class="content-top">
                                <div class="content-box">
                                    <div class="head-top">
                                        <h3 style="text-align: center;text-decoration: underline"><br>Monthly purchases</h3>
                                    </div>
                                    <table class="tg" >
                                        <!--<thead>-->
                                        <tr>
                                            <th class="tg-yw4l">Book</th>
                                            <th class="tg-yw4l">Type</th>
                                            <th class="tg-yw4l">Unit price</th>
                                            <th class="tg-yw4l">Quantity</th>
                                            <th class="tg-yw4l">Total (Rs.)</th>
                                        </tr>
                                        <!--                                            </thead>
                                                                                    <tbody>-->

                                        <%
                                            for (MonthlyBranchItem b : monthbranch_purs) {
                                        %>

                                        <tr>
                                            <td class="tg-yw33"><%=b.getBook()%></td>
                                            <td class="tg-yw33"><%=b.getType()%></td>
                                            <td class="tg-yw33"><%=b.getUprice()%></td>
                                            <td class="tg-yw33"><%=b.getQuantity()%></td>
                                            <td class="tg-yw33"><%=b.getMonetary_value()%></td>
                                        </tr>

                                        <%
                                            }
                                        %>


                                        <tr >
                                            <td class="tg-yw33" style="background-color: #e0e0e0;color: #000">Total</td>
                                            <td class="tg-yw33"></td>
                                            <td class="tg-yw33"></td>
                                            <td class="tg-yw33"><%=monthbranch.getTotalpurchases()%></td>
                                            <td class="tg-yw33" style="background-color: #e0e0e0;color: #000"><%=monthbranch.getTotalpurchaserevenue()%></td>
                                        </tr>
                                        <!--</tbody>-->
                                    </table>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>

                        <%

                            }
                        %>


                        <!--</div>-->

                        <div class="clearfix"> </div>
                    </div>
                </div>

                <%@include file="admin_footer.jsp" %>
            </div>
        </div>
        <div class="clearfix"></div>
        <!--</div>-->
        <!--</div>-->

        <script src="admin/js/jquery.nicescroll.js"></script>
        <script src="admin/js/scripts.js"></script>


        <!--   -->   
        <!--<script src="plugins/jQuery/jQuery-2.1.4.min.js"></script>-->
        <script src="plugins/jQueryUI/jquery-ui.js"></script>

        <script src="js/bootstrap.min.js"></script>

        <script src="plugins/datatables/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="plugins/datatables/dataTables.bootstrap.min.js" type="text/javascript"></script>

        <script type="text/javascript" src="plugins/jQueryUI/jquery-ui.js"></script>
        <script type="text/javascript" src="js/jquery-ui-1.10.3.custom.min.js"></script>
        <script type="text/javascript" src="js/portBox.slimscroll.min.js"></script>
        <script type="text/javascript" src="js/validation.js"></script>


        <script src="admin/js/jquery.flot.js"></script>
        <script>
            $(document).ready(function () {

                // Graph Data ##############################################
                var graphData = [{
                        // Visits
                        data: <%=salesArray%>,
                        color: '#00AAA0'
                    }, {
                        // Returning Visits
                        data: <%=purchaseArray%>,
                        color: '#FF7A5A',
//                        points: {radius: 4, fillColor: '#E'}
//                        points: {radius: 4}
                    }
                ];

                // Lines Graph #############################################
                $.plot($('#graph-lines'), graphData, {
                    series: {
                        points: {
                            show: true,
                            radius: 5
                        },
                        lines: {
                            show: true
                        },
                        shadowSize: 0
                    },
                    grid: {
                        color: '#7f8c8d',
                        borderColor: 'transparent',
//                        borderWidth: 20,
                        hoverable: true
                    },
                    xaxis: {
                        tickColor: 'transparent'//,
//                        tickDecimals: 2
                    },
                    yaxis: {
                        tickSize: 50
                    }
                });

                // Bars Graph ##############################################
                $.plot($('#graph-bars'), graphData, {
                    series: {
                        bars: {
                            show: true,
//                            barWidth: .9,
                            align: 'center'
                        },
                        shadowSize: 0
                    },
                    grid: {
                        color: '#7f8c8d',
                        borderColor: 'transparent',
                        borderWidth: 20,
                        hoverable: true
                    },
                    xaxis: {
                        tickColor: '#000000'//,
//                        tickDecimals: 2
                    },
                    yaxis: {
                        tickSize: 50
                    }
                });

                // Graph Toggle ############################################
                $('#graph-bars').hide();

                $('#lines').on('click', function (e) {
                    $('#bars').removeClass('active');
                    $('#graph-bars').fadeOut();
                    $(this).addClass('active');
                    $('#graph-lines').fadeIn();
                    e.preventDefault();
                });

                $('#bars').on('click', function (e) {
                    $('#lines').removeClass('active');
                    $('#graph-lines').fadeOut();
                    $(this).addClass('active');
                    $('#graph-bars').fadeIn().removeClass('hidden');
                    e.preventDefault();
                });

                // Tooltip #################################################
                function showTooltip(x, y, contents) {
                    $('<div id="tooltip">' + contents + '</div>').css({
                        top: y - 16,
                        left: x + 20
                    }).appendTo('body').fadeIn();
                }

                var previousPoint = null;

                $('#graph-lines, #graph-bars').bind('plothover', function (event, pos, item) {
                    if (item) {
                        if (previousPoint !== item.dataIndex) {
                            previousPoint = item.dataIndex;
                            $('#tooltip').remove();
                            var x = item.datapoint[0],
                                    y = item.datapoint[1];
                            showTooltip(item.pageX, item.pageY, y + ' items ');
                        }
                    } else {
                        $('#tooltip').remove();
                        previousPoint = null;
                    }
                });

            });
        </script>
    </body>
</html>
