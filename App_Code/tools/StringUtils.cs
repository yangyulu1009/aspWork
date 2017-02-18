using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for StringUtils
/// </summary>
public class StringUtils
{
    public StringUtils()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static String join(List<String> strs)
    {
        return join(strs, " ");
    }

    public static String join(List<String> strs, String sep)
    {
        String text = "";
        if (strs == null || strs.Count == 0)
        {
            return text;
        }
        foreach (String s in strs)
        {
            text = text.Trim() + sep + s;
        }
        return text.Trim();
    }
}