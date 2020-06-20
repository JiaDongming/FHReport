var dateTimePickerValue;
var dateTimePicker2Value;

$(function () {

    {
        dateTimePickerValue = $("#dateTimePicker").val();
        dateTimePicker2Value = $("#dateTimePicker2").val();
    }

    $("#dateTimePicker").change(function () {
        var checkResult = checkSearchCondition();
        if (checkResult != "false") {
            doReportCall();
        }
    });

    $("#dateTimePicker2").change(function () {
        var checkResult = checkSearchCondition();
        if (checkResult != "false") {
            doReportCall();
        }
    });


    // 单选下拉框内容改变时调用
    $("#Select1").change(function () {
        var checkResult = checkSearchCondition();
        if (checkResult != "false") {
            $("#hidprojectIDs").val($("#Select1").val());
            doReportCall();
        }
    });

});


function checkSearchCondition() {
    var startDateStr = $("#dateTimePicker").val();
    var endDateStr = $("#dateTimePicker2").val();
    var startDate = new Date(startDateStr.replace(/-/g, "/"));
    var endDate = new Date(endDateStr.replace(/-/g, "/"));
    var selectedProjectsStr = $('#Select1').val();

    if (startDate > endDate) {
        alert("开始时间不能超过终止时间，请重新选择。");
        $("#dateTimePicker").val(dateTimePickerValue);
        $("#dateTimePicker2").val(dateTimePicker2Value);
        return "false";
    }
    if (startDateStr == '') {
        alert("开始时间需要填写");
        return "false";
    }
    if (endDateStr == '') {
        alert("结束时间需要填写");
        return "false";
    }

    if ((selectedProjectsStr == "") || (selectedProjectsStr == null)) {
        alert("请选择时间单位！");
        dateTimePickerValue = startDateStr;
        dateTimePicker2Value = endDateStr;
        return "false";
    }

    dateTimePickerValue = startDateStr;
    dateTimePicker2Value = endDateStr;

    return "true";
}


function createChart(strCharts) {
    $("#divGlobalReportHTML6").kendoChart({
        dataSource: {
            data: eval(strCharts)
        },
        chartArea: {
            height: 400
        },
        title: {
            text: "各组织工单数量图(柱状图)"
        },
        legend: {
            visible: true,
            position: "bottom"              // 设置图例在图形的上方还是下方显示，值可以是top,bottom
        },
        seriesDefaults: {
            type: "column",
            stack: true,                    // 加上stack:true,则多个柱状图会叠在一列上，否则显示为多列
            labels: {
                visible: true,              // 设置柱状图上的数字是否显示
                background: "transparent",
                position: "center"          // 设置数字显示在柱形图的中间
            }
        },
        series: [{
            name: "燃气集团",               // 图例名称
            field: "data1",                 // 字典中数据对应的字段名称
            //color: "#44CEF6"               // 设置column颜色
            color: KDChart.getColor(3)     // 设置column颜色，读取KDChart.js文件中的函数
          },
            {
                name: "申能股份",               // 图例名称
                field: "data2",                 // 字典中数据对应的字段名称
                //color: "#44CEF6"               // 设置column颜色
                color: KDChart.getColor(4)     // 设置column颜色，读取KDChart.js文件中的函数
            }
            ,
            {
                name: "申能集团",               // 图例名称
                field: "data3",                 // 字典中数据对应的字段名称
                //color: "#44CEF6"               // 设置column颜色
                color: KDChart.getColor(8)     // 设置column颜色，读取KDChart.js文件中的函数
            }
        ],
        categoryAxis: {
            field: "name",                 // 设置横轴数据读取的字段内容
           
            majorGridLines: {
                visible: false          // 设置是否显示网格线
            },
            line: {
                visible: false
            },
            labels: {
                padding: { top: 5 }     // 设置每列标题和柱状图底部的高度差
            }
        },
        
        valueAxis: {
            title: {
                text: "工单计数"
            },
            labels: {
                format: ""              // 设置纵坐标轴数据的前后缀，比如format: "{0}%"，format: "${0}"
            },
            line: {
                visible: false
            },
            
            axisCrossingValue: 0        // 纵坐标轴的基线设置，大于该数字的柱状图向上走，小于该数字的柱状图向下走
        },
        tooltip: {
            visible: true,              // 设置鼠标放到柱状图上是否显示信息以及信息的格式
            format: "",
            template: "#= category #, #= series.name#, #: kendo.format('{0:n0}', value) #"     // n2表示保留小数点后2位，还可以是n0,n1,...值
        }
    });
    $("#divGlobalReportHTMLLine").kendoChart({
        dataSource: {
            data: eval(strCharts)
        },
        chartArea: {
            height: 400
        },
        title: {
            text: "各组织工单数量图(柱状图)"
        },
        legend: {
            visible: true,
            position: "bottom"              // 设置图例在图形的上方还是下方显示，值可以是top,bottom
        },
        seriesDefaults: {
            type: "line",
            stack: true,                    // 加上stack:true,则多个柱状图会叠在一列上，否则显示为多列
            labels: {
                visible: true,              // 设置柱状图上的数字是否显示
                background: "transparent",
                position: "center"          // 设置数字显示在柱形图的中间
            }
        },
        series: [{
            name: "燃气集团",               // 图例名称
            field: "data1",                 // 字典中数据对应的字段名称
            //color: "#44CEF6"               // 设置column颜色
            color: KDChart.getColor(3)     // 设置column颜色，读取KDChart.js文件中的函数
        },
            {
                name: "申能股份",               // 图例名称
                field: "data2",                 // 字典中数据对应的字段名称
                //color: "#44CEF6"               // 设置column颜色
                color: KDChart.getColor(4)     // 设置column颜色，读取KDChart.js文件中的函数
            }
            ,
            {
                name: "申能集团",               // 图例名称
                field: "data3",                 // 字典中数据对应的字段名称
                //color: "#44CEF6"               // 设置column颜色
                color: KDChart.getColor(8)     // 设置column颜色，读取KDChart.js文件中的函数
            }
        ],
        categoryAxis: {
            field: "name",                 // 设置横轴数据读取的字段内容

            majorGridLines: {
                visible: false          // 设置是否显示网格线
            },
            line: {
                visible: false
            },
            labels: {
                padding: { top: 5 }     // 设置每列标题和柱状图底部的高度差
            }
        },

        valueAxis: {
            title: {
                text: "工单计数"
            },
            labels: {
                format: ""              // 设置纵坐标轴数据的前后缀，比如format: "{0}%"，format: "${0}"
            },
            line: {
                visible: false
            },

            axisCrossingValue: 0        // 纵坐标轴的基线设置，大于该数字的柱状图向上走，小于该数字的柱状图向下走
        },
        tooltip: {
            visible: true,              // 设置鼠标放到柱状图上是否显示信息以及信息的格式
            format: "",
            template: "#= category #, #= series.name#, #: kendo.format('{0:n0}', value) #"     // n2表示保留小数点后2位，还可以是n0,n1,...值
        }
    });
}

