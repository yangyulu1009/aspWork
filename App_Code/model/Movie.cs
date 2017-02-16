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
    public String star;

    public String allSales;
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
        star = reader[3].ToString();
        allSales = reader[4].ToString();
        description = reader[5].ToString();
        genre = reader[6].ToString();
    }

    public String getIndexImage()
    {
        for (int i = 0; i < images.Count(); i++)
        {
            Image image = images.ElementAt(i);
            if (image.type == Image.TYPE_INDEX)
            {
                return image.url;
            }
        }
        return "";
    }
}