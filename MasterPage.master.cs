﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections.Specialized;
using System.Web.UI.HtmlControls;
using System.Text;

public partial class MasterPage : System.Web.UI.MasterPage
{

    protected void Page_Load(object sender, EventArgs e)
    {
        MyLog.v("MasterPage Page_Load: " + IsPostBack);

        if (IsPostBack)
        {
            return;
        }

        processAction();
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
            MyLog.v("process action in master: " + actionName);

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
                        alert("Username or Password error！");
                    } else
                    {
                        //  alert("登录成功!");
                        Response.Redirect(Request.Url.ToString());
                    }
                    
                }
            } else if (actionName.Equals("logout"))
            {
                setUserSession(null);
                Response.Redirect("Index");
            } else if (actionName.Equals("userCenter"))
            {
                Response.Redirect("UserCenter.aspx?id=" + getLoginedUserId());
            }
            else if (actionName.Equals("search"))
            {
                String query = Request.Form["Search"].ToString();
                MyLog.v("query: " + query);
                search(query);
            } else if (actionName.Equals("modpwd"))
            {
                String oldPwd = Request.Form["OldPassword"].ToString();
                String newPwd = Request.Form["NewPassword"].ToString();
                modPassword(oldPwd, newPwd);
            }
        }
    }

    private void modPassword(String oldPwd, String newPwd)
    {
        if (oldPwd.Length == 0 || newPwd.Length == 0)
        {
            alert("Password can not be null");
            return;
        } else
        {
            String userId = Session[Constants.SESSION_USERID].ToString();
            if (Users.checkPwd(userId, oldPwd))
            {
                Users.updatePwd(userId, newPwd);
                alert("Change password successfully！");
            } else
            {
                alert("Old password error！");
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
        } else
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

    /**
     * name和email都不能重复，登录可用name，也可以用email
     */
    protected void register(String name, String email, String password)
    {
        MyLog.v(String.Format("register: name = {0:s}, email = {1:s}, password = {2:s}", name, email, password));

        if (Users.existEmail(email))
        {
            Response.Write("<script>alert('Email already exist！')</script>");
            return;
        }

        if (Users.existName(name))
        {
            Response.Write("<script>alert('Username already exist！')</script>");
            return;
        }

        if (password.Length == 0)
        {
            Response.Write("<script>alert('Password can not be null!')</script>");
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

    public String getGenreHtmls()
    {
        String html = "";
        
        List<String> genres = Movie.getAllGenres();
        genres.Insert(0, "All");
        for (int i = 0; i < genres.Count;)
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

}
