<%-- 
    Document   : trial2
    Created on : May 18, 2016, 5:50:16 PM
    Author     : Sachi
--%>

<%@page import="Model.Branch"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Type"%>
<%@page import="Controller.DBDatalist"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!--        <script type="text/javascript" src="plugins/graph/jquery.flot.axislabels.js"></script>
                <script type="text/javascript" src="plugins/graph/jquery.flot.min.js"></script>
                <script type="text/javascript" src="plugins/graph/jquery.flot.symbol.min.js"></script>
                <script type="text/javascript" src="plugins/graph/jquery.flot.time.min.js"></script>
                <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
                <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/flot/0.8.2/jquery.flot.min.js"></script>
                <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/flot/0.8.2/jquery.flot.symbol.min.js"></script>
                <script type="text/javascript" src="http://raw.github.com/markrcote/flot-axislabels/master/jquery.flot.axislabels.js"></script>
                <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/flot/0.8.2/jquery.flot.time.min.js"></script>
                <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.6.1.min.js"></script>-->

        <script type="text/javascript" src="plugins/graph/canvasjs.min.js"></script>

        <script type="text/javascript">
            window.onload = function () {
                var chart = new CanvasJS.Chart("chartContainer",
                        {
                            title: {
                                text: "Olympic Medals of all Times (till 2012 Olympics)"
                            },
                            animationEnabled: true,
                            legend: {
                                cursor: "pointer",
                                itemclick: function (e) {
                                    if (typeof (e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
                                        e.dataSeries.visible = false;
                                    } else {
                                        e.dataSeries.visible = true;
                                    }
                                    chart.render();
                                }
                            },
                            axisY: {
                                title: "Medals"
                            },
                            toolTip: {
                                shared: true,
                                content: function (e) {
                                    var str = '';
                                    var str2;
                                    for (var i = 0; i < e.entries.length; i++) {
                                        var str1 = "<span style= 'color:" + e.entries[i].dataSeries.color + "'> " + e.entries[i].dataSeries.name + "</span>: <strong>" + e.entries[i].dataPoint.y + "</strong> <br/>";
                                        str = str.concat(str1);
                                    }
                                    str2 = "<span style = 'color:DodgerBlue; '><strong>" + e.entries[0].dataPoint.label + "</strong></span><br/>";

                                    return (str2.concat(str));
                                }

                            },
                            data: [
                                {
                                    type: "bar",
                                    showInLegend: true,
                                    name: "Gold",
                                    color: "gold",
                                    dataPoints: [
                                        {y: 198, label: "Italy"},
                                        {y: 201, label: "China"},
                                        {y: 202, label: "France"},
                                        {y: 236, label: "Great Britain"},
                                        {y: 395, label: "Soviet Union"},
                                        {y: 957, label: "USA"}


                                    ]
                                },
                                {
                                    type: "bar",
                                    showInLegend: true,
                                    name: "Bronze",
                                    color: "#A57164",
                                    dataPoints: [
                                        {y: 185, label: "Italy"},
                                        {y: 128, label: "China"},
                                        {y: 246, label: "France"},
                                        {y: 272, label: "Great Britain"},
                                        {y: 296, label: "Soviet Union"},
                                        {y: 666, label: "USA"}

                                    ]
                                }

                            ]
                        });

                chart.render();
            }
        </script>

<!--        <script type="text/javascript">
            window.onload = function () {
                var chart = new CanvasJS.Chart("chartContainer",
                        {
                            title: {
                                text: "Site Traffic",
                                fontSize: 30
                            },
                            animationEnabled: true,
                            axisX: {
                                gridColor: "Silver",
                                tickColor: "silver",
                                valueFormatString: "DD/MMM"

                            },
                            toolTip: {
                                shared: true
                            },
                            theme: "theme2",
                            axisY: {
                                gridColor: "Silver",
                                tickColor: "silver"
                            },
                            legend: {
                                verticalAlign: "center",
                                horizontalAlign: "right"
                            },
                            data: [
                                {
                                    type: "line",
                                    showInLegend: true,
                                    lineThickness: 2,
                                    name: "Purchases",
                                    markerType: "square",
                                    color: "#F08080",
                                    dataPoints: [
                                        {x: "new Da", y: 650},
                                        {x: "new", y: 700},
                                        {x: "new", y: 710},
                                        {x: "new", y: 658}
                                    ]
                                },
                                {
                                    type: "line",
                                    showInLegend: true,
                                    name: "Sales",
                                    color: "#20B2AA",
                                    lineThickness: 2,
                                    dataPoints: [
                                        {x: "new", y: 510},
                                        {x: "new", y: 560},
                                        {x: "new", y: 540},
                                        {x: "new", y: 558}
                                       
                                    ]
                                }


                            ],
                            legend:{
                                cursor: "pointer",
                                itemclick: function (e) {
                                    if (typeof (e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
                                        e.dataSeries.visible = false;
                                    } else {
                                        e.dataSeries.visible = true;
                                    }
                                    chart.render();
                                }
                            }
                        });

                chart.render();
            }
        </script>-->
    </head>
    <body onload="my()">

        <h1>Hello World!</h1>
        <div id="chartContainer" style="height: 300px; width: 100%;">
        </div>
        <div id="chartContainer2" style="height: 300px; width: 100%;">
        </div>
        <script>
            function my(){
                window.close();
            }
        </script>
    </body>
</html>
