﻿using System;
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