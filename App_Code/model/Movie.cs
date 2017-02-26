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

    public List<Keywords> keywords;
    public List<Image> images;
    public List<Video> videos;
    public List<Responses> responses;
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

    public static void removeAll(String id)
    {
        Image.removeAll(id);
        Video.removeAll(id);
        Responses.removeAll(id);
        Keywords.removeAll(id);
        News.removeAll(id);
        Sales.removeAll(id);
        Role.removeAll(id);
    }

    public static void updateDesc(String movieId, String desc)
    {
        String sql = String.Format("update movie set description='{0:s}' where id='{1:s}'", desc, movieId);
        SqlData.getInstance().ExecuteSQL(sql);
    }

    public static void updateIcon(String movieId, String icon)
    {
        String sql = String.Format("update movie set icon='{0:s}' where id='{1:s}'", icon, movieId);
        SqlData.getInstance().ExecuteSQL(sql);
    }

    public static void updateBanner(String movieId, String banner)
    {
        String sql = String.Format("update movie set banner='{0:s}' where id='{1:s}'", banner, movieId);
        SqlData.getInstance().ExecuteSQL(sql);
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
        country = row["country"].ToString();
    }

    public String getImage(int index)
    {
        List<Image> images = Image.get(id);
        return images.ElementAt(index).url;
    }

    public String getIndexImage()
    {
        return getImage(0);
    }

    public Video getVideo(int index)
    {
        List<Video> videos = Video.get(id);
        return videos.ElementAt(index);
    }

    public String getBannerImageUrl()
    {
        return getVideo(0).image;
    }

    public String getBannerVideoUrl()
    {
        return getVideo(0).url;
    }

    public void loadExtraData()
    {
        keywords = Keywords.get(id);
        news = News.get(id);
        roles = Role.get(id);
        sales = Sales.get(id);
        videos = Video.get(id);
        responses = Responses.get(id);
    }

    private List<Image> getImages()
    {
        return Image.get(id);
    }

    public String getOperaImage(int index)
    {
        return getImages().ElementAt(index + 1).url;
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

    public static void insert()
    {
        int id = SqlData.getInstance().getMaxId("movie") + 1;
        String sqlstr = String.Format("INSERT INTO movie(id) VALUES ('{0:d}')", id);
        SqlData.getInstance().ExecuteSQL(sqlstr);
        Image.init(id);
        Video.init(id);
    }

    public override bool Equals(object obj)
    {
        Movie that = (Movie) obj;
        return id.Equals(that.id);
    }

}