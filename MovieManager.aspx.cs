using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MovieManager : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        int id = SqlData.getInstance().getMaxId("movie") + 1;
        String sqlstr = String.Format("INSERT INTO movie(id) VALUES ('{0:d}')", id);
        SqlData.getInstance().ExecuteSQL(sqlstr);
        Response.Redirect(Request.Url.ToString());
    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        
        
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        
    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        
    }

    protected void GridView1_DataBound(object sender, EventArgs e)
    {

    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        
    }
}