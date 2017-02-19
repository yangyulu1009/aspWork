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
}