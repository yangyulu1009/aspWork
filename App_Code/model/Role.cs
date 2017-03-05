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

    public static void update(String id, String name, String role)
    {
        People people = People.getByName(name);
        SqlData.getInstance().ExecuteSQL(String.Format("update role set people_id='{0:s}', role='{1:s}' where id='{2:s}'", people.id, role, id));
    }

    public static String get(String id, String roleName)
    {
        List<Role> roles = Role.get(id);
        List<String> names = new List<String>();
        foreach (Role role in roles)
        {
            if (role.role.Equals(roleName))
            {
                names.Add(role.people.name);
            }
        }
        return StringUtils.join(names, ";");
    }

    public static String getDirector(String id)
    {
        return get(id, Role.DIRECTOR);
    }

    public static String getActor(String id)
    {
        return get(id, Role.ACTOR);
    }

    public static String getWriter(String id)
    {
        return get(id, Role.WRITER);
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

    private static void removeAll(String movieId, String role)
    {
        String sql = String.Format("delete from role where movie_id='{0:s}' and role='{1:s}'", movieId, role);
        SqlData.getInstance().ExecuteSQL(sql);
    }

    private static void addAll(String movieId, String role, List<String> names)
    {
        foreach (String name in names)
        {
            if (name.Trim().Length > 0)
            {
                insert(movieId, role, name.Trim());
            }
        }
    }

    public static void replaceAll(String movieId, String role, List<String> names)
    {
        removeAll(movieId, role);
        addAll(movieId, role, names);
    }

    private static void insert(String movieId, String role, String name)
    {
        /*
        String peopleId = People.add(name);
        int id = SqlData.getInstance().getMaxId("role") + 1;
        String sql = String.Format("insert into role (id,movie_id,people_id,role) values('{0:d}','{1:s}','{2:s}','{3:s}')", id, movieId, peopleId, role);
        SqlData.getInstance().ExecuteSQL(sql);*/
    }

    public static void removeAll(String movieId)
    {
        String sql = String.Format("delete from role where movie_id='{0:s}'", movieId);
        SqlData.getInstance().ExecuteSQL(sql);
    }

    public static void removePeople(String peopleId)
    {
        String sql = String.Format("delete from role where people_id='{0:s}'", peopleId);
        SqlData.getInstance().ExecuteSQL(sql);
    }
}