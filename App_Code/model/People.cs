﻿using System;
using System.Collections.Generic;
using System.Data;
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
        DataTable table = SqlData.getInstance().datasetExecute("select * from people where id=" + id, "people");
        People people = new People(table.Rows[0]);
        return people;
    }

    public People(DataRow row)
    {
        //
        // TODO: Add constructor logic here
        //
        id = row["id"].ToString();
        name = row["name"].ToString();
        url = row["url"].ToString();
    }

    private static People getByName(String name)
    {
        String sql = String.Format("select * from people where name='{0:s}'", name);
        DataTable table = SqlData.getInstance().datasetExecute(sql, "people");
        return table.Rows.Count > 0 ? new People(table.Rows[0]) : null;
    }

    public static String add(String name, String url)
    {
        int id = SqlData.getInstance().getMaxId("people") + 1;
        String sql = String.Format("insert into people (id,name,url) values('{0:d}','{1:s}','{2:s}')", id, name, url);
        SqlData.getInstance().ExecuteSQL(sql);
        return id.ToString();
    }

    public static String add(String name)
    {
        People people = getByName(name);
        if (people != null)
        {
            return people.id;
        } else
        {
            return add(name, " ");
        }
    }
}