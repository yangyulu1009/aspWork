using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for SqlData
/// </summary>
public class SqlData
{
    private SqlConnection con;
    private SqlCommand cmd;
    private SqlDataAdapter da;

    private static SqlData sInstance;

    public static SqlData getInstance()
    {
        return new SqlData();
    }

    private SqlData()
    {
        con = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["movie"].ConnectionString);
        con.Open();
    }

    public bool ExecuteSQL(string str)
    {
        MyLog.v(str);

        cmd = new SqlCommand(str, con);
        cmd.CommandTimeout = 600;

        try
        {
            cmd.ExecuteNonQuery();
            return true;
        }

        finally
        {
            con.Close();
        }
    }

    public DataTable datasetExecute(string str, string tableName)
    {
        try
        {
            SqlDataAdapter da = new SqlDataAdapter(str, con);
            DataSet ds = new DataSet();
         //   MyLog.v("datasetExecute: " + str);
            da.Fill(ds, tableName);
            return ds.Tables[tableName];
        }
        finally
        {
            con.Close();
        }
    }

    public DataSet getDataSource(string str, string tableName)
    {
        try
        {
            SqlDataAdapter da = new SqlDataAdapter(str, con);
            DataSet ds = new DataSet();
            da.Fill(ds, tableName);
            return ds;
        }
        finally
        {
            con.Close();
        }
    }

    public int getMaxId(string tablename)
    {
        DataTable table = datasetExecute("select max(id) from " + tablename, tablename);
        if (table.Rows.Count == 0)
        {
            return 0;
        }
        String id = table.Rows[0][0].ToString();
        return id.Length > 0 ? int.Parse(id) : 0;
    }

    public int getCount(String sql, string tablename)
    {
        DataTable table = datasetExecute(sql, tablename);
        if (table.Rows.Count == 0)
        {
            return 0;
        }
        String value = table.Rows[0][0].ToString();
        return value.Length > 0 ? int.Parse(value) : 0;
    }

    public void update(String tableName, String id, String colName, String value)
    {
        String str = String.Format("update {0:s} set {1:s}='{2:s}' where id={3:s}", tableName, colName, value, id);
        MyLog.v(str);
        ExecuteSQL(str);
    }
}