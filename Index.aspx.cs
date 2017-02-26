using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Index : System.Web.UI.Page
{

    public Movie[] mMovie = new Movie[10];

    protected void loadMovie()
    {
        DataTable table = SqlData.getInstance().datasetExecute("select * from movie", "movie");

        for (int index = 0; index < table.Rows.Count; index++)
        {
            Movie movie = new Movie(table.Rows[index]);
            movie.images = Image.get(movie.id);
            mMovie[index] = movie;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            return;
        }

        loadMovie();
        Page.DataBind();
    }
}