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
//            $(function () {
//                var availableTags = 
//
//                $("#tags").autocomplete({
//                    minLength: 0,
//                    source: availableTags,
//                    focus: function (event, ui) {
//                        $("#tags").val(ui.item.label);
//                        return false;
//                    },
//                    select: function (event, ui) {
//                        $("#tags").val(ui.item.label);
//                        $("#tagid").val(ui.item.value);
//                        $("#tagname").val(ui.item.desc);
////                        document.getElementById('tags').disabled=true;
//                        return false;
//                    }
//                });
//            });
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
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

        <script src="http://html2canvas.hertzen.com/build/html2canvas.js"></script>

        <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jspdf/0.9.0rc1/jspdf.min.js"></script>
        <script type="text/javascript">
            var doc = new jsPDF();
            var specialElementHandlers = {
                '#editor': function (element, renderer) {
                    return true;
                }
            };

            $(document).ready(function () {
                $('#btn').click(function () {
                    doc.fromHTML($('#content').html(), 15, 15, {
                        'width': 170,
                        'elementHandlers': specialElementHandlers
                    });
                    doc.save('sample-content.pdf');
                });
            });
        </script>
    </head>
    <body>
        <div id="widget">
            <div class="container">
                <div align="center">
                    <h1 align="center" id="download_pdf" class="glyphicon glyphicon-download" style="cursor:pointer;" title="Click to Download Page as PDF"></h1>
                </div>
                <br>
                <section id="page_content">


                    <p> Content goes here, for pdf formatContent goes here, for pdf format Content goes here, for pdf format Content goes here, for pdf format Content goes here, for pdf format Content goes here, for pdf format Content goes here, for pdf format Content goes here, for pdf format Content goes here, for pdf format</p>


                </section>
            </div>
            <hr>
        </div>
        <div id="img-out"></div>
        <!--<input type="image" id="img-out" alt="image">-->
        <input type="button" id="btnSave" value="Save PNG"/>
        <div id="content">
            <h3>The quick brown fox jumps over the lazy dog</h3>
            <p>"The quick brown fox jumps over the lazy dog" is an English-language pangram—a phrase that contains all of the letters of the alphabet.</p>
        </div>
        <div id="editor"></div>
        <button id="btn">Generate PDF</button>
        <hr>
        <section id="download-sec">
            <h1>hi download</h1>
            <p>ffdsbjkl fnhjkl. sdhf </p>
        </section>
        <button onclick="downloadpdf()" type="button">Download</button>
        <form action="trial2.jsp" onsubmit="return(validate());" method="POST">
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

                var date = dateEntered.substring(8, 10)
                var month = dateEntered.substring(5, 7);
                var year = dateEntered.substring(0, 4);

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
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script type='text/javascript' src="jspdf.debug.js"></script>
        <script>
            function downloadpdf() {
                var pdf = new jsPDF('p', 'pt', 'letter')
                        , source = $('#download-sec')[0]
                        , specialElementHandlers = {
                            '#bypassme': function (element, renderer) {
                                return true
                            }
                        }

                margins = {
                    top: 60,
                    bottom: 60,
                    left: 40,
                    width: 522
                };
                // all coords and widths are in jsPDF instance's declared units
                // 'inches' in this case
                pdf.fromHTML(
                        source // HTML string or DOM elem ref.
                        , margins.left // x coord
                        , margins.top // y coord
                        , {
                            'width': margins.width // max width of content on PDF
                            , 'elementHandlers': specialElementHandlers
                        },
                        function (dispose) {
                            // dispose: object with X, Y of the last line add to the PDF
                            //          this allow the insertion of new lines after html
                            pdf.save('Downloaded.pdf');
                        },
                        margins
                        )
            }
        </script>
        <script>
            $(function () {
                $("#btnSave").click(function () {
                    html2canvas($("#widget"), {
                        onrendered: function (canvas) {
                            var data = canvas.toDataURL('image/png');
                            // AJAX call to send `data` to a PHP file that creates an image from the dataURI string and saves it to a directory on the server

                            var image = new Image();
                            image.src = data;
                            document.getElementById('img-out').appendChild(image);
                        }
                    });
                });
            });
        </script>
    </body>
</html>