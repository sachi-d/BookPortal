<%-- 
    Document   : trial
    Created on : Mar 17, 2016, 10:24:38 AM
    Author     : Sachi
--%>

<%@page import="Model.Type"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Subject"%>
<%@page import="Controller.DBDatalist"%>
<%@page import="Model.Book"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="js/autocomplete/jquery-ui.css">
        <script src="js/autocomplete/jquery-1.10.2.js"></script>
        <script src="js/autocomplete/jquery-ui.js"></script>
        <script>
            function showUser(str) {
                if (str == "") {
                    document.getElementById("txtHint").innerHTML = "";
                    return;
                } else {
                    if (window.XMLHttpRequest) {
                        // code for IE7+, Firefox, Chrome, Opera, Safari
                        xmlhttp = new XMLHttpRequest();
                    } else {
                        // code for IE6, IE5
                        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                    }
                    xmlhttp.onreadystatechange = function () {
                        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                            document.getElementById("txtHint").innerHTML = xmlhttp.responseText;
                        }
                    };
                    xmlhttp.open("GET", "trial.jsp?type=" + str, true);
                    xmlhttp.send();
                }
            }
        </script>
        <script>
            $(function () {
                var availableTags = <%= Book.bookListtoJSArray()%>;

                $("#tags").autocomplete({
                    minLength: 0,
                    source: availableTags,
                    focus: function (event, ui) {
                        $("#tags").val(ui.item.label);
                        return false;
                    },
                    select: function (event, ui) {
                        $("#tags").val(ui.item.label);
                        $("#tagid").val(ui.item.value);
                        $("#tagname").val(ui.item.desc);
//                        document.getElementById('tags').disabled=true;
                        return false;
                    }
                });
            });
        </script>
        <!--        <script>
                    function setType() {
        //                $name = document.getElementById('tags').value;
        //                document.getElementById('tagname').value = $name;
                    }
        
                </script>-->
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

        <form action="login.jsp" onsubmit="return(validate());">
            <label>Date:</label>
            <input type="date" id="txtDateEntered"  >
            <button onclick="checkDate()">Compare</button><br>
            <label>Title : </label>
            <input type="text">
            <br>
            <label>Author : </label>
            <input type="text">
            <br>
            <!-- so and so -->
            <label>Type : </label>
            <select name="type" id='type' onchange="showUser(this.value)">
                <!--<select name="type" id='type' > onChange="GetProductName(this.value)"-->
                <option value="" >type:</option>
                <option value="1" selected="">Fiction</option>
                <option value="2">Non fiction</option>
                <option value="3">Academic</option>
                <option value="4">Children's</option>
            </select>
            <br>
            <label>Subject : </label>
            <select name="subject" id='subject' >
                <option value="">subject:</option>

            </select>
            <br>
            <label>Price : </label>
            <input type="text">
            <br>
            <label for="tags">Tags: </label>
            <input id="tags" type="text">      
            <input id="tagid"  >
            <input id="tagname"  >
            <button type="submit">Submit</button>
            <hr>
        </form>
        <br>
        <div id="txtHint"><b>Person info will be listed here...</b></div>


        <%--<%@include file="getdata1.jsp" %>--%>


        <script type="text/javascript">
            function GetProductName(v) {
                document.getElementById('name').value = v;
                $.ajax({
                    type: "GET",
                    url: "getdata1.jsp",
                    data: "type=" + v,
                    success: function (msg) {

                    }
                });
            }
            function settext() {
                $s = document.getElementById('type').value;
                document.getElementById('name').value = $s;
            }
            $type = $('#type');

            $type.change(
                    function () {
                        $.ajax({
                            type: "GET",
                            url: "Loadsubjects",
                            data: {type: document.getElementById('type').value},
                            success: function (data) {
                                $("#sub").html(data)
                            }
                        });
                    }
            );
        </script>
        <script>
            function validate() {
                //In javascript
                var dateEntered = document.getElementById("txtDateEntered").value;
                // In JQuery
//                var dateEntered = $("#txtDateEntered").val();

                var date = dateEntered.substring(8,10)
                var month = dateEntered.substring(5,7);
                var year = dateEntered.substring(0,4);

                var dateToCompare = new Date(year, month - 1, date);
                var currentDate = new Date();

                if (dateToCompare < currentDate) {
                    return true;
                } else {
                    alert("Date Entered is invalid. Please check again.");
                    return false;
                }
            }
        </script>
    </body>
</html>