<%-- 
    Document   : admin_home
    Created on : Apr 12, 2016, 7:56:46 PM
    Author     : Sachi
--%>

<%@page import="java.text.DateFormatSymbols"%>
<%@page import="Model.Report"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="Model.Book"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
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
        <%@include file="admin_sidebar.jsp" %>
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
                                <h3 class="head-top">Home</h3>
                                <%
                                    if (null != session.getAttribute("user")) {
                                        User user = (User) session.getAttribute("user");
                                        if (user.getIduser() == 1) {
                                            Date today = new Date();
                                            Calendar cal = Calendar.getInstance();
                                            cal.setTime(today);
                                            int month = cal.get(Calendar.MONTH) + 1;
                                            int year = cal.get(Calendar.YEAR);
                                            if (!Report.isMonthlyReportSet(year, month)) {
                                %>
                                <div class="col-md-12" style="border: 5px solid #ff4c65" >
                                    <hr>
                                    <form action="Executereport" method="POST">

                                        <div class="form-group">
                                            <div class="col-md-6">
                                                <p>New reports are ready to be generated.<br>Click button to generate.</p>

                                                <input type="hidden" name="report" value="set">
                                                <input type="hidden" name="month" value="<%=month%>">
                                                <input type="hidden" name="year" value="<%=year%>">
                                            </div>
                                            <div class="col-md-3">
                                                <p><%=new DateFormatSymbols().getMonths()[month - 1] + " - " + year%> </p>
                                            </div>
                                            <div class="col-md-3">
                                                <button type="submit" class="btn-lg btn-success">Generate reports</button>
                                            </div>                                        
                                        </div>

                                    </form>
                                    <div class="clearfix"></div>
                                    <hr>
                                </div>
                                <div class="clearfix"></div>
                                <br>


                                <%
                                            }
                                        }
                                    }
                                %>
                                <div class="content-mid">

                                    <div class="col-md-5">
                                        <div class="cal1 cal_2"><div class="clndr"><div class="clndr-controls"><div class="clndr-control-button"><p class="clndr-previous-button">previous</p></div><div class="month">July 2015</div><div class="clndr-control-button rightalign"><p class="clndr-next-button">next</p></div></div><table class="clndr-table" border="0" cellspacing="0" cellpadding="0"><thead><tr class="header-days"><td class="header-day">S</td><td class="header-day">M</td><td class="header-day">T</td><td class="header-day">W</td><td class="header-day">T</td><td class="header-day">F</td><td class="header-day">S</td></tr></thead><tbody><tr><td class="day adjacent-month last-month calendar-day-2015-06-28"><div class="day-contents">28</div></td><td class="day adjacent-month last-month calendar-day-2015-06-29"><div class="day-contents">29</div></td><td class="day adjacent-month last-month calendar-day-2015-06-30"><div class="day-contents">30</div></td><td class="day calendar-day-2015-07-01"><div class="day-contents">1</div></td><td class="day calendar-day-2015-07-02"><div class="day-contents">2</div></td><td class="day calendar-day-2015-07-03"><div class="day-contents">3</div></td><td class="day calendar-day-2015-07-04"><div class="day-contents">4</div></td></tr><tr><td class="day calendar-day-2015-07-05"><div class="day-contents">5</div></td><td class="day calendar-day-2015-07-06"><div class="day-contents">6</div></td><td class="day calendar-day-2015-07-07"><div class="day-contents">7</div></td><td class="day calendar-day-2015-07-08"><div class="day-contents">8</div></td><td class="day calendar-day-2015-07-09"><div class="day-contents">9</div></td><td class="day calendar-day-2015-07-10"><div class="day-contents">10</div></td><td class="day calendar-day-2015-07-11"><div class="day-contents">11</div></td></tr><tr><td class="day calendar-day-2015-07-12"><div class="day-contents">12</div></td><td class="day calendar-day-2015-07-13"><div class="day-contents">13</div></td><td class="day calendar-day-2015-07-14"><div class="day-contents">14</div></td><td class="day calendar-day-2015-07-15"><div class="day-contents">15</div></td><td class="day calendar-day-2015-07-16"><div class="day-contents">16</div></td><td class="day calendar-day-2015-07-17"><div class="day-contents">17</div></td><td class="day calendar-day-2015-07-18"><div class="day-contents">18</div></td></tr><tr><td class="day calendar-day-2015-07-19"><div class="day-contents">19</div></td><td class="day calendar-day-2015-07-20"><div class="day-contents">20</div></td><td class="day calendar-day-2015-07-21"><div class="day-contents">21</div></td><td class="day calendar-day-2015-07-22"><div class="day-contents">22</div></td><td class="day calendar-day-2015-07-23"><div class="day-contents">23</div></td><td class="day calendar-day-2015-07-24"><div class="day-contents">24</div></td><td class="day calendar-day-2015-07-25"><div class="day-contents">25</div></td></tr><tr><td class="day calendar-day-2015-07-26"><div class="day-contents">26</div></td><td class="day calendar-day-2015-07-27"><div class="day-contents">27</div></td><td class="day calendar-day-2015-07-28"><div class="day-contents">28</div></td><td class="day calendar-day-2015-07-29"><div class="day-contents">29</div></td><td class="day calendar-day-2015-07-30"><div class="day-contents">30</div></td><td class="day calendar-day-2015-07-31"><div class="day-contents">31</div></td><td class="day adjacent-month next-month calendar-day-2015-08-01"><div class="day-contents">1</div></td></tr></tbody></table></div></div>
                                        <!----Calender -------->
                                        <link rel="stylesheet" href="admin/css/clndr.css" type="text/css" />
                                        <script src="admin/js/underscore-min.js" type="text/javascript"></script>
                                        <script src= "admin/js/moment-2.2.1.js" type="text/javascript"></script>
                                        <script src="admin/js/clndr.js" type="text/javascript"></script>
                                        <script src="admin/js/site.js" type="text/javascript"></script>
                                        <!----End Calender -------->

                                    </div>
                                    <div class="col-md-7 mid-content-top">
                                        <div class="middle-content">
                                            <h3>Latest books</h3>
                                            <!-- start content_slider -->
                                            <%
                                                ArrayList<Book> recentbooks = DBDatalist.getRecentBookList();
                                                if (recentbooks != null) {
                                                    for (Book b : recentbooks) {
                                            %>
                                            <div class="col-md-3">
                                                <img class="lazyOwl img-responsive" src="<%=b.getImage()%> " alt="<%=b.getTitle()%>" >
                                            </div>
                                            <%
                                                    }
                                                }
                                            %>

                                            <div class="clearfix"> </div>
                                        </div>

                                    </div>
                                    <div class="clearfix"> </div>
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

    </body>
</html>