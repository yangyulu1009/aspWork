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

    public void update(String image, String url)
    {
        String str = String.Format("update video set image_url='{0:s}', video_url='{1:s}' where id={2:s}", image, url, id);
        SqlData.getInstance().ExecuteSQL(str);
    }

    public static void removeAll(String movieId)
    {
        String sql = String.Format("delete from video where movie_id='{0:s}'", movieId);
        SqlData.getInstance().ExecuteSQL(sql);
    }

    
    public static void insert(String movieId, String imageUrl, String videoUrl)
    {
        int id = SqlData.getInstance().getMaxId("video") + 1;
        String sqlstr = String.Format("INSERT INTO video(id,movie_id,image_url,video_url) VALUES ('{0:d}', '{1:s}', '{2:s}', '{3:s}')", id, movieId, imageUrl, videoUrl);
        SqlData.getInstance().ExecuteSQL(sqlstr);
    }

    public static void init(int movieId)
    {
        for (int i = 0; i < 5; i++)
        {
            insert(movieId.ToString(), "", "");
        }
    }
}