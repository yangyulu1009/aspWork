using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for User
/// </summary>
public class User
{

    public String id;
    public String name;
    public String head;
    public String level;
    public String password;
    public String register_time;


    public User(SqlDataReader reader)
    {
        //
        // TODO: Add constructor logic here
        //
        id = reader[0].ToString();
        name = reader[1].ToString();
        head = reader[2].ToString();
        level = reader[3].ToString();
        password = reader[4].ToString();
        register_time = reader[5].ToString();
    }
}