function createChartLine(strCharts) {
    $("#divGlobalReportHTMLLine").kendoChart({
        dataSource: {
            data: eval(strCharts)
        },
        chartArea: {
            height: 400
        },
        title: {
            text: "各组织工单数量图(线形图)"
        },
        legend: {
            visible: true,
            position: "bottom"              // 设置图例在图形的上方还是下方显示，值可以是top,bottom
        },
        seriesDefaults: {
            type: "Line",
            stack: true,                    // 加上stack:true,则多个柱状图会叠在一列上，否则显示为多列
            labels: {
                visible: true,              // 设置柱状图上的数字是否显示
                background: "transparent",
                position: "center"          // 设置数字显示在柱形图的中间
            }
        },
        series: [{
            name: "燃气集团",               // 图例名称
            field: "data1",                 // 字典中数据对应的字段名称
            //color: "#44CEF6"               // 设置column颜色
            color: KDChart.getColor(3)     // 设置column颜色，读取KDChart.js文件中的函数
        },
            {
                name: "申能股份",               // 图例名称
                field: "data2",                 // 字典中数据对应的字段名称
                //color: "#44CEF6"               // 设置column颜色
                color: KDChart.getColor(4)     // 设置column颜色，读取KDChart.js文件中的函数
            }
            ,
            {
                name: "申能集团",               // 图例名称
                field: "data3",                 // 字典中数据对应的字段名称
                //color: "#44CEF6"               // 设置column颜色
                color: KDChart.getColor(8)     // 设置column颜色，读取KDChart.js文件中的函数
            }
        ],
        categoryAxis: {
            field: "name",                 // 设置横轴数据读取的字段内容

            majorGridLines: {
                visible: false          // 设置是否显示网格线
            },
            line: {
                visible: false
            },
            labels: {
                padding: { top: 5 }     // 设置每列标题和柱状图底部的高度差
            }
        },

        valueAxis: {
            title: {
                text: "工单计数"
            },
            labels: {
                format: ""              // 设置纵坐标轴数据的前后缀，比如format: "{0}%"，format: "${0}"
            },
            line: {
                visible: false
            },

            axisCrossingValue: 0        // 纵坐标轴的基线设置，大于该数字的柱状图向上走，小于该数字的柱状图向下走
        },
        tooltip: {
            visible: true,              // 设置鼠标放到柱状图上是否显示信息以及信息的格式
            format: "",
            template: "#= category #, #= series.name#, #: kendo.format('{0:n0}', value) #"     // n2表示保留小数点后2位，还可以是n0,n1,...值
        }
    });
}

function doReportCall() {

    var startDateStr = $("#dateTimePicker").val();
    var endDateStr = $("#dateTimePicker2").val();
    var selectedProjectsStr = $('#Select1').val();

    var params = "{'startDateStr':'" + startDateStr;
    params += "','endDateStr':'" + endDateStr;
    params += "','selectedProjectsStr':'" + selectedProjectsStr;
    params += "'}";

    $.ajax({
        type: "POST",
        url: "Report4SN.aspx/RefreshGlobalReport6",
        data: params,
        contentType: "application/json; charset=utf-8",
        beforeSend: function (XMLHttpRequest) {
            $('#divGlobalReportHTML6').html("<h5 style='color:red;'>正在生成报表...</h5>");
        },
        success: function (msg) {
            $('#divGlobalReportHTML6').html("");
            $('#divGlobalReportHTMLLine').html("");
            if (msg.d) {
                var strCharts = msg.d.toString();
                $("#divGlobalReportHTML6").ready(createChart(strCharts));
                $("#divGlobalReportHTML6").bind("kendo:skinChange", createChart(strCharts));
                //线形图
                //$("#divGlobalReportHTMLLine").ready(createChartLine(strCharts));
                //$("#divGlobalReportHTMLLine").bind("kendo:skinChange", createChartLine(strCharts));
            }
           
           
               
              
            

        },
        error: function (xhr, msg, e) {
            alert("error");
        }
    });
}


