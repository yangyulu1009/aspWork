using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Single : System.Web.UI.Page
{
    private Movie mMovie;

    protected void Page_Load(object sender, EventArgs e)
    {
        String id = Request.QueryString["id"];
        mMovie = Movie.get(id);
        Response.Write(mMovie.toString());
    }

   
}