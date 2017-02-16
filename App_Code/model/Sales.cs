using System;
using System.Collections.Generic;
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

        SqlDataReader reader = SqlData.getInstance().ExecuteRead("select * from sales where movie_id=" + id);
        for (int index = 0; reader.Read(); index++)
        {
            Sales item = new Sales(reader);
            sales.Add(item);
        }
        reader.Close();
        return sales;
    }

    public Sales(SqlDataReader reader)
    {
        //
        // TODO: Add constructor logic here
        //
        id = reader[0].ToString();
        movie = reader[1].ToString();
        date = reader[2].ToString();
        sale = reader[3].ToString();
    }
}