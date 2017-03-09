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
        if (Session[Constants.SESSION_USERID] == null)
        {
            UpdatePanel1.Visible = false;
            return;
        }
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        Movie.insert();
        GridView1.DataBind();
    }

    public String getSingleMovieUrl(String id)
    {
        return "single?id=" + id;
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = GridView1.Rows[e.RowIndex];
        String id = (row.Cells[0]).Text;
        Movie.removeAll(id);
    }

    /*
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
       // GridViewRow row = GridView1.Rows[e.RowIndex];
       // updateKeywords(row);
        //updateGenres(row);
      //  updateDirector(row);
       // updateActor(row);
        //GridView1.DataBind();
    }

    
    private void updateGenres(GridViewRow row)
    {
        String id = (row.Cells[0]).Text;
        String genre = ((TextBox)row.Cells[8].FindControl("TextBoxGenres")).Text;
        MyLog.v("updating genres: " + genre);
        Genre.replace(id, genre);
    }

    private void updateKeywords(GridViewRow row)
    {
        String id = (row.Cells[0]).Text;
        String key = ((TextBox)row.Cells[8].FindControl("TextBoxKeys")).Text;
        MyLog.v("updating keywords: " + key);
        Keywords.replace(id, key);
    }

    private void updateDirector(GridViewRow row)
    {
        String id = (row.Cells[0]).Text;
        String text = ((TextBox)row.Cells[2].FindControl("TextBoxDirector")).Text;
        MyLog.v("updateDirector " + text);
        String[] names = text.Split(Constants.SEPS_WITHNO_SPACE);
        Role.replaceAll(id, "director", new List<String>(names));
    }

    private void updateActor(GridViewRow row)
    {
        String id = (row.Cells[0]).Text;
        String text = ((TextBox)row.Cells[3].FindControl("TextBoxActor")).Text;
        MyLog.v("updateActor " + text);
        String[] names = text.Split(Constants.SEPS_WITHNO_SPACE);
        Role.replaceAll(id, "actor", new List<String>(names));
    }

    public String getDirector(object item)
    {
        String id = DataBinder.Eval(item, "id").ToString();
        return Role.get(id, Role.DIRECTOR);
    }

    public String getActor(object item)
    {
        String id = DataBinder.Eval(item, "id").ToString();
        return Role.get(id, Role.ACTOR);
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
    }*/


}