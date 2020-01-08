﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Report5.aspx.cs" Inherits="CustomReports.Report5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
     <meta http-equiv="content-type" content="text/html;chartset=UTF-8" /> 
        <link rel="stylesheet" href="CSS/ui-lightness/jquery-ui-1.10.3.custom.min.css" type="text/css" />
        <link rel="stylesheet" href="CSS/jquery.multiselect.css" type="text/css" />
        <style type="text/css">
        #projectReport_5
        {
            /*border:1px solid green;*/
            overflow: auto;
        }
        .DivGlobalReportItem5
        {
            width: 100%;
            height: 100%;
            text-align: center;
            border: 1px solid green;
        }
        .globalReportItemHeader5
        {
            background: url("Images/rightBg.gif") repeat-x 0 0;
            height: 30px;
            vertical-align: middle;
            text-align: left;
            font-weight: bold;
            font-size: 14px;
            position: relative;
        }
        .globalHeaderLeft5
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
        .globalHeaderMiddle5
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
    <script src="JS/jquery.multiselect.js" type="text/javascript"></script>
    <script src="JS/Report5.js" type="text/javascript"></script>
    <script src="JS/jquery.ui.datepicker-zh-CN.js" type="text/javascript"></script>
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
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HiddenField ID="hidprojectIDs" runat="server" />
        </div>
        <div id="projectReport_5">
            <table style="width:100%;height:100%; border-collapse:separate; border-spacing:10px;">
                <tr>
                    <td style="width:100%; vertical-align:middle">
                        <div class="DivGlobalReportItem5">
                            <div class="globalReportItemHeader5">
                                <div class="globalHeaderLeft5">设置</div>
                                <div class="globalHeaderMiddle5">&nbsp;</div>
                            </div>
                            <div>
                                <table style="height:35px";>
                                    <tr>
                                        <td style="font-size:15px;">DevTrack项目：</td>  
                                        <td>
                                            <div style="top:8px;right:160px;width:230px; float:left;">
                                                <select id="Select1" name="selLift" multiple="multiple" style="width:225px;">
                                                    <%=selProjectOptions5%>
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
                        <div class="DivGlobalReportItem5">
                            <div class="globalReportItemHeader5">
                                <div class="globalHeaderLeft5">测试报表5</div>
                                <div class="globalHeaderMiddle5">&nbsp;</div>
                                <div style="padding-left:210px; padding-top:10px;">
                                    <asp:ImageButton  ImageAlign="Left" ImageUrl="Images/toExcel.gif" ID="btnExport" OnClick="exportReportToExcel" runat="server" ToolTip="导出Excel"  />
                                </div>
                            </div>
                            <div id="divGlobalReportHTML5"><%=htmlGlobalReportTable5%></div>
                        </div>
                    </td>               
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
