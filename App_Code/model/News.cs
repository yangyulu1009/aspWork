using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for News
/// </summary>
public class News
{
    public String id;
    public String title;
    public String content;
    public String url;
    public String movie;
    public String release_time;

    public static List<News> get(String id)
    {
        List<News> news = new List<News>();

        DataTable table = SqlData.getInstance().datasetExecute("select * from news where movie_id=" + id, "news");
        for (int index = 0; index < table.Rows.Count; index++)
        {
            News item = new News(table.Rows[index]);
            news.Add(item);
        }
        return news;
    }

    public News(DataRow row)
    {
        //
        // TODO: Add constructor logic here
        //
        id = row["id"].ToString();
        title = row["title"].ToString();
        content = row["content"].ToString();
        url = row["url"].ToString();
        movie = row["movie_id"].ToString();
        release_time = row["release_date"].ToString();
    }
}