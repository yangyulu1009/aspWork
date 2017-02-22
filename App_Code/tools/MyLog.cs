using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Class1
/// </summary>
public class MyLog
{

    private static String path = "c:\\mylog.txt";

    private static StreamWriter mWriter = File.CreateText(path);



    public static void v(String msg)
    {
        mWriter.WriteLine(String.Format("{0:s}: {1:s}", System.DateTime.Now.ToString(), msg));
        mWriter.Flush();
    }


}