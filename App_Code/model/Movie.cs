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

    public String country;
    public String allSales;
    public String description;
    public String genre;

    public String video;
    public String icon;
    public String banner;

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

    public static List<Movie> get()
    {
        DataTable table = SqlData.getInstance().datasetExecute("select * from movie", "movie");
        List<Movie> movies = new List<Movie>();
        for (int i = 0; i < table.Rows.Count; i++)
        {
            DataRow row = table.Rows[i];
            movies.Add(new Movie(row));
        }
        return movies;
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
        country = row["country"].ToString();
        video = row["video"].ToString();
        icon = row["icon"].ToString();
        banner = row["banner"].ToString();
    }

    public String getIndexImage()
    {
        return icon;
    }

    public void loadExtraData()
    {
        images = Image.get(id);
        keywords = Keywords.get(id);
        news = News.get(id);
        roles = Role.get(id);
        sales = Sales.get(id);
        videos = Video.get(id);
        responses = Response.get(id);
    }

    public String getOperaImage(int index)
    {
        return images.ElementAt(index).url;
    }

    public String getVideoImage(int index)
    {
        return videos.ElementAt(index).image;
    }

    public String getVideoUrl(int index)
    {
        return videos.ElementAt(index).url;
    }

    public String getDirector()
    {
        return getRoles(Role.DIRECTOR);
    }

    public String getActor()
    {
        return getRoles(Role.ACTOR);
    }

    public String getWriter()
    {
        return getRoles(Role.WRITER);
    }

    public String getRoles(String roleType)
    {
        List<String> strs = new List<String>();
        foreach (Role role in roles)
        {
            if (role.role.Equals(roleType))
            {
                strs.Add(role.people.name);
            }
        }
        return StringUtils.join(strs);
    }

    public String getKeywords()
    {
        List<String> keys = new List<String>();
        foreach (Keywords word in keywords)
        {
            keys.Add(word.name);
        }
        return StringUtils.join(keys);
    }

   

}