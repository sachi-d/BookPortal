<%-- 
    Document   : sidebar
    Created on : Mar 17, 2016, 11:33:12 AM
    Author     : Sachi
--%>

<%@page import="Model.Type"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Subject"%>
<%@page import="Controller.DBDatalist"%>
<%@page import="Controller.DBDatalist"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title> </title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/prettyPhoto.css" rel="stylesheet">
        <link href="css/price-range.css" rel="stylesheet">
        <link href="css/animate.css" rel="stylesheet">
        <link href="css/main.css" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet">
        <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->       
        <link rel="shortcut icon" href="images/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
    </head><!--/head-->

    <body>

        <div class="col-sm-3">
            <div class="left-sidebar">
                <h2>Categories</h2>
                <div class="panel-group category-products" id="accordian"><!--category-productsr-->
                    <%
                        ArrayList<Type> typelist = DBDatalist.getTypeList();
                        if (typelist != null) {
                            for (int j = 0; j < typelist.size(); j++) {
                                Type type = typelist.get(j);
                    %>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordian" href="#sportswear<%=type.getIdType()%>">
                                    <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                        <%= type.getName()%>
                                </a>
                            </h4>
                        </div>
                        <div id="sportswear<%=type.getIdType()%>" class="panel-collapse collapse">
                            <div class="panel-body">
                                <ul>
                                    <%
                                        ArrayList<Subject> arrSubject = DBDatalist.getSubjectsfromType(type);
                                        if (arrSubject != null) {
                                            for (int i = 0; i < arrSubject.size(); i++) {
                                                Subject sub = (Subject) arrSubject.get(i);
                                    %>

                                    <li><a href="viewbooklist.jsp?sub=<%=sub.getIdsubject()%>"><%= sub.getName()%> </a></li>

                                    <%
                                            }
                                        }
                                    %></ul>
                            </div>
                        </div>
                        <hr>
                    </div><%
                            }
                        }
                    %>
        
                </div><!--/category-products-->




            </div>
        </div>




        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/price-range.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
