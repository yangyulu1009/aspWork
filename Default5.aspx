<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default5.aspx.cs" Inherits="Default5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" ID="ScriptManager1">
        </asp:ScriptManager>

        <asp:UpdatePanel ID="UpdatePanelDesc" runat="server" UpdateMode="Conditional">
            <ContentTemplate>

                <table style="width:100%" runat="server">
                    <tr>
                        <td style="width:10%">
                            <asp:Label ID="LabelSelect" runat="server"></asp:Label>
                        </td>
                        <td style="width:50%">
                            <asp:DropDownList runat="server" width="50%" ID="DPLPeople" AutoPostBack="false"></asp:DropDownList>
                        </td>
                       
                        <td style="width:10%">
                            <asp:LinkButton runat="server" ID="ButtonAddRole" OnClick="ButtonAddRole_Click" Text="添加"/>
                        </td>
                    </tr>
                </table>


            </ContentTemplate>
        </asp:UpdatePanel>

         <!--
                                <asp:ListItem Value="one" Text="one" />
                                <asp:ListItem Value="two" Text="two" />
                                <asp:ListItem Value="three" Text="three" />
                                -->
    </form>
</body>
</html>
