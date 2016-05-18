<%-- 
    Document   : reportview
    Created on : May 16, 2016, 8:35:23 PM
    Author     : Sachi
--%>

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
    </head>
    <body>
        <%
            AnnualReport annualgen = new AnnualReport(2016);
            ArrayList<AnnualGeneralItem> annualgen_sales = annualgen.getSalesrecords();
            ArrayList<AnnualGeneralItem> annualgen_purs = annualgen.getPurchaserecords();

            MonthlyReport monthgen = new MonthlyReport(5, 2016);
            ArrayList<MonthlyGeneralItem> monthgen_sales = monthgen.getSales();
            ArrayList<MonthlyGeneralItem> monthgen_purs = monthgen.getPurchases();

            MonthlyBranch monthbranch = new MonthlyBranch(2016, 3, DBDatalist.getBranch(1));
            ArrayList<MonthlyBranchItem> monthbranch_sales = monthbranch.getSales();
            ArrayList<MonthlyBranchItem> monthbranch_purs = monthbranch.getPurchases();

            AnnualBranch annualbranch = new AnnualBranch(DBDatalist.getBranch(1), 2016);
            ArrayList<AnnualBranchItem> annualbranch_sales = annualbranch.getSalesrecords();
            ArrayList<AnnualBranchItem> annualbranch_purs = annualbranch.getPurchaserecords();
        %>

        <%--<%@include file="admin_sidebar.jsp" %>--%>
        <div id="wrapper">
            <!----->

            <div id="page-wrapper" class="gray-bg dashbard-1">
                <div class="content-main">
                    <div class="grid-form" >

                        <div class="grid-form1"> 
                            <div class="col-md-12">
                                <%                                    if (request.getParameter("msg") != null) {
                                        if (request.getParameter("msg").equals("error")) {
                                %>
                                <div class="col-md-12 text-center">
                                    <label class="label-warning"><i class="fa fa-warning"></i> Warning:
                                        Oopsee! Something went wrong. <br/>Please try again.</label><hr>
                                </div>
                                <%
                                    }
                                    if (request.getParameter("msg").equals("incorrect")) {
                                %>
                                <div class="col-md-12 text-center">
                                    <!--<div class="callout callout-danger" style="margin-bottom: 0!important;">-->												
                                    <label class="label-warning"><i class="fa fa-warning"></i> Warning:
                                        Incorrect details</label><hr>
                                    <!--</div>-->
                                </div>
                                <%
                                    }
                                    if (request.getParameter("msg").equals("success")) {
                                %>
                                <div class="col-md-12 text-center">
                                    <!--<div class="callout callout-danger" style="margin-bottom: 0!important;">-->												
                                    <label class="label-warning"><i class="fa fa-warning"></i> Warning:
                                        Success</label><hr>
                                    <!--</div>-->
                                </div>
                                <%
                                        }
                                    }
                                %>
                                <!--                                <div id="AGR">
                                                                    <h3 class="head-top">Annual general report for the year 2016</h3>
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
                                                                        </div>
                                                                        <div class="clearfix"></div>
                                                                        <div class="content-top">
                                                                            <div class="content-box">
                                                                                <div class="head-top">
                                                                                    <h3 style="text-align: center;text-decoration: underline"><br>Annual sales</h3>
                                                                                </div>
                                                                                <div class="col-md-12">
                                                                                    <div class="col-md-4">
                                                                                        <label class="active" style="text-decoration: underline">Branch name</label>
                                                                                    </div>
                                                                                    <div class="col-md-4">
                                                                                        <label class="active" style="text-decoration: underline">Total sales</label>
                                                                                    </div>
                                                                                    <div class="col-md-4">
                                                                                        <label class="active" style="text-decoration: underline">Total sales income</label>
                                                                                    </div>
                                                                                </div>
                                                                                <hr>
                                <%
                                    for (AnnualGeneralItem b : annualgen_sales) {
                                %>
                                <div class="col-md-12">
                                    <div class="col-md-4">
                                        <p><%=b.getBranch()%></p>
                                    </div>
                                    <div class="col-md-4">
                                        <p><%=b.getQuantity()%></p>
                                    </div>
                                    <div class="col-md-4">
                                        <p><%=b.getMonetary_value()%></p>
                                    </div>
                                </div>
                                <%
                                    }
                                %>
                                <div class="col-md-12">
                                    <div class="col-md-4">
                                        <hr>
                                        <p>Total</p>
                                        <hr>
                                    </div>
                                    <div class="col-md-4">
                                        <hr>
                                        <p><%=annualgen.getTotalsales()%></p>
                                        <hr>
                                    </div>
                                    <div class="col-md-4">
                                        <hr>
                                        <p><%=annualgen.getTotalsalesincome()%></p>
                                        <hr>
                                    </div>
                                </div>

                                <div class="clearfix"></div>
                            </div>

                        </div>
                        <div class="content-top">
                            <div class="content-box">
                                <div class="head-top">
                                    <h3 style="text-align: center;text-decoration: underline"><br>Annual purchases</h3>
                                </div>
                                <div class="col-md-12">
                                    <div class="col-md-4">
                                        <label class="active" style="text-decoration: underline">Branch name</label>
                                    </div>
                                    <div class="col-md-4">
                                        <label class="active" style="text-decoration: underline">Total purchases</label>
                                    </div>
                                    <div class="col-md-4">
                                        <label class="active" style="text-decoration: underline">Total purchase revenue</label>
                                    </div>
                                </div>
                                <hr>
                                <%
                                    for (AnnualGeneralItem b : annualgen_purs) {
                                %>
                                <div class="col-md-12">
                                    <div class="col-md-4">
                                        <p><%=b.getBranch()%></p>
                                    </div>
                                    <div class="col-md-4">
                                        <p><%=b.getQuantity()%></p>
                                    </div>
                                    <div class="col-md-4">
                                        <p><%=b.getMonetary_value()%></p>
                                    </div>
                                </div>
                                <%
                                    }
                                %>
                                <div class="col-md-12">
                                    <div class="col-md-4">
                                        <hr>
                                        <p>Total</p>
                                        <hr>
                                    </div>
                                    <div class="col-md-4">
                                        <hr>
                                        <p><%=annualgen.getTotalpurchase()%></p>
                                        <hr>
                                    </div>
                                    <div class="col-md-4">
                                        <hr>
                                        <p><%=annualgen.getTotalpurchaserevenue()%></p>
                                        <hr>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                        <div class="clearfix"> </div>
                    </div>

                </div>-->
                                <!--                                <div id="AGR">
                                                                    <h3 class="head-top">Monthly Branch report for the March 2016 - Nugegoda branch</h3>
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
                                                                        </div>
                                                                        <div class="clearfix"></div>
                                                                        <div class="content-top">
                                                                            <div class="content-box">
                                                                                <div class="head-top">
                                                                                    <h3 style="text-align: center;text-decoration: underline"><br>Monthly sales</h3>
                                                                                </div>
                                                                                <div class="col-md-12">
                                                                                    <div class="col-md-4">
                                                                                        <label class="active" style="text-decoration: underline">Book</label>
                                                                                    </div>
                                                                                    <div class="col-md-2">
                                                                                        <label class="active" style="text-decoration: underline">Type</label>
                                                                                    </div>
                                                                                    <div class="col-md-2">
                                                                                        <label class="active" style="text-decoration: underline">Unit price</label>
                                                                                    </div>
                                                                                    <div class="col-md-2">
                                                                                        <label class="active" style="text-decoration: underline">Quantity</label>
                                                                                    </div>
                                                                                    <div class="col-md-2">
                                                                                        <label class="active" style="text-decoration: underline">Sales income</label>
                                                                                    </div>
                                                                                </div>
                                                                                <hr>
                                <%
                                    for (MonthlyBranchItem b : monthbranch_sales) {
                                %>
                                <div class="col-md-12">
                                    <div class="col-md-4">
                                        <p><%=b.getBook()%></p>
                                    </div>
                                    <div class="col-md-2">
                                        <p><%=b.getType()%></p>
                                    </div>
                                    <div class="col-md-2">
                                        <p><%=b.getUprice()%></p>
                                    </div>
                                    <div class="col-md-2">
                                        <p><%=b.getQuantity()%></p>
                                    </div>
                                    <div class="col-md-2">
                                        <p><%=b.getMonetary_value()%></p>
                                    </div>
                                </div>
                                <%
                                    }
                                %>
                                <div class="col-md-12">
                                    <div class="col-md-4">
                                        <hr>
                                        <p>Total</p>
                                        <hr>
                                    </div>
                                    <div class="col-md-4">

                                    </div>
                                    <div class="col-md-2">
                                        <hr>
                                        <p><%=monthbranch.getTotalsales()%></p>
                                        <hr>
                                    </div>
                                    <div class="col-md-2">
                                        <hr>
                                        <p><%=monthbranch.getTotalsalesincome()%></p>
                                        <hr>
                                    </div>
                                </div>

                                <div class="clearfix"></div>
                            </div>

                        </div>
                        <div class="content-top">
                            <div class="content-box">
                                <div class="head-top">
                                    <h3 style="text-align: center;text-decoration: underline"><br>Monthly purchases</h3>
                                </div>
                                <div class="col-md-12">
                                    <div class="col-md-4">
                                        <label class="active" style="text-decoration: underline">Book</label>
                                    </div>
                                    <div class="col-md-2">
                                        <label class="active" style="text-decoration: underline">Type</label>
                                    </div>
                                    <div class="col-md-2">
                                        <label class="active" style="text-decoration: underline">Unit price</label>
                                    </div>
                                    <div class="col-md-2">
                                        <label class="active" style="text-decoration: underline">Quantity</label>
                                    </div>
                                    <div class="col-md-2">
                                        <label class="active" style="text-decoration: underline">Sales income</label>
                                    </div>
                                </div>
                                <hr>
                                <%
                                    for (MonthlyBranchItem b : monthbranch_purs) {
                                %>

                                <div class="col-md-12">
                                    <div class="col-md-4">
                                        <p><%=b.getBook()%></p>
                                    </div>
                                    <div class="col-md-2">
                                        <p><%=b.getType()%></p>
                                    </div>
                                    <div class="col-md-2">
                                        <p><%=b.getUprice()%></p>
                                    </div>
                                    <div class="col-md-2">
                                        <p><%=b.getQuantity()%></p>
                                    </div>
                                    <div class="col-md-2">
                                        <p><%=b.getMonetary_value()%></p>
                                    </div>
                                </div>

                                <%
                                    }
                                %>
                                <div class="col-md-12">
                                    <div class="col-md-4">
                                        <hr>
                                        <p>Total</p>
                                        <hr>
                                    </div>
                                    <div class="col-md-4">

                                    </div>
                                    <div class="col-md-2">
                                        <hr>
                                        <p><%=monthbranch.getTotalpurchases()%></p>
                                        <hr>
                                    </div>
                                    <div class="col-md-2">
                                        <hr>
                                        <p><%=monthbranch.getTotalpurchaserevenue()%></p>
                                        <hr>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                        <div class="clearfix"> </div>
                    </div>

                </div>-->

                                <div id="AGR">
                                    <h3 class="head-top">Annual branch report for March 2016 - Nugegoda</h3>
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
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="content-top">
                                            <div class="content-box">
                                                <div class="head-top">
                                                    <h3 style="text-align: center;text-decoration: underline"><br>Annual sales</h3>
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="col-md-4">
                                                        <label class="active" style="text-decoration: underline">Month</label>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <label class="active" style="text-decoration: underline">Total sales</label>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <label class="active" style="text-decoration: underline">Total sales income</label>
                                                    </div>
                                                </div>
                                                <hr>
                                                <%
                                                    for (AnnualBranchItem b : annualbranch_sales) {
                                                %>
                                                <div class="col-md-12">
                                                    <div class="col-md-4">
                                                        <p><%=b.getMonth()%></p>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <p><%=b.getQuantity()%></p>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <p><%=b.getMonetary_value()%></p>
                                                    </div>
                                                </div>
                                                <%
                                                    }
                                                %>
                                                <div class="col-md-12">
                                                    <div class="col-md-4">
                                                        <hr>
                                                        <p>Total</p>
                                                        <hr>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <hr>
                                                        <p><%=annualbranch.getTotalsales()%></p>
                                                        <hr>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <hr>
                                                        <p><%=annualbranch.getSalesincome()%></p>
                                                        <hr>
                                                    </div>
                                                </div>

                                                <div class="clearfix"></div>
                                            </div>

                                        </div>
                                        <div class="content-top">
                                            <div class="content-box">
                                                <div class="head-top">
                                                    <h3 style="text-align: center;text-decoration: underline"><br>Annual purchases</h3>
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="col-md-4">
                                                        <label class="active" style="text-decoration: underline">Month</label>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <label class="active" style="text-decoration: underline">Total purchases</label>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <label class="active" style="text-decoration: underline">Total purchase revenue</label>
                                                    </div>
                                                </div>
                                                <hr>
                                                <%
                                                    for (AnnualBranchItem b : annualbranch_purs) {
                                                %>
                                                <div class="col-md-12">
                                                    <div class="col-md-4">
                                                        <p><%=b.getMonth()%></p>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <p><%=b.getQuantity()%></p>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <p><%=b.getMonetary_value()%></p>
                                                    </div>
                                                </div>
                                                <%
                                                    }
                                                %>
                                                <div class="col-md-12">
                                                    <div class="col-md-4">
                                                        <hr>
                                                        <p>Total</p>
                                                        <hr>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <hr>
                                                        <p><%=annualbranch.getTotalpurchases()%></p>
                                                        <hr>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <hr>
                                                        <p><%=annualbranch.getPurchaserevenue()%></p>
                                                        <hr>
                                                    </div>
                                                </div>
                                                <div class="clearfix"></div>
                                            </div>
                                        </div>
                                        <div class="clearfix"> </div>
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
                        data: <%=annualbranch.ABSalestoJSArray()%>,
                        color: '#A7DBDB'
                    }, {
                        // Returning Visits
                        data: <%=annualbranch.ABPurchasestoJSArray()%>,
                        color: '#ED6498',
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
