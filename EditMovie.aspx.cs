using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditMovie : System.Web.UI.Page
{
    private String mMovieId;

    public Movie mMovie;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            return;
        }

        mMovieId = Request.QueryString["id"];
        if (mMovieId == null || mMovieId.Length == 0)
        {
            mMovieId = "1";
        }
        mMovie = Movie.get(mMovieId);
        TextBox1.Text = mMovie.icon;
        

        Page.DataBind();
        MyLog.v("movie = " + mMovie.name + " " + mMovie.icon);
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        int id = SqlData.getInstance().getMaxId("news") + 1;
        String sqlstr = String.Format("INSERT INTO news(id, movie_id) VALUES ('{0:d}', '{1:s}')", id, mMovieId);
        SqlData.getInstance().ExecuteSQL(sqlstr);
        Response.Redirect(Request.Url.ToString());
    }


    protected void updateIconClick(object sender, EventArgs e)
    {
        MyLog.v("text = " + TextBox1.Text);
        SqlData.getInstance().update("movie", mMovieId, "icon", TextBox1.Text);
        Page.DataBind();
    }
}