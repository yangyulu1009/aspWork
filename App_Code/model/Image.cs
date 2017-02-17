using System;
using System.Collections.Generic;
using System.Data;
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

        DataTable table = SqlData.getInstance().datasetExecute("select * from image where movie_id=" + id, "image");
        
        for (int index = 0; index < table.Rows.Count; index++)
        {
            Image image = new Image(table.Rows[index]);
            images.Add(image);
        }
        return images;
    }

    public Image(DataRow row)
    {
        //
        // TODO: Add constructor logic here
        //
        id = row["id"].ToString();
        movie = row["movie_id"].ToString();
        url = row["url"].ToString();
        type = int.Parse(row["type"].ToString());
    }
}