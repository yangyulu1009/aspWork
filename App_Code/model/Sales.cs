using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Sales
/// </summary>
public class Sales
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
        return sales;
    }

    public Sales(DataRow row)
    {
        //
        // TODO: Add constructor logic here
        //
        id = row["id"].ToString();
        movie = row["movie_id"].ToString();
        date = row["date"].ToString();
        sale = row["sales"].ToString();
    }
}