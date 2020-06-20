using System;
using BLL;
using System.Web.Services;


namespace CustomReports
{
    public partial class Report23 : System.Web.UI.Page
    {
        private static int MyReportID = 123;
        public string htmlGlobalReportTable123;
        ReportManager objReportManager = new ReportManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            //getChartReport(objReportManager.GetReport23());
        }

     [WebMethod]
     public static string GetTopTitle()
        {
            return "大屏报表";
        }

       
    }

  
}