using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        
    }

    protected void GridView1_DataBinding(object sender, EventArgs e)
    {
        
    }

    protected string getText(object dataItem)
    {
       return  DataBinder.Eval(dataItem, "url").ToString();
    }
}