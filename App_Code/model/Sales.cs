using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using static DateUtils;

/// <summary>
/// Summary description for Sales
/// </summary>
public class Sales : IComparable
{
    public String id;
    public String movie;
    public String date;
    public String sale;
    

    public static List<Sales> get(String id)
    {
        List<Sales> sales = new List<Sales>();

        DataTable table = SqlData.getInstance().datasetExecute("select * from sales where movie_id=" + id, "sales");
        for (int index = 0; index < table.Rows.Count; index++)
        {
            Sales item = new Sales(table.Rows[index]);
            sales.Add(item);
        }
        sales.Sort();
        return sales;
    }

    public int CompareTo(object obj)
    {
        Sales ext = (Sales) obj;
        MyDate date1 = DateUtils.parseDate(date);
        MyDate date2 = DateUtils.parseDate(ext.date);
        if (date1.year != date2.year)
        {
            return date2.year - date1.year;
        }
        if (date1.month != date2.month)
        {
            return date2.month - date1.month;
        }
        if (date1.day != date2.day)
        {
            return date2.day - date1.day;
        }
        return 0;
    }

    public Sales(DataRow row)
    {
        //
        // TODO: Add constructor logic here
        //
        id = row["id"].ToString();
        movie = row["movie_id"].ToString();
        date = row["reldate"].ToString();
        sale = row["sales"].ToString();
    }
}