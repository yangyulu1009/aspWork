using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage2 : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["action"] == null)
        {
            return;
        }
        String action = Request.QueryString["action"].ToString();
        MyLog.v("action = " + action);
        MyLog.v("name = " + Request.Form["name"].ToString());
    }
}
