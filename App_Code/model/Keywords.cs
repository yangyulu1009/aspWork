using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Keywords
/// </summary>
public class Keywords
{
    public String id;
    public String name;
    public String movie;

    public static List<Keywords> get(String id)
    {
        List<Keywords> keys = new List<Keywords>();
        SqlDataReader reader = SqlData.getInstance().ExecuteRead("select * from keywords where movie_id=" + id);
        for (int i = 0; reader.Read(); i++)
        {
            Keywords word = new Keywords(reader);
            keys.Add(word);
        }
        reader.Close();
        return keys;
    }

    public Keywords(SqlDataReader reader)
    {
        //
        // TODO: Add constructor logic here
        //
        id = reader[0].ToString();
        name = reader[1].ToString();
        movie = reader[2].ToString();
    }
}