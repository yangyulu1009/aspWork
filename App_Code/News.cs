﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for News
/// </summary>
public class News
{
    public String id;
    public String title;
    public String content;
    public String url;
    public String movie;
    public String time;
    

    public News(SqlDataReader reader)
    {
        //
        // TODO: Add constructor logic here
        //
        id = reader[0].ToString();
        title = reader[1].ToString();
        content = reader[2].ToString();
        url = reader[3].ToString();
        movie = reader[4].ToString();
        time = reader[5].ToString();
    }
}