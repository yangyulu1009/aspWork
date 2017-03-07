using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserCenter : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        /*
        if (Request.QueryString["action"] != null)
        {
            String action = Request.QueryString["action"].ToString();

            MyLog.v("process action in usercenter: " + action);
            
            if ("modpwd".Equals(action))
            {
                String oldPwd = Request.Form["OldPassword"].ToString();
                String newPwd = Request.Form["NewPassword"].ToString();
                modPassword(oldPwd, newPwd);
            }
            return;
        }*/

        if (IsPostBack)
        {
            return;
        }

        if (Session[Constants.SESSION_USERID] == null)
        {
            RootContainer.Visible = false;
            UpdatePanelResponses.Visible = false;
            return;
        }
        String userId = Session[Constants.SESSION_USERID].ToString();
        if (userId.Length > 0)
        {
            Users user = Users.get(userId);
            Application[Constants.KEY_USER] = user;
        }

        

        Page.DataBind();
    }

    public Users getUser()
    {
        Users user = (Users) Application[Constants.KEY_USER];
        return user != null ? user : new Users();
    }

    public String getUserHead()
    {
        String head = getUser().head;
        if (head != null && head.Length > 0)
        {
            return head;
        }
        return "images/admin.jpg";
    }

    protected void ButtonUpload_Click(object sender, EventArgs e)
    {
        if (ImageUpload.HasFile)
        {
            String fileName = NameUtils.get(ImageUpload.FileName);

            string savePath = Server.MapPath(Constants.IMAGE_UPLOAD_ROOT);

            if (!System.IO.Directory.Exists(savePath))
            {
                System.IO.Directory.CreateDirectory(savePath);
            }

            savePath = savePath + fileName;
            MyLog.v(savePath);
            ImageUpload.SaveAs(savePath);

            String url = Constants.IMAGE_UPLOAD_ROOT + fileName;
            Users.updateHead(getUser().id, url);
            getUser().head = url;
            ImageHead.DataBind();
        }
    }

    public String getPrevilage()
    {
        String level = getUser().level;
        return "0".Equals(level) ? "管理员" : "普通用户";
    }

    public String getRegTime()
    {
        return getUser().regtime;
    }

    public String getMovieName(object item)
    {
        String movieId = DataBinder.Eval(item, "movie_id").ToString();
        Movie movie = Movie.get(movieId);
        if (movie != null)
        {
            return movie.name;
        } else
        {
            return "";
        }
    }

    public String getMovieUrl(object item)
    {
        String movieId = DataBinder.Eval(item, "movie_id").ToString();
        Movie movie = Movie.get(movieId);
        if (movie != null)
        {
            return "single?id=" + movieId;
        }
        else
        {
            return "";
        }
    }

    protected void GridViewResponses_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

    }
}