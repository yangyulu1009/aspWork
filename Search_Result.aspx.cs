using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Search_Result : System.Web.UI.Page
{
    public List<Movie> mMovieList;
    public int mMovieCount = 0;
    private String query;

    protected void Page_Load(object sender, EventArgs e)
    {
        query = Request.QueryString["query"].ToString();
        mMovieList = new List<Movie>();
        seachMovie(query);
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
            mMovieCount = mMovieList.Count();
        }
    }

    protected void searchMovieByActor(String query)
    {
        List<People> mAcotrs = searchActor(query);
        List<Role> mRole = new List<Role>();
        if (mAcotrs != null & mAcotrs.Count != 0)
        {
            for (int i = 0; i < mAcotrs.Count; i++)
            {
                List<Role> role = searchFromRole(mAcotrs.ElementAt(i).id);
                for (int j = 0; j < role.Count; j++)
                {
                    if (!mRole.Contains(role.ElementAt(j)))
                    {
                        mRole.Add(role.ElementAt(j));
                    }
                }
            }
        }
        if (mRole != null & mRole.Count != 0)
        {
            for (int i = 0; i < mRole.Count; i++)
            {
                Movie movie = Movie.get(mRole.ElementAt(i).id);
                movie.images = Image.get(movie.id);

                if (!mMovieList.Contains(movie)) {
                    mMovieList.Add(movie);
                }
            }
        }
    }

    private List<People> searchActor(string query)
    {
        List<People> mActors = new List<People>();

        String sqlstr = "select * from people where name like '%" + query + "%'";

        DataTable table = SqlData.getInstance().datasetExecute(sqlstr, "people");

        for (int index = 0; index < table.Rows.Count; index++)
        {
            People actor = new People(table.Rows[index]);
            mActors.Add(actor);

        }
        return mActors;
    }


    private List<Role> searchFromRole(String id)
    {
        List<Role> mRoles = new List<Role>();

        String sqlstr = "select * from role where people_id =" + id;

        DataTable table = SqlData.getInstance().datasetExecute(sqlstr, "role");

        for (int index = 0; index < table.Rows.Count; index++)
        {
            Role role = new Role(table.Rows[index]);
            mRoles.Add(role);

        }
        return mRoles;

    }
}