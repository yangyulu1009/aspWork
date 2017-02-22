using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class MasterPage : System.Web.UI.MasterPage
{
    private string session_username = "";
    private DataTable ds;
    private Users user_info;

    protected void Page_Load(object sender, EventArgs e)
    {
        MyLog.v("page_load");

        if (checkSessionUser())
        {
            
            LoginButton.Text = "user_center";
            LoginButton.Target = "_blank";
            Username.InnerText = session_username + "，Welcome~";
            
            //LoginButton.NavigateUrl = "user_center.aspx?UserName=" + session_username;

            RegisterButton.Text = "logout";
            RegisterButton.Target = "_blank";
            RegisterButton.NavigateUrl = "Default2.aspx";

        }
        else
        {
            Username.InnerText = "you are tourist~";
            LoginButton.Text = "login";
            RegisterButton.Text = "register";
        }
    }

    protected bool checkSessionUser()
    {

        MyLog.v("checkSessionUser");
        if (Session["UserName"] == null || Session["UserName"].ToString().Length == 0)
        {
            Session["UserName"] = "Guest";
            session_username = "Guest";
            return false;
        }

        session_username = Session["UserName"].ToString();
        MyLog.v(Session["UserName"].ToString());


        ds = SqlData.getInstance().datasetExecute("select * from users where name='" + session_username + "'", "users");

        if (ds.DataSet.Tables["users"] == null || ds.DataSet.Tables["users"].Rows.Count == 0)
        {
            Session["UserName"] = "Guest";
            session_username = "Guest";
            return false;
        }

        user_info = new Users(ds.Rows[0]);
        return true;
    }

    /*
    protected void Button1_Click(object sender, EventArgs e)
    {
        string userName = EmailBox.Value.Trim();
        string sqlstr = "select * from user_info where name='" + userName + "'";
        DataTable ds = SqlData.getInstance().datasetExecute(sqlstr, "users");
        int id = SqlData.getMaxId("users");
       
        if (ds.DataSet.Tables["users"] != null
            && ds.DataSet.Tables["users"].Rows.Count != 0)
        {
            //ScriptManager.RegisterStartupScript(this.Form, this.GetType(), "", "alert('用户名已存在，请重新输入')", true);
            Response.Write("<script>alert('用户名已存在，请重新输入!')</script>");
            Server.Transfer("Register.aspx");
            //Response.Redirect("Register.aspx");
        }


        string passWord = PasswordBox1.Value.Trim();
        if (passWord.Length == 0)
        {
            Response.Write("<script>alert('密码不能为空，请重新输入!')</script>");
            Server.Transfer("Register.aspx");
        }

        string IssueDate = DateTime.Now.ToLocalTime().ToString();

        id = id + 1;
        sqlstr = "INSERT INTO users VALUES ('" + id + "', '" + userName + "', '" + passWord + "', '" + IssueDate + "',  '1')";

        SqlData.getInstance().ExecuteSQL(sqlstr);
        

        Session["UserName"] = userName;

        Response.Redirect("Index.aspx");
    }
    */
    protected void BtnLogin_Click(object sender, EventArgs e)
    {
            string eMail = EmailBox1.Value.Trim();
            string password = PasswordBox1.Value.Trim();
            MyLog.v("eMai :" + eMail + " password : " + password);
    

            if (eMail.Length == 0)
            {
                ScriptManager.RegisterStartupScript(EmailBox1, this.GetType(), "", "alert('请输入用户名!')", true);
            }
            else if (password.Length == 0)
            {
                ScriptManager.RegisterStartupScript(PasswordBox1, this.GetType(), "", "alert('请输入密码!')", true);
            }
            else
            {
                string sqlstring = "select * from users where email='" + eMail + "' and passWord='" + password + "'";
                DataTable ds = SqlData.getInstance().datasetExecute(sqlstring, "users");

                if (ds.DataSet.Tables["users"] == null || ds.DataSet.Tables["users"].Rows.Count == 0)
                {
                if (ds.DataSet.Tables["users"] == null)
                {
                    MyLog.v("null");
                }
                else {
                    MyLog.v("row.count == 0");
                }
                    ScriptManager.RegisterStartupScript(EmailBox1, this.GetType(), "", "alert('输入的姓名或密码错误误！请重新输入')", true);
                }
                else
                {
                    user_info = new Users(ds.Rows[0]);
                    Session["UserName"] = user_info.name;
                    MyLog.v("login success"+ Session["UserName"]);
                    Response.Redirect("Reload.aspx");
                }
            }
        }
   
}
