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
                   <asp:GridView ID="GridView1" runat="server">

                       <Columns>
                           <asp:TemplateField HeaderText="ID"></asp:TemplateField>
                           <asp:TemplateField HeaderText="人名"></asp:TemplateField>
                           <asp:HyperLinkField Text="编辑" />
                           <asp:HyperLinkField Text="删除" />
                       </Columns>

                   </asp:GridView>
                
            </ContentTemplate>

             

        </asp:UpdatePanel>

                  


        
    </div>
    </form>
</body>
</html>
