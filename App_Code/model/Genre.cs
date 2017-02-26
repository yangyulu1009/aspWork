using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Genre
/// </summary>
public class Genre
{
    public String id;
    public String name;
    public String movie;

    public static List<Genre> get(String id)
    {
        List<Genre> genres = new List<Genre>();
        DataTable table = SqlData.getInstance().datasetExecute("select * from genre where movie_id=" + id, "genre");
        for (int i = 0; i < table.Rows.Count; i++)
        {
            Genre word = new Genre(table.Rows[i]);
            genres.Add(word);
        }
        return genres;
    }

    public static List<String> get2(String id)
    {
        List<String> genres = new List<String>();
        DataTable table = SqlData.getInstance().datasetExecute("select * from genre where movie_id=" + id, "genre");
        for (int i = 0; i < table.Rows.Count; i++)
        {
            Genre word = new Genre(table.Rows[i]);
            genres.Add(word.name);
        }
        return genres;
    }

    public static void removeAll(String id)
    {
        SqlData.getInstance().ExecuteSQL("delete from genre where movie_id=" + id);
    }

    public static void insert(String movieId, String name)
    {
        if (name != null && name.Length > 0)
        {
            int id = SqlData.getInstance().getMaxId("genre") + 1;
            String sql = String.Format("insert into genre (id,name,movie_id) values('{0:d}','{1:s}','{2:s}')", id, name, movieId);
            SqlData.getInstance().ExecuteSQL(sql);
        }
        
    }

    public static void addAll(String id, List<String> genres)
    {
        for (int i = 0; i < genres.Count; i++)
        {
            insert(id, genres.ElementAt(i));
        }
    }

    public static void replace(String movieId, String text)
    {
        String[] genres = text.Split(Constants.SEPS);
        replaceAll(movieId, new List<String>(genres));
    }

    public static void replaceAll(String movieId, List<String> genres)
    {
        removeAll(movieId);
        addAll(movieId, genres);
    }

    public Genre(DataRow row)
    {
        //
        // TODO: Add constructor logic here
        //
        id = row["id"].ToString();
        name = row["name"].ToString();
        movie = row["movie_id"].ToString();
    }
}