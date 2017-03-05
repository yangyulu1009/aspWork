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

    public String getNewPeopleId()
    {
        int id = SqlData.getInstance().getMaxId("people") + 1;
        return id.ToString();
    }

    protected void LinkButtonAdd_Click(object sender, EventArgs e)
    {
        String peopleid = LabelPeopleId.Text;
        People.add(TextBoxName.Text.Trim(), TextBoxUrl.Text.Trim());
        GridViewPeople.DataBind();
    }
}