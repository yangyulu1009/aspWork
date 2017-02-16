using System;
using System.Collections.Generic;
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
        SqlDataReader myReader = SqlData.getInstance().ExecuteRead("select * from movie");

        for (int index = 0; myReader.Read(); index++)
        {
            Movie movie = new Movie(myReader);
            movie.images = Image.get(movie.id);
            mMovie[index] = movie;
        }

        myReader.Close();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        loadMovie();
        Page.DataBind();
    }
}