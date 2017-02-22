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
        cmd = new SqlCommand(str, con);

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
            SqlDataReader sdr = cmd.ExecuteReader();
            return sdr;
        }

        finally
        {
            con.Close();
        }
    }

    public static int getMaxId(string tablename)
    {
        SqlDataReader reader = SqlData.getInstance().ExecuteRead("select max(id) from " + tablename);
        reader.Read();
        int id = int.Parse(reader[0].ToString());
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
}