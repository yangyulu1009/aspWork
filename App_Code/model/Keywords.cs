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

    public static List<String> get2(String id)
    {
        List<String> keys = new List<String>();
        DataTable table = SqlData.getInstance().datasetExecute("select * from keywords where movie_id=" + id, "keywords");
        for (int i = 0; i < table.Rows.Count; i++)
        {
            Keywords word = new Keywords(table.Rows[i]);
            keys.Add(word.name);
        }
        return keys;
    }

    public static void removeAll(String id)
    {
        SqlData.getInstance().ExecuteSQL("delete from keywords where movie_id=" + id);
    }

    public static void insert(String movieId, String name)
    {
        int id = SqlData.getInstance().getMaxId("keywords") + 1;
        String sql = String.Format("insert into keywords (id,name,movie_id) values('{0:d}','{1:s}','{2:s}')", id, name, movieId);
        SqlData.getInstance().ExecuteSQL(sql);
    }

    public static void addAll(String id, List<String> words)
    {
        for (int i = 0; i < words.Count; i++)
        {
            insert(id, words.ElementAt(i));
        }
    }

    public static void replaceAll(String movieId, List<String> words)
    {
        removeAll(movieId);
        addAll(movieId, words);
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