using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Web;

/// <summary>
/// Summary description for NameUtils
/// </summary>
public class NameUtils
{
    public static String get(String fileName)
    {
        int index = fileName.LastIndexOf('.');
        String name = fileName.Substring(0, index) + DateTime.Now.ToString();
        return Hash_MD5_16(name, true) + fileName.Substring(index);
    }

    private static string Hash_MD5_16(string word, bool toUpper = true)
    {
        try
        {
            string sHash = Hash_MD5_32(word).Substring(8, 16);
            return toUpper ? sHash : sHash.ToLower();
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    public static string Hash_MD5_32(string word, bool toUpper = true)
    {
        try
        {
            System.Security.Cryptography.MD5CryptoServiceProvider MD5CSP
                = new System.Security.Cryptography.MD5CryptoServiceProvider();

            byte[] bytValue = System.Text.Encoding.UTF8.GetBytes(word);
            byte[] bytHash = MD5CSP.ComputeHash(bytValue);
            MD5CSP.Clear();

            //根据计算得到的Hash码翻译为MD5码
            string sHash = "", sTemp = "";
            for (int counter = 0; counter < bytHash.Count(); counter++)
            {
                long i = bytHash[counter] / 16;
                if (i > 9)
                {
                    sTemp = ((char)(i - 10 + 0x41)).ToString();
                }
                else
                {
                    sTemp = ((char)(i + 0x30)).ToString();
                }
                i = bytHash[counter] % 16;
                if (i > 9)
                {
                    sTemp += ((char)(i - 10 + 0x41)).ToString();
                }
                else
                {
                    sTemp += ((char)(i + 0x30)).ToString();
                }
                sHash += sTemp;
            }

            //根据大小写规则决定返回的字符串
            return toUpper ? sHash : sHash.ToLower();
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }


}