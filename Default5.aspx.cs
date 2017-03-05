using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default5 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DPLPeople.Items.Add("one");
            DPLPeople.Items.Add("two");
            DPLPeople.Items.Add("three");
        }
    }

    protected void ButtonAddRole_Click(object sender, EventArgs e)
    {
        LabelSelect.Text = DPLPeople.SelectedValue;
    }

    protected void DPLPeople_SelectedIndexChanged(object sender, EventArgs e)
    {
        MyLog.v("DPLPeople_SelectedIndexChanged");
    }
}