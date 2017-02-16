using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Image
/// </summary>
public class Image
{
    /**
     * INDEX页展示的电影图
     */
    public static int TYPE_INDEX = 1;
    /**
     * Single页展示的电影大图
     */
    public static int TYPE_LARGE = 2;
    /**
     * Single页展示的电影剧照 
     */
    public static int TYPE_OPERA = 3;

    public String id;
    public String movie;
    public String url;
    public int type;

    public static List<Image> get(String id)
    {
        List<Image> images = new List<Image>();

        SqlDataReader reader = SqlData.getInstance().ExecuteRead("select * from image where movie_id=" + id);
        for (int index = 0; reader.Read(); index++)
        {
            Image image = new Image(reader);
            images.Add(image);
        }
        reader.Close();
        return images;
    }

    public Image(SqlDataReader reader)
    {
        //
        // TODO: Add constructor logic here
        //
        id = reader[0].ToString();
        movie = reader[1].ToString();
        url = reader[2].ToString();
        type = int.Parse(reader[3].ToString());
    }
}