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
    public String image;

    public String story;
    public String release;
    public String country;
    public String genre;
    public String keywords;
    public String star;
    public String description;

    public List<Response> responses;
    public List<News> news;
    public List<Sales> sales;

    public String image1;
    public String image2;
    public String image3;
    public String image4;

    public String video1Img;
    public String video1Url;

    public String video2Img;
    public String video2Url;

    public String video3Img;
    public String video3Url;

    public String video4Img;
    public String video4Url;

    public String toString()
    {
        return "id = " + id + ", "
             + "name = " + name + ", "
             + "year = " + year;
    }

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
        image = reader[2].ToString();
        story = reader[3].ToString();
        release = reader[4].ToString();
        country = reader[5].ToString();
        genre = reader[6].ToString();
        keywords = reader[7].ToString();
        description = reader[8].ToString();

        image1 = reader[9].ToString();
        image2 = reader[10].ToString();
        image3 = reader[11].ToString();
        image4 = reader[12].ToString();

        video1Img = reader[13].ToString();
        video1Url = reader[14].ToString();
        video2Img = reader[15].ToString();
        video2Url = reader[16].ToString();
        video3Img = reader[17].ToString();
        video3Url = reader[18].ToString();
        video4Img = reader[19].ToString();
        video4Url = reader[20].ToString();

        year = reader[21].ToString();
        star = reader[22].ToString();
    }

    public List<Response> loadResponses()
    {
        responses = new List<Response>();

        SqlDataReader reader = SqlData.getInstance().ExecuteRead("select * from Response where MovieId=" + id);
        for (int index = 0; reader.Read(); index++)
        {
            Response response = new Response(reader);
            responses.Add(response);
        }
        reader.Close();
        return responses;
    }

    public List<News> loadNews()
    {
        news = new List<News>();

        SqlDataReader reader = SqlData.getInstance().ExecuteRead("select * from News where movie=" + id);
        for (int index = 0; reader.Read(); index++)
        {
            News item = new News(reader);
            news.Add(item);
        }
        reader.Close();
        return news;
    }

    public List<Sales> loadSales()
    {
        sales = new List<Sales>();

        SqlDataReader reader = SqlData.getInstance().ExecuteRead("select * from Sales where movie=" + id);
        for (int index = 0; reader.Read(); index++)
        {
            Sales item = new Sales(reader);
            sales.Add(item);
        }
        reader.Close();
        return sales;
    }
}