using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Test1 : System.Web.UI.Page
{

    public String mUrl = "http://photocdn.sohu.com/20080701/Img257865734.jpg";

    protected void Page_Load(object sender, EventArgs e)
    {
        Page.DataBind();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        mUrl = "http://ww1.sinaimg.cn/large/4cd09971jw6deiv7z6ukij.jpg";
       
        form1.DataBind();
    }
}