using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Constants
/// </summary>
public class Constants
{
    public static String DB_CONN_STR = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["movie"].ConnectionString;

    public static String SESSION_USERNAME = "userName";
    public static String SESSION_USERID = "userId";

    public static String MOVIE = "movie";
}