using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Movietype : System.Web.UI.Page
{

    private String mGenre;
    private List<Movie> mMovies;
    private int mPageIndex;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            return;
        }

        if (Request.QueryString["genre"] != null)
        {
            mGenre = Request.QueryString["genre"].ToString();
            if (mGenre.Equals("All"))
            {
                mGenre = "";
            }
        }

        if (Request.QueryString["page"] != null)
        {
            mPageIndex = int.Parse(Request.QueryString["page"].ToString());
        }

        mPageIndex = Math.Max(mPageIndex, 1);
        
        mMovies = Movie.getMovieByGenre(mGenre);
        Page.DataBind();
    }

    private int getPageCount()
    {
        return 1 + (mMovies.Count - 1) / 10; ;
    }

    public String getPageHtmls()
    {
        StringBuilder sb = new StringBuilder();
        int page = getPageCount();
        for (int i = 1; i <= page; i++)
        {
            String url = String.Format("?genre={0:s}&page={1:d}", mGenre, i);
            String className = (i == mPageIndex ? "myselect" : "");
            sb.AppendFormat("<li><a href=\"{0:s}\" class=\"{1:s}\">{2:d}</a></li>", url, className, i);
        }
        return sb.ToString();
    }

    public String getPrevUrl()
    {
        if (mPageIndex > 1)
        {
            return String.Format("?genre={0:s}&page={1:d}", mGenre, mPageIndex - 1);
        } else
        {
            return "#";
        }
    }

    public String getNextUrl()
    {
        if (mPageIndex < getPageCount())
        {
            return String.Format("?genre={0:s}&page={1:d}", mGenre, mPageIndex + 1);
        }
        else
        {
            return "#";
        }
    }

    public String getActionName()
    {
        return mGenre != null && mGenre.Length > 0 ? mGenre : "ALL";
    }

    public String getMovietypeHtmls()
    {
        int start = (mPageIndex - 1) * 10;
        int size = Math.Min(mMovies.Count - start, 10);
        int end = start + size;
        StringBuilder sb = new StringBuilder();
        for (int i = start; i < end; i++)
        {
            sb.Append(getMovietypeHtml(i));
        }
        return sb.ToString();
    }

    private String getMovietypeHtml(int index)
    {
        StringBuilder sb = new StringBuilder();

        Movie movie = mMovies.ElementAt(index);

        sb.AppendFormat("<div class=\"col-md-2 w3l-movie-gride-agile requested-movies\">");
        sb.AppendFormat("    <a href=\"Single?id={0:s}\" class=\"hvr-sweep-to-bottom\">", movie.id);
        sb.AppendFormat("        <img src=\"{0:s}\" title=\"Movies Pro\" class=\"img-responsive\" />", movie.getIndexImage());
        sb.AppendFormat("        <div class=\"w3l-action-icon\"></div>");
        sb.AppendFormat("    </a>");
        sb.AppendFormat("    <div class=\"mid-1 agileits_w3layouts_mid_1_home\">");
        sb.AppendFormat("        <div class=\"w3l-movie-text\">");
        sb.AppendFormat("            <h6><a href=\"Single?id={0:s}\">{1:s}</a></h6>", movie.id, movie.name);
        sb.AppendFormat("        </div>");
        sb.AppendFormat("        <div class=\"mid-2 agile_mid_2_home\">");
        sb.AppendFormat("            <p>{0:s}</p>", movie.year);
        sb.AppendFormat("            <div class=\"block-stars\">");
        sb.AppendFormat("                <ul class=\"w3l-ratings\">");
        sb.Append(getStarRatingHtmls(movie.star));
        sb.AppendFormat("                </ul>");
        sb.AppendFormat("            </div>");
        sb.AppendFormat("            <div class=\"clearfix\"></div>");
        sb.AppendFormat("        </div>");
        sb.AppendFormat("    </div>");
        sb.AppendFormat("</div>");
        return sb.ToString();
    }


    public String getStarRatingHtmls(String startText)
    {
        StringBuilder sb = new StringBuilder();

        int star = (int)(float.Parse(startText) * 2);
        sb.AppendFormat("        <li><i class=\"{0:s}\" aria-hidden=\"true\"></i></li>", getStarClass(star)); star -= 2;
        sb.AppendFormat("        <li><i class=\"{0:s}\" aria-hidden=\"true\"></i></li>", getStarClass(star)); star -= 2;
        sb.AppendFormat("        <li><i class=\"{0:s}\" aria-hidden=\"true\"></i></li>", getStarClass(star)); star -= 2;
        sb.AppendFormat("        <li><i class=\"{0:s}\" aria-hidden=\"true\"></i></li>", getStarClass(star)); star -= 2;
        sb.AppendFormat("        <li><i class=\"{0:s}\" aria-hidden=\"true\"></i></li>", getStarClass(star)); star -= 2;
        return sb.ToString();
    }

    private String getStarClass(int star)
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
        return className;
    }
}