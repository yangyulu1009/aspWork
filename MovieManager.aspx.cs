
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NewsManager : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    public String getMovieName(String movieId)
    {
        Movie movie = Movie.get(movieId);
        return movie.name;
    }

    public String getUserName(String userId)
    {
        Users user = Users.get(userId);
        return user.name;
    }

    public String getKeywords(String movieid)
    {
        List<Keywords> keys = Keywords.get(movieid);
        String key = "";
        for (int i = 0; i < keys.Count; i++)
        {
            key = key.Trim() + " " + keys.ElementAt(i);
        }
        return key.Trim();
    }

    public String getPeopleName(String peopleId)
    {
        People people = People.get(peopleId);
        return people.name;
    }

    protected void LinkButton1_Command(object sender, CommandEventArgs e)
    {
        String id = e.CommandName;
        SqlData.getInstance().ExecuteSQL("delete from news where id=" + id);
        Response.Redirect(Request.Url.ToString());
    }

    protected void LinkButton2_Command(object sender, CommandEventArgs e)
    {
        String id = e.CommandName;
        SqlData.getInstance().ExecuteSQL("delete from people where id=" + id);
        Response.Redirect(Request.Url.ToString());
    }

    protected void LinkButton3_Command(object sender, CommandEventArgs e)
    {
        String id = e.CommandName;
        SqlData.getInstance().ExecuteSQL("delete from responses where id=" + id);
        Response.Redirect(Request.Url.ToString());
    }

    protected void LinkButton4_Command(object sender, CommandEventArgs e)
    {
        String id = e.CommandName;
        SqlData.getInstance().ExecuteSQL("delete from role where id=" + id);
        Response.Redirect(Request.Url.ToString());
    }

    protected void LinkButton5_Command(object sender, CommandEventArgs e)
    {
        String id = e.CommandName;
        SqlData.getInstance().ExecuteSQL("delete from sales where id=" + id);
        Response.Redirect(Request.Url.ToString());
    }

    protected void LinkButton6_Command(object sender, CommandEventArgs e)
    {
        String id = e.CommandName;
        SqlData.getInstance().ExecuteSQL("delete from movie where id=" + id);
        Response.Redirect(Request.Url.ToString());
    }


    protected void button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("http://baidu.com");
    }



    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("UpdateExtra"))
        {
            throw new Exception("oh shit!");
        }
    }
}