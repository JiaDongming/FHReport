using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    public class Report4SNRecord
    {
        public string FieldDate { get; set; }//每一天

        public string SiteID { get; set; }//组织编号
        public string CategoryName { get; set; }//组织
        public string ItemNo { get; set; }//工单计数
        //public List<Report4SN> details { get; set; }
    }

    public class Report4SNRecordGroup
    {
        public string FieldDate { get; set; }//时间单位
        public string FieldDateName { get; set; }//别名
        
        public List<Report4SN> details { get; set; }
    }

    /// <summary>
    /// （申能）报表实体类
    /// </summary>
    public class Report4SN
    {
        public string SiteID { get; set; }//组织编号
        public string CategoryName { get; set; }//组织
        public string ItemNo { get; set; }//工单计数

    }
    public class Report4SNTime
    {
        public string TimeID { get; set; }
        public string TimeName { get; set; }
    }

}
