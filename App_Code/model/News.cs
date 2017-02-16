using System;
using System.Collections.Generic;
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
    public String time;

    public List<News> get(String id)
    {
        List<News> news = new List<News>();

        SqlDataReader reader = SqlData.getInstance().ExecuteRead("select * from news where movie_id=" + id);
        for (int index = 0; reader.Read(); index++)
        {
            News item = new News(reader);
            news.Add(item);
        }
        reader.Close();
        return news;
    }

    public News(SqlDataReader reader)
    {
        //
        // TODO: Add constructor logic here
        //
        id = reader[0].ToString();
        title = reader[1].ToString();
        content = reader[2].ToString();
        url = reader[3].ToString();
        movie = reader[4].ToString();
        time = reader[5].ToString();
    }
}