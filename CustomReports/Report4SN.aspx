﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Report4SN.aspx.cs" Inherits="CustomReports.Report4SN" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
     <meta http-equiv="content-type" content="text/html;chartset=UTF-8" /> 
        <link rel="stylesheet" href="CSS/ui-lightness/jquery-ui-1.10.3.custom.min.css" type="text/css" />
        <style type="text/css">
        #group {
               overflow: auto;
            }
        #projectReport_6
        {
            /*border:1px solid green;*/
            overflow: auto;
        }
        #split {
          border-bottom:  dashed #ccc
        }
        .DivGlobalReportItem6
        {
            width: 100%;
            height: 100%;
            text-align: center;
            border: 1px solid green;
        }
        .globalReportItemHeader6
        {
            background: url("Images/rightBg.gif") repeat-x 0 0;
            height: 30px;
            vertical-align: middle;
            text-align: left;
            font-weight: bold;
            font-size: 14px;
            position: relative;
        }
        .globalHeaderLeft6
        {
            background: url("Images/leftBg.gif") no-repeat 0 0;
            padding: 6px 0 6px 6px;
            color: White;
            position: absolute;
            top: 0;
            left: 0;
            width: 180px;
            height: 17px;
        }
        .globalHeaderMiddle6
        {
            background: url("Images/middleBg.gif") no-repeat 0 0;
            position: absolute;
            top: 0;
            left: 166px;
            width: 40px;
            height: 30px;
        }
        .report_table
        {
            border-collapse: collapse;
            background-color: #ffffff;
            border: 1px solid #2471A2;
            width: 100%;
        }
        
        .report_table td, .report_table th
        {
            border: 1px solid #C0C0C0;
            white-space: nowrap;
            text-align: center;
            height: 20px;
        }
        .report_table th
        {
            font-size: 12px;
            background-color: #dee3e7; /*background-color:#1ca2d5;*/
            font-weight: bold;
        }        
        .report_table td
        {
            font-size: 12px;
        }
        
        .select
        {
        border:solid 1px #000;  
        border-color:Green;
        width:60px;
	    appearance:none;
        -moz-appearance:none;
        -webkit-appearance:none;
        padding-right: 14px;
        background: url("Images/arrow.png") no-repeat scroll right center transparent;
        }  
	    select::-ms-expand { display: none; }  
	    
	    .ui-datepicker { font-size: 11px; }
        .ui-datepicker select.ui-datepicker-year, .ui-datepicker select.ui-datepicker-month { width: auto; }
        .ui-datepicker-trigger {margin-top:2px;}
	    #dateTimePicker
        {
            border-width:0;
            border-style:none;
            width:100px;
            margin-left:2px;
        }  
        #dateTimePicker2
        {
            border-width:0;
            border-style:none;
            width:100px;
            margin-left:2px;
        }          
    </style>
    <script src="JS/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="JS/jquery-ui-1.10.3.custom.min.js" type="text/javascript"></script>
    <script src="JS/KDChart.js" type="text/javascript"></script>
    <script src="JS/Report4SN.js" type="text/javascript"></script>
    <script src="JS/jquery.ui.datepicker-zh-CN.js" type="text/javascript"></script>
    <script src="ReportResource/telerik.kendoui/js/kendo.all.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            try {
                if (parent.leftFrame.isLoading)
                    parent.leftFrame.isLoading = false;
            }
            catch (e)
            { }
            resetDatePicker();
            resetDatePicker2();
        });

        function resetDatePicker() {
            $("#dateTimePicker").prop("readonly", true).datepicker({
                showOn: "button",
                buttonImage: "CSS/calendar.gif",
                buttonImageOnly: true,
                changeMonth: true,
                changeYear: true,
                yearRange: "2017:2050"// yearRange: "-5:+5"
            });
        };

        function resetDatePicker2() {
            $("#dateTimePicker2").prop("readonly", true).datepicker({
                showOn: "button",
                buttonImage: "CSS/calendar.gif",
                buttonImageOnly: true,
                changeMonth: true,
                changeYear: true,
                yearRange: "2017:2050"// yearRange: "-5:+5"
            });
        }
    </script>
   <script>//解决导出pdf乱码问题
    kendo.pdf.defineFont({
        "DejaVu Sans": "ReportResource/telerik.kendoui/fonts/msyh.ttf"
    });
</script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HiddenField ID="hidprojectIDs" runat="server" />
        </div>
        <div id="projectReport_6">
            <table style="width:100%;height:100%; border-collapse:separate; border-spacing:10px;">
                <tr>
                    <td style="width:100%; vertical-align:middle">
                        <div class="DivGlobalReportItem6">
                            <div class="globalReportItemHeader6">
                                <div class="globalHeaderLeft6">设置</div>
                                <div class="globalHeaderMiddle6">&nbsp;</div>
                            </div>
                            <div>
                                <table style="height:35px";>
                                    <tr>
                                        <td style="font-size:15px;">时间单位：</td>  
                                        <td>
                                            <div style="top:8px;right:160px;width:230px; float:left;">
                                                <select id="Select1" name="selLift" style="width:225px;">
                                                    <%=selProjectOptions6%>
                                                </select>
                                            </div>
                                        </td>
                                        <td style="padding-left:20px;">从：</td>                                                                           
                                        <td>
                                            <div style="border:1px solid green;width:122px;">
                                                <input type="text" id="dateTimePicker" runat="server" />
                                            </div>
                                        </td>
                                        <td style="padding-left:20px;">到：</td>  
                                        <td>
                                            <div style="border:1px solid green;width:122px;">
                                                <input type="text" id="dateTimePicker2" runat="server" />                                            
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td style="width:100%; vertical-align:middle">
                        <div class="DivGlobalReportItem6">
                            <div class="globalReportItemHeader6">
                                <div class="globalHeaderLeft6">时间趋势</div>
                                <div class="globalHeaderMiddle6">&nbsp;</div>
                                <div style="padding-left:210px; padding-top:10px;">
                                    <%--<asp:ImageButton  ImageAlign="Left" ImageUrl="Images/toExcel.gif" ID="btnSaveAsImage" runat="server"  ToolTip="导出"  />--%>
                                    <img id="btnSaveAsImage" src="Images/PDF.png"  alt="导出pdf" />
                                </div>
                            </div>
                            <div id="group">
                                <div id="divGlobalReportHTML6"><%=htmlGlobalReportTable6%></div>
                                <div id="split"></div>
                                <div id="divGlobalReportHTMLLine"><%=htmlGlobalReportTableLine%></div>
                            </div>
                           
                        </div>
                    </td>               
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

