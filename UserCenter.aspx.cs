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
        if (IsPostBack)
        {
            return;
        }

        if (Session[Constants.SESSION_USERID] == null)
        {
            RootContainer.Visible = false;
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

    protected void ButtonModPwd_Click(object sender, EventArgs e)
    {
        if (ButtonModPwd.Text.Equals("修改密码"))
        {
            ButtonModPwd.Text = "更新密码";
            TextBoxPwd.Visible = true;
        } else if (ButtonModPwd.Text.Equals("更新密码"))
        {
            ButtonModPwd.Text = "修改密码";
            String pwd = TextBoxPwd.Text.Trim();
            TextBoxPwd.Visible = false;
            Users.updatePwd(getUser().id, pwd);
        }
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