using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String name = Request.Form["name"].ToString();
        String email = Request.Form["email"].ToString();
        String password = Request.Form["password"].ToString();
        Response.Write(name + "," + email + "," + password);
    }
}