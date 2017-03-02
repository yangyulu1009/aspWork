using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PeopleManager : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ButtonAddPeople_Click(object sender, EventArgs e)
    {
        int id = SqlData.getInstance().getMaxId("people");
        People.add("", "");
        GridViewPeople.DataBind();
    }
}