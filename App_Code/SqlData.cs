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

    public SqlData()
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
            con.Close();
        }
    }

    public DataSet datesetExecute(string str, string tableName)
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
}