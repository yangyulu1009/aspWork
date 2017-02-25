using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
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

    protected void btnAddNews_Click(object sender, EventArgs e)
    {
        int id = SqlData.getInstance().getMaxId("news") + 1;
        String sqlstr = String.Format("INSERT INTO news(id, movie_id, reldate) VALUES ('{0:d}', '{1:s}', '{2:s}')", 
            id, getMovieId(), DateTime.Now.Date.ToShortDateString());
        MyLog.v(sqlstr);
        SqlData.getInstance().ExecuteSQL(sqlstr);
        GridViewNews.DataBind();
    }

    protected void btnAddSaleClick(object sender, EventArgs e)
    {
        int id = SqlData.getInstance().getMaxId("sales") + 1;
        String sqlstr = String.Format("INSERT INTO sales(id, movie_id, reldate) VALUES ('{0:d}', '{1:s}', '{2:s}')", id, getMovieId(), DateTime.Now.Date.ToShortDateString());
        MyLog.v(sqlstr);
        SqlData.getInstance().ExecuteSQL(sqlstr);
        GridViewSales.DataBind();
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

    private Video getVideo(int index)
    {
        List<Video> videos = Video.get(getMovieId());
        return videos.ElementAt(index);
    }

    public String getVideoImageUrl(int index)
    {
        return getVideo(index).image;
    }

    public String getVideoUrl(int index)
    {
        return getVideo(index).url;
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

    public void updateVideo0(object sender, EventArgs e)
    {
        String url = TextBoxVideoImage0.Text;
        String video = TextBoxVideoUrl0.Text;
        MyLog.v("text = " + url);
        getVideo(0).update(url, video);
        VideoImage0.DataBind();
    }

    public void updateVideo1(object sender, EventArgs e)
    {
        String url = TextBoxVideoImage1.Text;
        String video = TextBoxVideoUrl1.Text;
        MyLog.v("text = " + url);
        getVideo(1).update(url, video);
        VideoImage1.DataBind();
    }

    public void updateVideo2(object sender, EventArgs e)
    {
        String url = TextBoxVideoImage2.Text;
        String video = TextBoxVideoUrl2.Text;
        MyLog.v("text = " + url);
        getVideo(2).update(url, video);
        VideoImage2.DataBind();
    }

    public void updateVideo3(object sender, EventArgs e)
    {
        String url = TextBoxVideoImage3.Text;
        String video = TextBoxVideoUrl3.Text;
        MyLog.v("text = " + url);
        getVideo(3).update(url, video);
        VideoImage3.DataBind();
    }

    public String getKeywords()
    {
        List<String> keys = Keywords.get2(getMovieId());
        return StringUtils.join(keys, " ");
    }

    public String getMovieName(object item)
    {
        String movieId = DataBinder.Eval(item, "movie_id").ToString();
        return Movie.get(movieId).name;
    }

    public String getWeek(object item)
    {
        String reldate = DataBinder.Eval(item, "reldate").ToString();
        return DateUtils.getWeekDay(reldate);
    }

    public String getMovieDesc()
    {
        return getMovie().description;
    }

    protected void ButtonDesc_Click(object sender, EventArgs e)
    {
        Movie.updateDesc(getMovieId(), TextBoxDesc.Text);
    }

    public String getUserName(object item)
    {
        String userId = DataBinder.Eval(item, "user_id").ToString();
        return Users.get(userId).name;
    }
}