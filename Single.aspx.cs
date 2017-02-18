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
    public Movie mMovie;

    protected void Page_Load(object sender, EventArgs e)
    {
        String id = Request.QueryString["id"];
        if (id == null || id.Length == 0)
        {
            Response.Write("<p>invalid id</p>");
            return;
        }

        mMovie = Movie.get(id);
        mMovie.loadExtraData();
        setStar();
        Page.DataBind();
    }

    private void setStar()
    {
        int star = (int) (float.Parse(mMovie.star) * 2);
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
        } else if (star == 1)
        {
            className = "fa fa-star-half-o";
        } else
        {
            className = "fa fa-star-o";
        }
        control.Attributes.Add("class", className);
    }

    public String getResponseHtmls()
    {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < mMovie.responses.Count; i++)
        {
            sb.Append(getResponseHtml(mMovie.responses.ElementAt(i)));
        }
        return sb.ToString();
    }

    private String getResponseHtml(Response response)
    {
        StringBuilder sb = new StringBuilder();
  
        sb.AppendFormat("<div class=\"media response-info\">");
        sb.AppendFormat("    <div class=\"media-left response-text-left\">");
        sb.AppendFormat("        <img class=\"media-object\" src=\"{0:s}\">", response.user.head);
        sb.AppendFormat("        <h5>{0:s}</h5>", response.user.name);
        sb.AppendFormat("    </div>");
        sb.AppendFormat("    <div class=\"media-body response-text-right\">");
        sb.AppendFormat("        <p>{0:s}</p>", response.comment);
        sb.AppendFormat("        <ul>");

        DateTime dateTime = Convert.ToDateTime(response.date);
        sb.AppendFormat("            <li>{0:s}</li>", dateTime.ToString("yyyy年MM月dd日", DateTimeFormatInfo.InvariantInfo));
        sb.AppendFormat("            <li><a href=\"DeleteResponse?id={0:s}\">Delete</a></li>", response.id);
        sb.AppendFormat("        </ul>");
        sb.AppendFormat("    </div>");
        sb.AppendFormat("    <div class=\"clearfix\"></div>");
        sb.AppendFormat("</div>");

        return sb.ToString();
    }
}