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

    private Image getOperaImage(int index)
    {
        List<Image> images = Image.get(getMovieId());
        return images.ElementAt(index);
    }

    public String getOperaImageUrl(int index)
    {
        return getOperaImage(index).url;
    }

    public void updateOperaImageUrl0(object sender, EventArgs e)
    {
        String url = TextBox0.Text;
        MyLog.v("text = " + url);
        SqlData.getInstance().update("image", getOperaImage(0).id, "url", url);
        Image0.DataBind();
    }

    public void updateOperaImageUrl1(object sender, EventArgs e)
    {
        String url = TextBox1.Text;
        MyLog.v("text = " + url);
        SqlData.getInstance().update("image", getOperaImage(1).id, "url", url);
        Image1.DataBind();
    }

    public void updateOperaImageUrl2(object sender, EventArgs e)
    {
        String url = TextBox2.Text;
        MyLog.v("text = " + url);
        SqlData.getInstance().update("image", getOperaImage(2).id, "url", url);
        Image2.DataBind();
    }

    public void updateOperaImageUrl3(object sender, EventArgs e)
    {
        String url = TextBox3.Text;
        MyLog.v("text = " + url);
        SqlData.getInstance().update("image", getOperaImage(3).id, "url", url);
        Image3.DataBind();
    }
}