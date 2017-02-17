using System;
using System.Collections.Generic;
using System.Data;
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

    public List<Keywords> keywords;
    public List<Image> images;
    public List<Video> videos;
    public List<Response> responses;
    public List<News> news;
    public List<Sales> sales;
    public List<Role> roles;

    public static Movie get(String id)
    {
        DataTable table = SqlData.getInstance().datasetExecute("select * from movie where id=" + id, "movie");
        DataRow row = table.Rows[0];
        return new Movie(row);
    }

    public Movie(DataRow row)
    {
        //
        // TODO: Add constructor logic here
        //
        id = row["id"].ToString();
        name = row["name"].ToString();
        year = row["year"].ToString();
        star = row["star"].ToString();
        allSales = row["allSales"].ToString();
        description = row["description"].ToString();
        genre = row["genre"].ToString();

        Image.get(id);
    }

    public void loadExtraData()
    {
        images = Image.get(id);
        keywords = Keywords.get(id);
        news = News.get(id);
        roles = Role.get(id);
        sales = Sales.get(id);
        videos = Video.get(id);
    }

    public String getIndexImage()
    {
        foreach (Image image in images) {
            if (image.type == Image.TYPE_INDEX)
            {
                return image.url;
            }
        }
        return null;
    }

    public String getSingleImage()
    {
        foreach (Image image in images)
        {
            if (image.type == Image.TYPE_LARGE)
            {
                return image.url;
            }
        }
        return null;
    }
}