using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Web.UI.HtmlControls;

public partial class Search_Result : System.Web.UI.Page
{
    public List<Movie> mMovieList;
    private String mQuery;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            return;
        }

        if (Request.QueryString["query"] != null)
        {
            mQuery = Request.QueryString["query"].ToString();
        }

        Page.DataBind();
    }

    public int getMovieCount()
    {
        return mMovieList != null ? mMovieList.Count : 0;
    }

    public String getSearchResultHtmls()
    {
        StringBuilder sb = new StringBuilder();
        mMovieList = Movie.search(mQuery);
        for (int i = 0; i < mMovieList.Count; i++)
        {
            sb.Append(getSearchResultHtml(i));
        }
        return sb.ToString();
    }

    private String getSearchResultHtml(int i)
    {
        StringBuilder sb = new StringBuilder();

        Movie movie = mMovieList.ElementAt(i);

        List<Role> roles = Role.get(movie.id);


        sb.AppendFormat("<tr>");
        sb.AppendFormat("    <td>{0:d}</td>", i + 1);
        sb.AppendFormat("       <td class=\"w3-list-img\">");
        sb.AppendFormat("           <img src=\"{0:s}\" width=\"16%\" />", movie.getIndexImage());
        sb.AppendFormat("           <a href=\"single?id={0:s}\">{1:s}</a>", movie.id, movie.name);
        sb.AppendFormat("      </td>");
        sb.AppendFormat("       <td>{0:s}</td>", movie.year);
        sb.AppendFormat("       <td>{0:s}</td>", movie.country);
        sb.AppendFormat("       <td>{0:s}</td>", getRoleHtml(roles, Role.DIRECTOR));
        sb.AppendFormat("       <td>{0:s}</td>", getRoleHtml(roles, Role.ACTOR));
        sb.AppendFormat("       <td>{0:s}</td>", getRoleHtml(roles, Role.WRITER));
        sb.AppendFormat("       <td>{0:s}</td>", movie.star);
        sb.AppendFormat("</tr>");

        return sb.ToString();
    }

    private String getRoleHtml(List<Role> roles, String roleName)
    {
        List<String> tds = new List<String>();
        for (int i = 0; i < roles.Count; i++)
        {
            Role role = roles.ElementAt(i);
            if (role.role.Equals(roleName))
            {
                tds.Add(String.Format("<a href=\"{0:s}\" target=\"_blank\">{1:s}</a>", role.people.url, role.people.name));
            }
        }
        return StringUtils.join(tds, "; ");
    }
}