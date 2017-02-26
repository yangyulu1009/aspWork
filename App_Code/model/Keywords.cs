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
        List<Keywords> items = get(id);
        List<String> keys = new List<String>();
        
        for (int i = 0; i < keys.Count; i++)
        {
            keys.Add(items.ElementAt(i).name);
        }
        return keys;
    }

    public static void removeAll(String id)
    {
        SqlData.getInstance().ExecuteSQL("delete from keywords where movie_id=" + id);
    }

    public static void insert(String movieId, String name)
    {
        name = name.Trim();
        if (name.Length > 0)
        {
            int id = SqlData.getInstance().getMaxId("keywords") + 1;
            String sql = String.Format("insert into keywords (id,name,movie_id) values('{0:d}','{1:s}','{2:s}')", id, name, movieId);
            SqlData.getInstance().ExecuteSQL(sql);
        }
        
    }

    public static void addAll(String id, List<String> words)
    {
        for (int i = 0; i < words.Count; i++)
        {
            insert(id, words.ElementAt(i));
        }
    }

    public static void replace(String movieId, String keys)
    {
        String[] keywords = keys.Split(Constants.SEPS);
        replaceAll(movieId, new List<String>(keywords));
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