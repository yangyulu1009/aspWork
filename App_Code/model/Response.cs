using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Response
/// </summary>
public class Response
{
    public String id;
    public String movie;
    public String user;
    public String date;
    public String comment;

    public static List<Response> get(String id)
    {
        List<Response> responses = new List<Response>();

        SqlDataReader reader = SqlData.getInstance().ExecuteRead("select * from responses where movie_id=" + id);
        for (int index = 0; reader.Read(); index++)
        {
            Response response = new Response(reader);
            responses.Add(response);
        }
        reader.Close();
        return responses;
    }

    public Response(SqlDataReader reader)
    {
        //
        // TODO: Add constructor logic here
        //
        id = reader[0].ToString();
        movie = reader[1].ToString();
        user = reader[2].ToString();
        date = reader[3].ToString();
        comment = reader[4].ToString();
    }
}