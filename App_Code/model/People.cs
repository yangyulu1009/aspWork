using System;
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
}