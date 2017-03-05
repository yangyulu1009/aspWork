using System;
using System.Collections.Generic;
using System.Data;
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

        bindRole();
        Page.DataBind();
    }

    private void bindRole()
    {
        List<String> people = People.getAllPeople();
        people.Sort();

        foreach (String name in people)
        {
            DPLPeople.Items.Add(name.Trim());
        }
    }

    public void ButtonAddRole_Click(object sender, EventArgs e)
    {
        String roleId = LabelRoleId.Text;
        String peopleName = DPLPeople.SelectedValue;
        String peopleid = People.getByName(peopleName).id;
        String roleName = DPLRole.SelectedValue;
        String sqlstr = String.Format("INSERT INTO role(id, movie_id, people_id, role) VALUES ('{0:s}', '{1:s}', '{2:s}', '{3:s}')",
            roleId, getMovieId(), peopleid, roleName);
    
        SqlData.getInstance().ExecuteSQL(sqlstr);
        int id = SqlData.getInstance().getMaxId("role") + 1;
        LabelRoleId.Text = id.ToString();
        GridViewRole.DataBind();
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
        return getMovie().getIndexImage();
    }

    public String getBannerUrl()
    {
        return getMovie().getBannerImageUrl();
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

    public String getKeywords()
    {
        return getMovie().keywords;
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

    public String getUserName(object item)
    {
        String userId = DataBinder.Eval(item, "user_id").ToString();
        return Users.get(userId).name;
    }

    public String getImageDesc(int index)
    {
        return Constants.IMAGE_DESC[index];
    }

    public String getVideoDesc(int index)
    {
        return Constants.VIDEO_DESC[index];
    }


    protected void GridViewImage_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewImage.DataBind();
    }

    protected void GridViewVideos_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewVideos.DataBind();
    }

    public String getPeopleName(Object item)
    {
        String peopleId = DataBinder.Eval(item, "people_id").ToString();
        if (peopleId.Length == 0)
        {
            return "";
        }
        return People.get(peopleId).name;
    }



    public String getMaxRoleId()
    {
        int id = SqlData.getInstance().getMaxId("role") + 1;
        return id.ToString();
    }

    protected void DPLPeople_SelectedIndexChanged(object sender, EventArgs e)
    {
        MyLog.v("DPLPeople_SelectedIndexChanged " + e.ToString());
    }
}