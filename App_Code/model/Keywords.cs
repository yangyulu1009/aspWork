using System;
using System.Collections.Generic;
using System.Data;
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
        DataTable table = SqlData.getInstance().datasetExecute("select * from keywords where movie_id=" + id, "keywords");
        for (int i = 0; i < table.Rows.Count; i++)
        {
            Keywords word = new Keywords(table.Rows[i]);
            keys.Add(word);
        }
        return keys;
    }

    public Keywords(DataRow row)
    {
        //
        // TODO: Add constructor logic here
        //
        id = row["id"].ToString();
        name = row["name"].ToString();
        movie = row["movie_id"].ToString();
    }
}