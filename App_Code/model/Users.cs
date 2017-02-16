using System;
using System.Collections.Generic;
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

    public static Users get(String id)
    {
        MyLog.v("userid = " + id);
        SqlDataReader reader = SqlData.getInstance().ExecuteRead("select * from users where id=" + id);
        reader.Read();
        Users user = new Users(reader);
        reader.Close();
        return user;
    }

    public Users(SqlDataReader reader)
    {
        //
        // TODO: Add constructor logic here
        //
        id = reader[0].ToString();
        name = reader[1].ToString();
        head = reader[2].ToString();
        level = reader[3].ToString();
        password = reader[4].ToString();
        regtime = reader[5].ToString();
    }
}