using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Index : System.Web.UI.Page
{

    public Movie[] mMovie = new Movie[10];

    protected void loadMovie()
    {
        DataTable table = SqlData.getInstance().datasetExecute("select * from movie", "movie");
        int size = Math.Min(table.Rows.Count, 10);
        for (int index = 0; index < size; index++)
        {
            Movie movie = new Movie(table.Rows[index]);
            mMovie[index] = movie;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            return;
        }

        processAction();
        loadMovie();
        Page.DataBind();
    }

    public String getLoginButtonText()
    {
        String text = isLogined() ? "User Center" : "LOGIN";
        // MyLog.v("getLoginButtonText " + text);
        return text;
    }

    public String getLoginButtonUrl()
    {
        String url = isLogined() ? "?action=userCenter" : "#";
        // MyLog.v("getLoginButtonUrl " + url);
        return url;
    }

    public String getLoginButtonDataTarget()
    {
        String text = isLogined() ? "" : "#myModal4";
        // MyLog.v("getLoginButtonDataTarget " + text);
        return text;
    }

    public String getLoginButtonTarget()
    {
        String text = isLogined() ? "_blank" : "";
        //   MyLog.v("getLoginButtonTarget " + text);
        return text;
    }

    public String getUserNameText()
    {
        String name = getLoginedUserName();
        String text = name != null ? name + "，Welcome~" : "you are tourist~";
        //   MyLog.v("getUserNameText " + text);
        return text;
    }

    public String getRegisterButtonText()
    {
        String text = isLogined() ? "LOGOUT" : "REGISTER";
        //     MyLog.v("getRegisterButtonText " + text);
        return text;
    }

    public String getRegisterButtonUrl()
    {
        String text = isLogined() ? "?action=logout" : "#";
        //    MyLog.v("getRegisterButtonUrl " + text);
        return text;
    }

    public String getRegisterButtonDataTarget()
    {
        String text = isLogined() ? "" : "#myModal5";
        //      MyLog.v("getRegisterButtonTarget " + text);
        return text;
    }

    private void processAction()
    {
        if (Request.QueryString["action"] != null)
        {
            String actionName = Request.QueryString["action"].ToString();
            MyLog.v("process action " + actionName);

            if (actionName.Equals("register"))
            {
                if (Request.Form["name"] != null && Request.Form["email"] != null && Request.Form["password"] != null)
                {
                    String name = Request.Form["name"].ToString();
                    String email = Request.Form["email"].ToString();
                    String password = Request.Form["password"].ToString();
                    register(name, email, password);
                }
            }
            else if (actionName.Equals("login"))
            {
                String email = "", password = "";
                if (Request.Form["email"] != null && Request.Form["password"] != null)
                {
                    email = Request.Form["email"].ToString();
                    password = Request.Form["password"].ToString();
                }

                if (email.Length > 0 && password.Length > 0)
                {
                    MyLog.v(String.Format("{0:s}: email = {1:s}, password = {2:s}", actionName, email, password));
                    if (!login(email, password))
                    {
                        alert("用户名或密码错误!");
                    } else
                    {
                        Response.Redirect(Request.Url.ToString());
                    }
                }
            }
            else if (actionName.Equals("logout"))
            {
                setUserSession(null);
                Response.Redirect("Index");
            }
            else if (actionName.Equals("userCenter"))
            {
                Response.Redirect("UserCenter.aspx?id=" + getLoginedUserId());
            }
            else if (actionName.Equals("search"))
            {
                String query = Request.Form["Search"].ToString();
                MyLog.v("query: " + query);
                search(query);
            }
        }
    }

    public void alert(String msg)
    {
        String s = String.Format("<script>alert(\"{0:s}\");</script>", msg);
        Response.Write(s);
    }

    protected void search(String query)
    {
        MyLog.v(query);
        Response.Redirect("Search_Result.aspx?Query=" + query);

    }

    private String getLoginedUserId()
    {
        if (Session[Constants.SESSION_USERID] == null)
        {
            return null;
        }
        return Session[Constants.SESSION_USERID].ToString();
    }

    private void setUserSession(String id)
    {
        Session[Constants.SESSION_USERID] = id;
        if (id == null || id.Length == 0)
        {
            Session[Constants.SESSION_USERNAME] = null;
        }
        else
        {
            Session[Constants.SESSION_USERNAME] = Users.get(id).name;
        }
    }

    private bool isLogined()
    {
        return getLoginedUserName() != null;
    }

    protected String getLoginedUserName()
    {
        if (Session[Constants.SESSION_USERNAME] == null)
        {
            return null;
        }

        String userName = Session[Constants.SESSION_USERNAME].ToString();
        MyLog.v("Session user: " + userName);
        return userName;
    }

    protected void register(String name, String email, String password)
    {
        MyLog.v(String.Format("register: name = {0:s}, email = {1:s}, password = {2:s}", name, email, password));

        if (Users.existEmail(email))
        {
            Response.Write("<script>alert('邮件已存在！')</script>");
            return;
        }

        if (Users.existName(name))
        {
            Response.Write("<script>alert('用户名已存在！')</script>");
            return;
        }

        if (password.Length == 0)
        {
            Response.Write("<script>alert('密码不能为空，请重新输入!')</script>");
            return;
        }

        String id = Users.register(name, password, email);

        setUserSession(id);

        Response.Redirect(Request.Url.ToString());
    }

    protected bool login(String email, String password)
    {
        MyLog.v(String.Format("login: email = {0:s}, password = {1:s}", email, password));

        String id = Users.login(email, password);
        setUserSession(id);
        return id != null;
    }

    public String getMovieTypeHtmls()
    {
        StringBuilder sb = new StringBuilder();

        List<String> genres = Movie.getAllGenres();

        for (int i = 0; i < genres.Count; i++)
        {
            sb.Append(getMovieTypeHtml(genres.ElementAt(i)));
        }
        return sb.ToString();
    }

    private String getMovieTypeHtml(String genre)
    {
        StringBuilder sb = new StringBuilder();


        sb.AppendFormat("<li>");
        sb.AppendFormat("<a href=\"Movietype.aspx?name={0:s}\">{1:s}</a></li>", genre, genre);
        return sb.ToString();
    }

    public String getGenreHtmls()
    {
        String html = "";
        List<String> genres = Movie.getAllGenres();
        genres.Insert(0, "All");
        for (int i = 0; i < genres.Count; )
        {
            int len = Math.Min(8, genres.Count - i);
            html += getGenreHtmls(genres.GetRange(i, len));
            i += len;
        }
        return html;
    }

    private String getGenreHtmls(List<String> genres)
    {
        StringBuilder sb = new StringBuilder();
        sb.AppendFormat("<div class=\"col-sm-4\">");
        sb.AppendFormat("    <ul class=\"multi-column-dropdown\">");
        for (int i = 0; i < genres.Count; i++)
        {
            String name = genres.ElementAt(i);
            sb.AppendFormat("<li><a href=\"Movietype?genre={0:s}\">{1:s}</a></li>", name, name);
        }
        sb.AppendFormat("    </ul>");
        sb.AppendFormat("</div>");
        return sb.ToString();
    }

    public String getStarRatingHtmls(int index)
    {
        StringBuilder sb = new StringBuilder();

        Movie movie = mMovie[index];
        int star = (int)(float.Parse(movie.star) * 2);

        sb.AppendFormat("        <li><i class=\"{0:s}\" aria-hidden=\"true\"></i></li>", getStarClass(star)); star -= 2;
        sb.AppendFormat("        <li><i class=\"{0:s}\" aria-hidden=\"true\"></i></li>", getStarClass(star)); star -= 2;
        sb.AppendFormat("        <li><i class=\"{0:s}\" aria-hidden=\"true\"></i></li>", getStarClass(star)); star -= 2;
        sb.AppendFormat("        <li><i class=\"{0:s}\" aria-hidden=\"true\"></i></li>", getStarClass(star)); star -= 2;
        sb.AppendFormat("        <li><i class=\"{0:s}\" aria-hidden=\"true\"></i></li>", getStarClass(star)); star -= 2;


        return sb.ToString();
    }

    private String getStarClass(int star)
    {
        String className = "";
        if (star >= 2)
        {
            className = "fa fa-star";
        }
        else if (star == 1)
        {
            className = "fa fa-star-half-o";
        }
        else
        {
            className = "fa fa-star-o";
        }
        return className;
    }

}