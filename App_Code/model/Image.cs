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

    public String id;
    public String movie;
    public String url;

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
    }

    public static void insert(String movieId, String url)
    {
        int id = SqlData.getInstance().getMaxId("image") + 1;
        String sqlstr = String.Format("INSERT INTO image(id,movie_id,url) VALUES ('{0:d}', '{1:s}', '{2:s}')", id, movieId, url);
        SqlData.getInstance().ExecuteSQL(sqlstr);
    }

    public static void init(int movieId)
    {
        for (int i = 0; i < 5; i++)
        {
            insert(movieId.ToString(), " ");
        }
    }

    private static void update(String imageId, String url)
    {
        String sql = String.Format("update image set url='{0:s}' where id='{1:s}'", url, imageId);
        SqlData.getInstance().ExecuteSQL(sql);
    }

    public static void update(String movieId, int index, String url)
    {
        List<Image> images = get(movieId);
        update(images.ElementAt(index).id, url);
    }

    public static void removeAll(String movieId)
    {
        String sql = String.Format("delete from image where movie_id='{0:s}'", movieId);
        SqlData.getInstance().ExecuteSQL(sql);
    }
}