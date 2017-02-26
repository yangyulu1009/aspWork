﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Constants
/// </summary>
public class Constants
{
    public static String DB_CONN_STR = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["movie"].ConnectionString;

    public static String SESSION_USERNAME = "userName";
    public static String SESSION_USERID = "userId";

    public static String MOVIE = "movie";

    public static String IMAGE_UPLOAD_ROOT = "images/upload/";

    public static char[] SEPS = new char[] { ' ', ',', ';', ':'};

    public static char[] SEPS_WITHNO_SPACE = new char[] { ',', ';', ':' };


    public static String[] IMAGE_DESC =
    {
        "首页电影图标",
        "电影剧照1",
        "电影剧照2",
        "电影剧照3",
        "电影剧照4"
    };

    public static String[] VIDEO_DESC =
    {
        "电影正片",
        "相关视频1",
        "相关视频2",
        "相关视频3",
        "相关视频4"
    };

    /*
     *
     * 
     * 2. 图片弄小点，news的时间不能编辑，news内容过长截断
     * 3. 评论管理，评论添加
     * 4. 个人中心各种信息可修改，邮箱除外，还有参与评论的电影列表，如果是管理员的话在个人中心显示到后台管理的入口
     * 5. 头像最好能上传
     * 6. 分类页
     * 
     * 1.电影简介，不可编辑态，点编辑
     * 2.图片管理，表格，第一列图片，图片地址，编辑
     * 3.视频
     * 4.相关新闻
     * 5.票房
     * 6.评论
     */
}