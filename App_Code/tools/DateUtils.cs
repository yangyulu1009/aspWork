using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DateUtils
/// </summary>
public class DateUtils
{
    public static String[] WEEKS =
    {
        "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"
    };


    public DateUtils()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public class MyDate
    {
        public int year;
        public int month;
        public int day;

        public String toString()
        {
            return year + "/" + month + "/" + day;
        }

    }

    public class MyTime
    {
        public int hour;
        public int minute;
        public int second;
    }

    public class MyDateTime
    {
        public MyDate date;
        public MyTime time;
    }

    public static MyDate parseDate(String text)
    {
        String[] texts = text.Split(new String[] { "/", "-", ".", " " }, StringSplitOptions.RemoveEmptyEntries);
        if (texts.Length < 3)
        {
            return null;
        }
        MyDate result = new MyDate();
        result.year = int.Parse(texts[0]);
        result.month = int.Parse(texts[1]);
        result.day = int.Parse(texts[2]);
        return result;
    }

    public static MyTime parseTime(String text)
    {
        String[] texts = text.Split(new String[] { ":" }, StringSplitOptions.RemoveEmptyEntries);
        if (texts.Length != 3)
        {
            return null;
        }
        MyTime result = new MyTime();
        result.hour = int.Parse(texts[0]);
        result.minute = int.Parse(texts[1]);
        result.second = int.Parse(texts[2]);
        return result;
    }


    public static MyDateTime parse(String text)
    {
        String[] texts = text.Split(new String[] { " " }, StringSplitOptions.RemoveEmptyEntries);
        MyDateTime result = new MyDateTime();
        if (texts.Length > 0)
        {
            result.date = parseDate(texts[0]);
            
        }
        if (texts.Length > 1)
        {
            result.time = parseTime(texts[1]);
        }
        return result;
    }

    public static String getDate(String text)
    {
        return getDate(text, "-");
    }

    public static String getDate(String text, String sep)
    {
        MyDate date = parse(text).date;
        
        return StringUtils.join(new String[] { date.year.ToString(), date.month.ToString(), date.day.ToString() }, sep);
    }

    public static String getWeekDay(String date)
    {
        return getWeekDay(DateUtils.parseDate(date));
    }

    public static String getWeekDay(MyDate date)
    {
        if (date == null)
        {
            return "";
        }
        return getWeekDay(date.year, date.month, date.day);
    }

    public static String getWeekDay(int iYear, int iMonth, int iDay)
    {
        int iWeek = 0;
        int y = 0, c = 0, m = 0, d = 0;

        if (iMonth == 1 || iMonth == 2)
        {
            c = (iYear - 1) / 100;
            y = (iYear - 1) % 100;
            m = iMonth + 12;
            d = iDay;
        }
        else
        {
            c = iYear / 100;
            y = iYear % 100;
            m = iMonth;
            d = iDay;
        }

        iWeek = y + y / 4 + c / 4 - 2 * c + 26 * (m + 1) / 10 + d - 1;
        iWeek = iWeek - 1;
        iWeek = iWeek >= 0 ? (iWeek % 7) : (iWeek % 7 + 7);
        if (iWeek == 0)
        {
            iWeek = 0;
        }


        return WEEKS[iWeek];
    }
}