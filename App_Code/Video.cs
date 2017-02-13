using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Video
/// </summary>
public class Video
{
    public String id;
    public String movie;
    public String image;
    public String url;

    public Video(SqlDataReader reader)
    {
        //
        // TODO: Add constructor logic here
        //
        id = reader[0].ToString();
        movie = reader[1].ToString();
        image = reader[2].ToString();
        url = reader[3].ToString();
    }
}