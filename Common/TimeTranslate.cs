using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common
{
 public static class TimeTranslate
    {

        public static DateTime GetWeekFirstDayMon(DateTime datetime)
        {
            //星期一为第一天
            int weeknow = Convert.ToInt32(datetime.DayOfWeek);

            //因为是以星期一为第一天，所以要判断weeknow等于0时，要向前推6天。
            weeknow = (weeknow == 0 ? (7 - 1) : (weeknow - 1));
            int daydiff = (-1) * weeknow;

            //本周第一天
            string FirstDay = datetime.AddDays(daydiff).ToString("yyyy-MM-dd");
            return Convert.ToDateTime(FirstDay);
        }

        public static DateTime GetWeekLastDaySun(DateTime datetime)
        {
            //星期天为最后一天
            int weeknow = Convert.ToInt32(datetime.DayOfWeek);
            weeknow = (weeknow == 0 ? 7 : weeknow);
            int daydiff = (7 - weeknow);

            //本周最后一天
            string LastDay = datetime.AddDays(daydiff).ToString("yyyy-MM-dd");
            return Convert.ToDateTime(LastDay);
        }

        /// <summary>
        /// 获取指定日期所在当月第几周
        /// </summary>
        /// <param name="day"></param>
        /// <param name="WeekStart"></param>
        /// <returns></returns>
        public static int WeekOfMonth(DateTime day, int WeekStart)
        {
            //WeekStart
            //1表示 周一至周日 为一周
            //2表示 周日至周六 为一周
            DateTime FirstofMonth;
            FirstofMonth = Convert.ToDateTime(day.Date.Year + "-" + day.Date.Month + "-" + 1);

            int i = (int)FirstofMonth.Date.DayOfWeek;
            if (i == 0)
            {
                i = 7;
            }

            if (WeekStart == 1)
            {
                return (day.Date.Day + i - 2) / 7 + 1;
            }
            if (WeekStart == 2)
            {
                return (day.Date.Day + i - 1) / 7;

            }
            return 0;
            //错误返回值0
        }

        /// <summary>
        /// 获取指定月份最后一天
        /// </summary>
        /// <param name="dateTime"></param>
        /// <returns></returns>
        public static DateTime GetDateTimeMonthLastDay(DateTime dateTime)
        {
            int day = DateTime.DaysInMonth(dateTime.Year, dateTime.Month);

            return new DateTime(dateTime.Year, dateTime.Month, day);
        }

        /// <summary>
        /// 获取季度的最后一天
        /// </summary>
        /// <param name="dt"></param>
        /// <returns></returns>
        public static DateTime GetDateTimeQuarterLastDay(DateTime dt)
        {
            DateTime startQuarter = dt.AddMonths(0 - (dt.Month - 1) % 3).AddDays(1 - dt.Day);  //本季度初

            DateTime endQuarter = startQuarter.AddMonths(3).AddDays(-1);  //本季度末
            
            return endQuarter;
        }

        /// <summary>
        /// 获取指定日期时间是当前年度的第几个季度
        /// </summary>
        /// <param name="dt"></param>
        /// <returns></returns>
        public static int GetQuarterNum(DateTime dt)
        {
            int year = dt.Year;
            int jd;
            DateTime dt0 = new DateTime(year, 1, 1);
            DateTime dt1 = new DateTime(year, 4, 1);
            DateTime dt2 = new DateTime(year, 7, 1);
            DateTime dt3 = new DateTime(year, 10, 1);
            if (dt.CompareTo(dt1) < 0)
                jd = 1;
            else if (dt.CompareTo(dt2) < 0)
                jd = 2;
            else if (dt.CompareTo(dt3) < 0)
                jd = 3;
            else
                jd = 4;
            return jd;
        }

        public static DateTime GetDateTimeYearLastDay(DateTime dt)
        {
            var year = dt.Year;
            int totalDays = 365;
            if (DateTime.IsLeapYear(year))
            {
                totalDays = 366;//判断结果为闰年，有366天
            }
            var currentDay = dt.DayOfYear;
            var leftDays = totalDays - currentDay;

            return dt.AddDays(leftDays);
        }

    }
}
