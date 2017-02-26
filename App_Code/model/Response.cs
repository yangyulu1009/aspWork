using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Providers.Entities;

/// <summary>
/// Summary description for Response
/// </summary>
public class Response
{
    public String id;
    public String movie;
    public Users user;
    public String reply_time;
    public String comment;

    public static List<Response> get(String id)
    {
        List<Response> responses = new List<Response>();

        DataTable table = SqlData.getInstance().datasetExecute("select * from responses where movie_id=" + id, "responses");
        for (int index = 0; index < table.Rows.Count; index++)
        {
            Response response = new Response(table.Rows[index]);
            responses.Add(response);
        }
        return responses;
    }

    public Response(DataRow row)
    {
        //
        // TODO: Add constructor logic here
        //
        id = row["id"].ToString();
        movie = row["movie_id"].ToString();
        String userId = row["user_id"].ToString();
        user = Users.get(userId);
        reply_time = row["reply_time"].ToString();
        comment = row["comment"].ToString();
    }

    public static void removeAll(String movieId)
    {
        String sql = String.Format("delete from responses where movie_id='{0:s}'", movieId);
        SqlData.getInstance().ExecuteSQL(sql);
    }
}