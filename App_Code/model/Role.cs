using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Role
/// </summary>
public class Role
{

    public String id;
    public String movie;
    public String people;
    public String role;

    public static List<Role> get(String id)
    {
        List<Role> roles = new List<Role>();

        SqlDataReader reader = SqlData.getInstance().ExecuteRead("select * from role where movie_id=" + id);
        for (int index = 0; reader.Read(); index++)
        {
            Role item = new Role(reader);
            roles.Add(item);
        }
        reader.Close();
        return roles;
    }

    public Role(SqlDataReader reader)
    {
        //
        // TODO: Add constructor logic here
        //
        id = reader[0].ToString();
        movie = reader[1].ToString();
        people = reader[2].ToString();
        role = reader[3].ToString();
    }
}