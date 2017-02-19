using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Role
/// </summary>
public class Role
{

    public static String ACTOR = "actor";
    public static String DIRECTOR = "director";
    public static String WRITER = "writer";

    public String id;
    public String movie;
    public String role;

    public People people;

    public static List<Role> get(String id)
    {
        List<Role> roles = new List<Role>();

        DataTable table = SqlData.getInstance().datasetExecute("select * from role where movie_id=" + id, "role");
        for (int index = 0; index < table.Rows.Count; index++)
        {
            Role item = new Role(table.Rows[index]);
            roles.Add(item);
        }
        return roles;
    }

    public Role(DataRow row)
    {
        //
        // TODO: Add constructor logic here
        //
        id = row["id"].ToString();
        movie = row["movie_id"].ToString();
        String peopleId = row["people_id"].ToString();
        people = People.get(peopleId);
        role = row["role"].ToString();
    }
}