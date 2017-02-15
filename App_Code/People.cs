﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for People
/// </summary>
public class People
{

    public String id;
    public String name;
    public String url;

    public static People get(String id)
    {
        SqlDataReader reader = SqlData.getInstance().ExecuteRead("select * from people where id=" + id);
        reader.Read();
        People people = new People(reader);
        reader.Close();
        return people;
    }

    public People(SqlDataReader reader)
    {
        //
        // TODO: Add constructor logic here
        //
        id = reader[0].ToString();
        name = reader[1].ToString();
        url = reader[2].ToString();
    }
}