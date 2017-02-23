using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditMovie : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            return;
        }

        String id = Request.QueryString["id"];
        if (id == null || id.Length == 0)
        {
            id = "1";
        }

        Movie movie = Movie.get(id);
        Application[Constants.MOVIE] = movie;

        Page.DataBind();
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        int id = SqlData.getInstance().getMaxId("news") + 1;
        String sqlstr = String.Format("INSERT INTO news(id, movie_id) VALUES ('{0:d}', '{1:s}')", id, getMovieId());
        MyLog.v(sqlstr);
        SqlData.getInstance().ExecuteSQL(sqlstr);
        GridView1.DataBind();
    }

    protected void updateIconClick(object sender, EventArgs e)
    {
        String url = TextBoxIcon.Text;
        MyLog.v("text = " + url);
        SqlData.getInstance().update("movie", getMovieId(), "icon", url);
        ImageIcon.DataBind();
    }

    protected void updateBannerClick(object sender, EventArgs e)
    {
        String url = TextBoxBanner.Text;
        MyLog.v("text = " + url);
        SqlData.getInstance().update("movie", getMovieId(), "banner", url);
        ImageBanner.DataBind();
    }

    private Movie getMovie()
    {
        Movie movie = (Movie)Application[Constants.MOVIE];
        return Movie.get(movie.id);
    }

    private String getMovieId()
    {
        return getMovie().id;
    }

    public String getIconUrl()
    {
        return getMovie().icon;
    }

    public String getBannerUrl()
    {
        return getMovie().banner;
    }


}