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

}