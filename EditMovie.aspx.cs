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

    protected void btnAddSaleClick(object sender, EventArgs e)
    {

    }

    public String getMovieName(object item)
    {
        String movieId = DataBinder.Eval(item, "movie_id").ToString();
        return Movie.get(movieId).name;
    }

    protected void GridViewSales_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridViewRow row = GridViewSales.Rows[e.NewEditIndex];
        DropDownList drop = (DropDownList) row.Cells[1].FindControl("dropDownListMovie");
        DropDownList drop2 = (DropDownList)row.Cells[2].FindControl("dropDownListMovie");
        drop.SelectedIndex = 0;
        drop2.SelectedIndex = 0;

        /*
        List<Movie> movies = Movie.get();
        int index = -1;
        for (int i = 0; i < movies.Count; i++)
        {
            drop.Items.Add(movies.ElementAt(i).name);
            if (movies.ElementAt(i).id.Equals(getMovieId()))
            {
                index = i;
            }
        }
        drop.SelectedIndex = index;*/
    }



    protected void GridViewSales_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

    }
}