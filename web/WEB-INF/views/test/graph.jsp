<%@ page import="com.budong.R" %><%--
  Created by IntelliJ IDEA.
  User: S401-28
  Date: 2018-11-26
  Time: 오전 10:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Graph Test</title>
    <script type="text/javascript">
        window.onload = function () {

            var dataPoints = [];

            var options = {
                animationEnabled: true,
                theme: "light2",
                title: {
                    text: "아파트 년도별 매매가"
                },
                axisX: {
                    valueFormatString: "YYYY",
                    interval:1,
                    intervalType:"year"
                },
                axisY: {
                    title: "시세(만원)",
                    includeZero: false,
                    ValueFormatString: "#,###.###",
                    maximum: 40000
                },
                data: [{
                    type: "column",
                    xValueType: "dateTime",
                    xValueFormatString:"YYYY",
                    yValueFormatString:"#,###.###",
                    dataPoints: dataPoints
                }]
            };
            updateData();

            function addData(data) {
                var max = 0;
                $.each(data, function (key, value) {
                    dataPoints.push({"x": new Date(value["year"] + "-1-1"), "y": value["avg"]});

                    if(max < value["avg"]) {
                        max = value["avg"];
                    }
                });

                roundUpMaximum(max);

                console.log(dataPoints);
                $("#chartContainer").CanvasJSChart(options);
                /*var chart = new CanvasJS.Chart("chartContainer",options);
                chart.render();*/

                // setTimeout(updateData, 1500);
            }

            function updateData() {
                var date = new Date();
                var nowYear = date.getFullYear();
                var fromYear = nowYear - 5;
                var requestRest = "http://localhost:8090<%=R.rest.apartment_deal_info_avg_by_year%>"
                    + "?yearFrom=" + fromYear
                    + "&yearTo=" + nowYear;

                $.getJSON(requestRest, addData);
            }

            function roundUpMaximum(max) {
                max = Math.floor(max);

                var ceilLength = max.toString().length - 1;
                var tenPowCeilLength = Math.pow(10,ceilLength);
                options["axisY"].maximum = Math.floor(max / tenPowCeilLength + 1) * tenPowCeilLength;

                console.log(options["axisY"].maximum);
            }

        }
    </script>
</head>

<body>
<div id="chartContainer" style="height: 300px; width: 100%;"></div>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>
</body>
</html>