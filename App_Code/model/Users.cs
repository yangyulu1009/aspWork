using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for User
/// </summary>
public class Users
{

    public String id;
    public String name;
    public String head;
    public String level;
    public String password;
    public String regtime;
    public String email;

    public static Users get(String id)
    {
        DataTable table = SqlData.getInstance().datasetExecute("select * from users where id=" + id, "users");
        Users user = new Users(table.Rows[0]);
        return user;
    }

    public static void updatePwd(String userId, String pwd)
    {
        if (pwd.Length > 0)
        {
            String sql = String.Format("update users set password='{0:s}' where id='{1:s}'", pwd, userId);
            SqlData.getInstance().ExecuteSQL(sql);
        }
    }

    public static Boolean checkPwd(String userId, String pwd)
    {
        Users user = Users.get(userId);
        return user.password.Equals(pwd);
    }

    public static Users getByName(String name)
    {
        String sql = String.Format("select * from users where name='{0:s}'", name);
        DataTable table = SqlData.getInstance().datasetExecute(sql, "users");
        return new Users(table.Rows[0]);
    }

    public static void updateHead(String userId, String url)
    {
        String sql = String.Format("update users set head='{0:s}' where id='{1:s}'", url, userId);
        SqlData.getInstance().ExecuteSQL(sql);
    }

    public static bool exist(String key, String value)
    {
        String sql = String.Format("select id from users where {0:s}='{1:s}'", key, value);
        DataTable table = SqlData.getInstance().datasetExecute(sql, "users");
        Boolean exist = table.Rows.Count > 0;
        MyLog.v(String.Format("{0:s}: {1:s} {2:s}", key, value, exist ? "exist" : "not exist"));
        return exist;
    }

    public static bool existName(String name)
    {
        return exist("name", name);
    }

    public static bool existEmail(String email)
    {
        return exist("email", email);
    }

    public Users()
    {

    }

    public Users(DataRow row)
    {
        //
        // TODO: Add constructor logic here
        //
        id = row["id"].ToString();
        name = row["name"].ToString();
        head = row["head"].ToString();
        level = row["level"].ToString();
        password = row["password"].ToString();
        regtime = row["regtime"].ToString();
        email = row["email"].ToString();
    }

    public static String register(String name, String pwd, String email)
    {
        int id = SqlData.getInstance().getMaxId("users") + 1;
        String regTime = DateTime.Now.ToLocalTime().ToString();
        String sqlstr = "INSERT INTO users (id,name,password,regtime,email) VALUES ('" + id + "', '" + name + "', '" + pwd + "', '" + regTime + "', '" + email + "')";
        SqlData.getInstance().ExecuteSQL(sqlstr);
        return id + "";
    }

    public static String login(String email, String pwd)
    {
        String sqlStr = String.Format("select * from users where email='{0:s}' and password='{1:s}'", email, pwd);
        DataTable table = SqlData.getInstance().datasetExecute(sqlStr, "users");
        if (table.Rows.Count > 0)
        {
            DataRow row = table.Rows[0];
            Users user = new Users(row);
            return user.id;
        }
        return null;
    }
}