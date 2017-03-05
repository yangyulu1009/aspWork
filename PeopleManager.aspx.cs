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

    protected void LinkButtonAdd_Click(object sender, EventArgs e)
    {
        String peopleid = LabelPeopleId.Text;
        People.add(peopleid, TextBoxName.Text.Trim(), TextBoxUrl.Text.Trim());
        GridViewPeople.DataBind();
        Table1.DataBind();
        TextBoxName.Text = "";
        TextBoxUrl.Text = "";
    }

    protected void GridViewPeople_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        String id = GridViewPeople.Rows[e.RowIndex].Cells[0].Text;
        Role.removePeople(id);
       
    }

    protected void GridViewPeople_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        Table1.DataBind();
    }
}