using System;
using System.Collections.Generic;
using System.Linq;
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
}