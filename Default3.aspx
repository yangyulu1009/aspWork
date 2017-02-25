<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default3.aspx.cs" Inherits="Default3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

       <asp:ScriptManager runat="server" ID="ScriptManager1">
        </asp:ScriptManager>


         <asp:UpdatePanel runat="server" ID="UpdatePanelDesc" UpdateMode="Conditional">
            <ContentTemplate>
                    <asp:ImageButton ID="Image1" runat="server" ImageUrl="images/1.jpg"/>
                 <asp:FileUpload ID="imageUpload" runat="server" Visible="True"/>
                 <asp:Button ID="Button1" runat="server" Text="上传" OnClick="Button1_Click" />
                
            </ContentTemplate>

             <Triggers>
                 <asp:PostBackTrigger ControlID="Button1" />
             </Triggers>

        </asp:UpdatePanel>

                  


        
    </div>
    </form>
</body>
</html>
