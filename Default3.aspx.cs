using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       if (IsPostBack)
        {
            return;
        }

        BindGridView();
    }

    private void BindGridView()
    {
        DataSet set = SqlData.getInstance().getDataSource("select * from role where movie_id=1", "role");
        GridView1.DataSource = set;
        GridView1.DataBind();
    }

  
}