using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Constants
/// </summary>
public class Constants
{
    //public static String DB_CONN_STR = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=c:\\aspWork\\App_Data\\movie.mdf;Integrated Security=True";
    public static String DB_CONN_STR = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["movie"].ConnectionString;
}