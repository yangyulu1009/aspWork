<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default4.aspx.cs" Inherits="Default4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeader" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <form id="form1" runat="server">

        <asp:ScriptManager runat="server" ID="ScriptManager1">
        </asp:ScriptManager>

        <asp:UpdatePanel runat="server" ID="UpdatePanelRole">

            <ContentTemplate>

                <table style="width:100%">

                    <tr>

                        <td>ID</td>
                        <td>名称</td>
                        <td></td>


                    </tr>

                    <tr>
                        <td></td>


                    </tr>

                </table>


            </ContentTemplate>


        </asp:UpdatePanel>

    </form>


</asp:Content>

