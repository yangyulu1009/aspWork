using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Single : System.Web.UI.Page
{
    public Movie mMovie;

    protected void Page_Load(object sender, EventArgs e)
    {
        String id = Request.QueryString["id"];
        if (id == null || id.Length == 0)
        {
            throw new Exception("no movie id");
        }

        mMovie = Movie.get(id);
    }

   
}