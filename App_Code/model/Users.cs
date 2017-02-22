using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for User
/// </summary>
public class Users
{

    public String id;
    public String name;
    public String head;
    public String level;
    public String password;
    public String regtime;
    public String email;

    public static Users get(String id)
    {
        DataTable table = SqlData.getInstance().datasetExecute("select * from users where id=" + id, "users");
        Users user = new Users(table.Rows[0]);
        return user;
    }

    public Users(DataRow row)
    {
        //
        // TODO: Add constructor logic here
        //
        id = row["id"].ToString();
        name = row["name"].ToString();
        head = row["head"].ToString();
        level = row["level"].ToString();
        password = row["password"].ToString();
        regtime = row["regtime"].ToString();
        email = row["email"].ToString();
    }
}