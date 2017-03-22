using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UsersManager : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            return;
        }

        if (Session[Constants.SESSION_USERID] == null)
        {
            Response.Redirect("Index");
            return;
        }

        Page.DataBind();
    }

    public String getHeadIcon(object item)
    {
        String head = DataBinder.Eval(item, "head").ToString();
        return head.Length > 0 ? head : "images/admin.jpg";
    }

    public String getLevelName(object item)
    {
        int level = int.Parse(DataBinder.Eval(item, "level").ToString());
        return level == 0 ? "Admin" : "Common User";
    }

    protected void GridViewUser_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        GridViewUser.DataBind();
    }

    protected void GridViewUser_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        
        GridViewUser.DataBind();
    }

    protected void GridViewUser_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType != DataControlRowType.DataRow)
        {
            return;
        }

        GridViewRow row = e.Row;
        DataRowView view = (DataRowView) row.DataItem;

        int level = int.Parse(view["level"].ToString());

        DropDownList ddp = (DropDownList) e.Row.Cells[2].FindControl("DropDownListLevel");
        if (ddp != null)
        {
            ddp.SelectedIndex = level;
        }
    }

    protected void GridViewUser_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = GridViewUser.Rows[e.RowIndex];

        if (row.RowType != DataControlRowType.DataRow)
        {
            return;
        }

        String id = GridViewUser.DataKeys[e.RowIndex].Value.ToString();
        DropDownList ddp = (DropDownList) row.Cells[2].FindControl("DropDownListLevel");
        String sql = String.Format("update users set level='{0:s}' where id='{1:s}'", ddp.SelectedValue, id);
        SqlData.getInstance().ExecuteSQL(sql);
    }

    protected void GridViewUser_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = GridViewUser.Rows[e.RowIndex];
        String email = (row.Cells[4]).Text;
        MyLog.v(email);
        Responses.removeAllByUser(email);
    }
}