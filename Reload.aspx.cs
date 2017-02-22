using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Reload : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
            Session["UserName"] = "Guest";
        if (Request.UrlReferrer != null) {
            Session["CurrentUrl"] = Request.UrlReferrer.ToString();
        }
        if (Session["CurrentUrl"] == null)
            Response.Redirect("Index.aspx");
        else
            Response.Redirect(Session["CurrentUrl"].ToString());
    }
}