using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Image
/// </summary>
public class Image
{
    public String id;
    public String movie;
    public String url;


    public Image(SqlDataReader reader)
    {
        //
        // TODO: Add constructor logic here
        //
        id = reader[0].ToString();
        movie = reader[1].ToString();
        url = reader[2].ToString();
    }
}