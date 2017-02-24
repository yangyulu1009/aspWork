<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeader" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <form id="form1" runat="server">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" OnDataBinding="GridView1_DataBinding" OnRowDataBound="GridView1_RowDataBound">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="movie_id" HeaderText="movie_id" SortExpression="movie_id" />
                <asp:BoundField DataField="url" HeaderText="url" SortExpression="url" />
                <asp:TemplateField HeaderText="temp">
                    <ItemTemplate>
                        <%# getText(Container.DataItem) %>
                    </ItemTemplate>

                    <EditItemTemplate>
                        <asp:TextBox runat="server" Text="how" />
                    </EditItemTemplate>

                </asp:TemplateField>
                <asp:CommandField ShowEditButton="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:movie %>" SelectCommand="SELECT * FROM [image]"></asp:SqlDataSource>
    </form>


</asp:Content>

