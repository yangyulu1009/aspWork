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

    /*
     * 1. 给剧情简介去了，加一列导演和演员，可支持多个，给剧情简介加到edit里，放在最上面
     * 2. 图片弄小点，news的时间不能编辑，news内容过长截断
     * 3. 评论管理
     * 4. 个人中心各种信息可修改，邮箱除外，还有参与评论的电影列表，如果是管理员的话在个人中心显示到后台管理的入口
     * 5. 头像最好能上传
     * 6. 分类页
     */
}