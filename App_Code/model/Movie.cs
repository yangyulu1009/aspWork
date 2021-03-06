﻿using System;
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

    public String keywords;

    public static Movie get(String id)
    {
        DataTable table = SqlData.getInstance().datasetExecute("select * from movie where id=" + id, "movie");
        DataRow row = table.Rows[0];
        return new Movie(row);
    }

    public static List<Movie> search(String query)
    {
        List<Movie> movies = new List<Movie>();
        String sqlstr = String.Format("select * from movie where name like '%{0:s}%' or description like '%{1:s}%' or keywords like '%{2:s}%'", query, query, query);
        DataTable table = SqlData.getInstance().datasetExecute(sqlstr, "movie");

        for (int index = 0; index < table.Rows.Count; index++)
        {
            Movie movie = new Movie(table.Rows[index]);
            movies.Add(movie);
        }

        sqlstr = "select * from movie where id in (select movie_id from role where people_id in (select id from people where name like '%" + query + "%'))";

        table = SqlData.getInstance().datasetExecute(sqlstr, "movie");

        for (int index = 0; index < table.Rows.Count; index++)
        {
            Movie movie = new Movie(table.Rows[index]);
            if (!movies.Contains(movie))
            {
                movies.Add(movie);
            }
        }

        return movies;
    }

    public static List<Movie> getMovieByGenre(String genre)
    {
        List<Movie> movies = get();

        if (genre == null || genre.Length == 0)
        {
            return movies;
        }

        List<Movie> result = new List<Movie>();

        foreach (Movie movie in movies)
        {
            if (movie.genre.Contains(genre))
            {
                result.Add(movie);
            }
        }
        return result;
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
   
        News.removeAll(id);
        Sales.removeAll(id);
        Role.removeAll(id);
    }

    public static void updateDesc(String movieId, String desc)
    {
        String sql = String.Format("update movie set description='{0:s}' where id='{1:s}'", desc.Replace("'", "''"), movieId);
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
        genre = row["genre"].ToString();
        keywords = row["keywords"].ToString();
    }

    public List<String> getMovieGenres()
    {
        String[] texts = genre.Split(Constants.SEPS);
        return new List<String>(texts);
    }

    public static List<String> getAllGenres()
    {
        List<String> genres = new List<String>();
        DataTable table = SqlData.getInstance().datasetExecute("select genre from movie", "movie");
        for (int i = 0; i < table.Rows.Count; i++)
        {
            String genre = table.Rows[i]["genre"].ToString();
            String[] texts = genre.Split(Constants.SEPS);
            foreach (String text in texts)
            {
                if (!genres.Contains(text))
                {
                    genres.Add(text);
                }
            }
        }
        return genres;
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

    private List<Image> getImages()
    {
        return Image.get(id);
    }

    public String getOperaImage(int index)
    {
        return String.Format("{0:s}?f={1:s}", getImages().ElementAt(index + 1).url, DateTime.Now.Ticks.ToString());
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