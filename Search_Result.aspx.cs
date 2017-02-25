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
    public int mMovieCount = 0;
    private String query = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["query"] != null)
        {
            query = Request.QueryString["query"].ToString();
        }

        mMovieList = new List<Movie>();
        if (query != null)
        {
            seachMovie(query);
        }

        Page.DataBind();
    }

    protected void seachMovie(String query)
    {
        searchMovieByname(query);
        searchMovieByActor(query);
    }

    protected void searchMovieByname(String query)
    {
        String sqlstr = "select * from movie where name like '%" + query + "%'";
        MyLog.v(sqlstr);
        DataTable table = SqlData.getInstance().datasetExecute(sqlstr, "movie");

        for (int index = 0; index < table.Rows.Count; index++)
        {
            Movie movie = new Movie(table.Rows[index]);
            movie.images = Image.get(movie.id);
            mMovieList.Add(movie);
            mMovieCount = mMovieList.Count;
        }
    }

    protected void searchMovieByActor(String query)
    {
        
        String sqlstr = "select * from movie where id in (select movie_id from role where people_id in (select id from people where name like '%" + query + "%'))";
        MyLog.v(sqlstr);
        DataTable table = SqlData.getInstance().datasetExecute(sqlstr, "movie");

        for (int index = 0; index < table.Rows.Count; index++)
        {
            Movie movie = new Movie(table.Rows[index]);
            movie.images = Image.get(movie.id);
            if (mMovieList != null && !mMovieList.Contains(movie)) {
                mMovieList.Add(movie);
                mMovieCount = mMovieList.Count;
            }
            
        }
    }
    //protected void searchMovieByActor(String query)
    //{
    //    List<People> mAcotrs = searchActor(query);
    //    List<Role> mRole = new List<Role>();
    //    if (mAcotrs != null & mAcotrs.Count != 0)
    //    {
    //        for (int i = 0; i < mAcotrs.Count; i++)
    //        {
    //            List<Role> role = searchFromRole(mAcotrs.ElementAt(i).id);
    //            for (int j = 0; j < role.Count; j++)
    //            {
    //                if (!mRole.Contains(role.ElementAt(j)))
    //                {
    //                    mRole.Add(role.ElementAt(j));
    //                }
    //            }
    //        }
    //    }
    //    if (mRole != null & mRole.Count != 0)
    //    {
    //        for (int i = 0; i < mRole.Count; i++)
    //        {
    //            Movie movie = Movie.get(mRole.ElementAt(i).id);
    //            movie.images = Image.get(movie.id);

    //            if (!mMovieList.Contains(movie))
    //            {
    //                mMovieList.Add(movie);
    //            }
    //        }
    //    }

    //    mMovieCount = mMovieList.Count();
    //}

    //private List<People> searchActor(string query)
    //{
    //    List<People> mActors = new List<People>();

    //    String sqlstr = "select * from people where name like '%" + query + "%'";

    //    DataTable table = SqlData.getInstance().datasetExecute(sqlstr, "people");

    //    for (int index = 0; index < table.Rows.Count; index++)
    //    {
    //        People actor = new People(table.Rows[index]);
    //        mActors.Add(actor);

    //    }
    //    return mActors;
    //}


    //private List<Role> searchFromRole(String id)
    //{
    //    List<Role> mRoles = new List<Role>();

    //    String sqlstr = "select * from role where people_id =" + id;

    //    DataTable table = SqlData.getInstance().datasetExecute(sqlstr, "role");

    //    for (int index = 0; index < table.Rows.Count; index++)
    //    {
    //        Role role = new Role(table.Rows[index]);
    //        mRoles.Add(role);

    //    }
    //    return mRoles;

    //}

    public String getSearchResultHtmls()
    {
        StringBuilder sb = new StringBuilder();
        MyLog.v("mMovieCount : " + mMovieCount + "    " + mMovieList.Count);
        for (int i = 0; i < mMovieCount; i++)
        {
            sb.Append(getSearchResultHtml(mMovieList.ElementAt(i), i));
        }
        return sb.ToString();
    }

    private String getSearchResultHtml(Movie movie, int i)
    {
        StringBuilder sb = new StringBuilder();

        String mDirecotrs = "";
        String mActors = "";

        String sqlstr1 = "select * from people where id in (select people_id from role where role in ('director') and movie_id =" + movie.id + ")";
        DataTable table1 = SqlData.getInstance().datasetExecute(sqlstr1, "people");

        for (int index = 0; index < table1.Rows.Count; index++)
        {
            People director = new People(table1.Rows[index]);

            mDirecotrs = mDirecotrs + " " + director.name;
        }

        String sqlstr2 = "select * from people where id in (select people_id from role where role in ('actor') and movie_id =" + movie.id + ")";
        DataTable table2 = SqlData.getInstance().datasetExecute(sqlstr2, "people");

        for (int index = 0; index < table2.Rows.Count; index++)
        {
            People actor = new People(table2.Rows[index]);

            mActors = mActors + " " + actor.name;
        }


        sb.AppendFormat("<tr>");
        sb.AppendFormat("    <td>{0:d}</td>", i);
        sb.AppendFormat("       <td class=\"w3-list-img\">");
     //   sb.AppendFormat("       <a href=\"single.html?id={0:s}\">", movie.id);
        sb.AppendFormat("       <img src=\"{0:s}\" width=\"16%\" />", movie.icon);
        sb.AppendFormat("       <a href=\"single?id={0:s}\">{1:s}</a>", movie.id, movie.name);
        sb.AppendFormat("      </td>");
        sb.AppendFormat("       <td>{0:s}</td>", movie.year);
        sb.AppendFormat("       <td>{0:s}</td>", mDirecotrs);
        sb.AppendFormat("       <td>{0:s}</td>", movie.country);
        sb.AppendFormat("       <td>{0:s}</td>", mActors);
        sb.AppendFormat("       <td>{0:s}</td>", movie.star);
        sb.AppendFormat("</tr>");

        return sb.ToString();
    }
}