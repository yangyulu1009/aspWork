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
    public String date;
    public String movie;
    public String sale;
    public String allsale;
  

    public Sales(SqlDataReader reader)
    {
        //
        // TODO: Add constructor logic here
        //
        id = reader[0].ToString();
        date = reader[1].ToString();
        movie = reader[2].ToString();
        sale = reader[3].ToString();
        allsale = reader[4].ToString();
    }
}