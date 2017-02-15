using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Movie
/// </summary>
public class Movie
{

    public String id;
    public String name;
    public String year;
    public String language;
    public String country;
    public String star;
    public String allSales;
    public String story;
    public String description;
    public String genre;
    public String image;

    public List<String> keywords;
    public List<Image> images;
    public List<Video> videos;
    public List<Response> responses;
    public List<News> news;
    public List<Sales> sales;

   
   

    public static Movie get(String id)
    {
        SqlDataReader reader = SqlData.getInstance().ExecuteRead("select * from movie where id=" + id);
        reader.Read();
        Movie movie = new Movie(reader);
        reader.Close();
        return movie;
    }

    public Movie(SqlDataReader reader)
    {
        //
        // TODO: Add constructor logic here
        //
        id = reader[0].ToString();
        name = reader[1].ToString();
        year = reader[2].ToString();
        language = reader[3].ToString();
        country = reader[4].ToString();
        star = reader[5].ToString();
        allSales = reader[6].ToString();
        story = reader[7].ToString();
        description = reader[8].ToString();
        genre = reader[9].ToString();

        keywords = new List<String>();
        keywords.Add(reader[10].ToString());
        keywords.Add(reader[11].ToString());
        keywords.Add(reader[12].ToString());
        keywords.Add(reader[13].ToString());
        keywords.Add(reader[14].ToString());
    }

    public void loadImages()
    {
        images = new List<Image>();

        SqlDataReader reader = SqlData.getInstance().ExecuteRead("select * from image where movie_id=" + id);
        for (int index = 0; reader.Read(); index++)
        {
            Image image = new Image(reader);
            images.Add(image);
        }
        reader.Close();
    }

    public void loadVideos()
    {
        videos = new List<Video>();

        SqlDataReader reader = SqlData.getInstance().ExecuteRead("select * from video where movie_id=" + id);
        for (int index = 0; reader.Read(); index++)
        {
            Video video = new Video(reader);
            videos.Add(video);
        }
        reader.Close();
    }

    public void loadResponses()
    {
        responses = new List<Response>();

        SqlDataReader reader = SqlData.getInstance().ExecuteRead("select * from responses where movie_id=" + id);
        for (int index = 0; reader.Read(); index++)
        {
            Response response = new Response(reader);
            responses.Add(response);
        }
        reader.Close();
    }

    public void loadNews()
    {
        news = new List<News>();

        SqlDataReader reader = SqlData.getInstance().ExecuteRead("select * from news where movie_id=" + id);
        for (int index = 0; reader.Read(); index++)
        {
            News item = new News(reader);
            news.Add(item);
        }
        reader.Close();
    }

    public void loadSales()
    {
        sales = new List<Sales>();

        SqlDataReader reader = SqlData.getInstance().ExecuteRead("select * from sales where movie_id=" + id);
        for (int index = 0; reader.Read(); index++)
        {
            Sales item = new Sales(reader);
            sales.Add(item);
        }
        reader.Close();
    }

    public String toString()
    {
        return "id = " + id + ", "
             + "name = " + name + ", ";
    }
}