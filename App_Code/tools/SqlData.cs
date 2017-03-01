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
            MyLog.v("datasetExecute: " + str);
            da.Fill(ds, tableName);
            return ds.Tables[tableName];
        }
        finally
        {
            con.Close();
        }
    }

    public SqlDataReader ExecuteRead(string str)
    {
        try
        {
            cmd = new SqlCommand(str, con);
            cmd.CommandTimeout = 600;
            SqlDataReader sdr = cmd.ExecuteReader();
            return sdr;
        }

        finally
        {
         //   con.Close();
        }
    }


    public int getMaxId(string tablename)
    {
        SqlDataReader reader = SqlData.getInstance().ExecuteRead("select max(id) from " + tablename);

        int id = 0;
        if (reader.Read())
        {
            id = int.Parse(reader[0].ToString());
        }
        
        reader.Close();
        return id;
    }
    /*
    public DataSet ExecuteDateSet(string str)
    {
        try
        {
            cmd = new SqlCommand(str, con);
            da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
        finally
        {
        //    con.Close();
        }
    }*/

    public void update(String tableName, String id, String colName, String value)
    {
        String str = String.Format("update {0:s} set {1:s}='{2:s}' where id={3:s}", tableName, colName, value, id);
        MyLog.v(str);
        ExecuteSQL(str);
    }
}