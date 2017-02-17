using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Video
/// </summary>
public class Video
{
    public String id;
    public String movie;
    public String image;
    public String url;

    public static List<Video> get(String id)
    {
        List<Video> videos = new List<Video>();

        DataTable table = SqlData.getInstance().datasetExecute("select * from video where movie_id=" + id, "video");
        for (int index = 0; index < table.Rows.Count; index++)
        {
            Video video = new Video(table.Rows[index]);
            videos.Add(video);
        }
        return videos;
    }

    public Video(DataRow row)
    {
        //
        // TODO: Add constructor logic here
        //
        id = row["id"].ToString();
        movie = row["movie_id"].ToString();
        image = row["image_url"].ToString();
        url = row["video_url"].ToString();
    }
}