using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (imageUpload.HasFile)
        {
            String fileName = NameUtils.get(imageUpload.FileName);

            string savePath = Server.MapPath(Constants.IMAGE_UPLOAD_ROOT);
                                                         
            if (!System.IO.Directory.Exists(savePath))
            {
                System.IO.Directory.CreateDirectory(savePath);
            }
          
            savePath = savePath + fileName;
            MyLog.v(savePath);
            imageUpload.SaveAs(savePath);
        
            Image1.ImageUrl = Constants.IMAGE_UPLOAD_ROOT + fileName;
  
        } 
        
    }

}