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
        GridView1.DataBind();
     //   Response.Redirect(Request.Url.ToString());
    }

    public String getKeywords(object dataItem)
    {
        String id = DataBinder.Eval(dataItem, "id").ToString();
        List<String> words = Keywords.get2(id);
        return StringUtils.join(words);
    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = GridView1.Rows[e.RowIndex];
        //showGridViewRow(row);
        String id = (row.Cells[0]).Text;
        String key = ((TextBox)row.Cells[8].FindControl("TextBoxKeys")).Text;
        MyLog.v("updating keywords: " + key);
        Keywords.replace(id, key);
        GridView1.DataBind();
    }

    private void showGridViewRow(GridViewRow row)
    {
        String id = (row.Cells[0]).Text;
        MyLog.v("id = " + id);

        String name = ((TextBox)row.Cells[1].Controls[0]).Text;
        MyLog.v("name = " + name);

        String desc = ((TextBox)row.Cells[2].Controls[0]).Text;
        MyLog.v("desc = " + desc);

        String key = ((TextBox)row.Cells[8].FindControl("TextBoxKeys")).Text;
        MyLog.v("key = " + key);
    }
}