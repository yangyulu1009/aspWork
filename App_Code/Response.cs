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
    public String user;
    public String movie;
    public String content;
    public String date;


    public Response(SqlDataReader reader)
    {
        //
        // TODO: Add constructor logic here
        //
        id = reader[0].ToString();
        content = reader[1].ToString();
        date = reader[2].ToString();
        user = reader[3].ToString();
        movie = reader[4].ToString();
    }
}