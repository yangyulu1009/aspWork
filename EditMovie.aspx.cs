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
        movieDesc.DataBind();
        TextBoxDesc.Text = "";
    }

    public String getUserName(object item)
    {
        String userId = DataBinder.Eval(item, "user_id").ToString();
        return Users.get(userId).name;
    }

    private String onUploadClick(FileUpload upload1, ImageButton imgBtn)
    {
        if (upload1.HasFile)
        {
            String fileName = NameUtils.get(upload1.FileName);

            string savePath = Server.MapPath(Constants.IMAGE_UPLOAD_ROOT);

            if (!System.IO.Directory.Exists(savePath))
            {
                System.IO.Directory.CreateDirectory(savePath);
            }

            savePath = savePath + fileName;
            MyLog.v(savePath);
            upload1.SaveAs(savePath);

            String url = Constants.IMAGE_UPLOAD_ROOT + fileName;
            imgBtn.ImageUrl = url;
            return url;
        }
        return "";
    }

    protected void UploadButton1_Click(object sender, EventArgs e)
    {
        String url = onUploadClick(FileUpload1, ImageButton1);
        Movie.updateIcon(getMovieId(), url);
    }

    protected void UploadButton2_Click(object sender, EventArgs e)
    {
        String url = onUploadClick(FileUpload2, ImageButton2);
        Movie.updateBanner(getMovieId(), url);
    }

    protected void UploadButton3_Click(object sender, EventArgs e)
    {
        String url = onUploadClick(FileUpload3, ImageButton3);
        Image.update(getMovieId(), 0, url);
    }

    protected void UploadButton4_Click(object sender, EventArgs e)
    {
        String url = onUploadClick(FileUpload4, ImageButton4);
        Image.update(getMovieId(), 1, url);
    }

    protected void UploadButton5_Click(object sender, EventArgs e)
    {
        String url = onUploadClick(FileUpload5, ImageButton5);
        Image.update(getMovieId(), 2, url);
    }

    protected void UploadButton6_Click(object sender, EventArgs e)
    {
        String url = onUploadClick(FileUpload6, ImageButton6);
        Image.update(getMovieId(), 3, url);
    }
}