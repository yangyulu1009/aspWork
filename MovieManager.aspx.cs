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

    public String getKeywords(String id)
    {
        List<String> words = Keywords.get2(id);
        return StringUtils.join(words);
    }
}