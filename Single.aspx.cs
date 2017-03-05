using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Single : System.Web.UI.Page
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

        setStar();

        Page.DataBind();
    }

    public Movie getMovie()
    {
        Movie movie = (Movie)Application[Constants.MOVIE];
        return Movie.get(movie.id);
    }

    public String getMovieId()
    {
        return getMovie().id;
    }



    private void setStar()
    {
        int star = (int)(float.Parse(getMovie().star) * 2);
        setStarClass(star1, star);
        setStarClass(star2, star -= 2);
        setStarClass(star3, star -= 2);
        setStarClass(star4, star -= 2);
        setStarClass(star5, star -= 2);
    }

    private void setStarClass(HtmlGenericControl control, int star)
    {
        String className = "";
        if (star >= 2)
        {
            className = "fa fa-star";
        }
        else if (star == 1)
        {
            className = "fa fa-star-half-o";
        }
        else
        {
            className = "fa fa-star-o";
        }
        control.Attributes.Add("class", className);
    }

    public String getResponseHtmls()
    {
        StringBuilder sb = new StringBuilder();
        List<Responses> responses = Responses.get(getMovieId());
        for (int i = 0; i < responses.Count; i++)
        {
            sb.Append(getResponseHtml(responses.ElementAt(i)));
        }
        return sb.ToString();
    }

    public String getResponseHtml(int index)
    {
        List<Responses> response = Responses.get(getMovieId());
        return getResponseHtml(response.ElementAt(index));
    }

    private String getResponseHtml(Responses response)
    {
        StringBuilder sb = new StringBuilder();

        sb.AppendFormat("<div class=\"media response-info\">");
        sb.AppendFormat("    <div class=\"media-left response-text-left\">");
        sb.AppendFormat("        <img class=\"media-object\" style=\"height:100px\" src=\"{0:s}\">", response.user.head);
        sb.AppendFormat("        <h5>{0:s}</h5>", response.user.name);
        sb.AppendFormat("    </div>");
        sb.AppendFormat("    <div class=\"media-body response-text-right\">");
        sb.AppendFormat("        <p>{0:s}</p>", response.comment);
        sb.AppendFormat("        <ul>");
        sb.AppendFormat("            <li>{0:s}</li>", response.reply_time);
       // sb.AppendFormat("            <li><a href=\"?id={0:s}\">Delete</a></li>", response.id);
        sb.AppendFormat("        </ul>");
        sb.AppendFormat("    </div>");
        sb.AppendFormat("    <div class=\"clearfix\"></div>");
        sb.AppendFormat("</div>");

        return sb.ToString();
    }

    public String getNewsHtml()
    {
        StringBuilder sb = new StringBuilder();

        Movie movie = getMovie();

        sb.AppendFormat("<ul class=\"side-bar-agile\">");
        List<News> newz = News.get(getMovieId());
        for (int i = 0; i < newz.Count; i++)
        {
            News news = newz.ElementAt(i);
            sb.AppendFormat("<li>");
            sb.AppendFormat("    <a href=\"{0:s}\">{1:s}</a>", news.url, news.content);
            sb.AppendFormat("    <p>{0:s}</p>", DateUtils.getDate(news.reldate));
            sb.AppendFormat("</li>");
        }
        sb.AppendFormat("</ul>");

        return sb.ToString();
    }

    public String getSalesHtml()
    {
        StringBuilder sb = new StringBuilder();
        Movie movie = getMovie();
        List<Sales> salez = Sales.get(getMovieId());
        for (int i = 0; i < salez.Count; i++)
        {
            Sales sales = salez.ElementAt(i);
            sb.AppendFormat("<tr>");
            sb.AppendFormat("    <td>{0:s}</td>", DateUtils.getDate(sales.date));
            sb.AppendFormat("    <td>{0:s}</td>", DateUtils.getWeekDay(sales.date));
            sb.AppendFormat("    <td>${0:s}</td>", sales.sale);
            sb.AppendFormat("</tr>");
        }

        return sb.ToString();
    }

    public String getTillDate()
    {
        List<Sales> salez = Sales.get(getMovieId());
        Sales sale = salez.ElementAt(0);
        return DateUtils.getDate(sale.date);
    }

    public String getSendResponseHtml()
    {
        StringBuilder sb = new StringBuilder();
        if (isLogined())
        {
            ButtonSendRsp.Visible = true;
        } else
        {
            ButtonSendRsp.Visible = false;
            sb.AppendFormat("<a class=\"send-rsp-btn\" data-toggle=\"modal\" data-target=\"#myModal4\">SEND</a>");
        }
        return sb.ToString();
    }


    private bool isLogined()
    {
        return getLoginedUserName() != null;
    }

    protected String getLoginedUserName()
    {
        if (Session[Constants.SESSION_USERNAME] == null)
        {
            return null;
        }

        String userName = Session[Constants.SESSION_USERNAME].ToString();
        MyLog.v("Session user: " + userName);
        return userName;
    }

    protected void ButtonSendRsp_Click(object sender, EventArgs e)
    {
        MyLog.v("clicked " + TextBoxResp.Text);
        Responses.insert(getMovieId(), Session[Constants.SESSION_USERID].ToString(), TextBoxResp.Text);
        RepeaterResponses.DataBind();
        TextBoxResp.Text = "";
    }
}