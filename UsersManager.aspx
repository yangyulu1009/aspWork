<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UsersManager.aspx.cs" Inherits="UsersManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeader" Runat="Server">
    <style>
        .user-head {
            text-align:center;
            width: 50px;
            height: 50px;
            border-radius:25px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">

        <asp:ScriptManager runat="server" ID="ScriptManager1">
        </asp:ScriptManager>

     

                <asp:GridView runat="server" ID="GridViewUser" RowStyle-Height="60px" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSourceUser" OnRowDeleted="GridViewUser_RowDeleted" OnRowUpdated="GridViewUser_RowUpdated" OnRowDataBound="GridViewUser_RowDataBound" OnRowUpdating="GridViewUser_RowUpdating">

                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server"  ImageUrl='<%# getHeadIcon(Container.DataItem) %>' CssClass="user-head"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="name" HeaderText="昵称" SortExpression="name" ReadOnly="true"/>
                        <asp:TemplateField HeaderText="级别" SortExpression="level">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownListLevel" runat="server">
                                    <asp:ListItem Value="0">管理员</asp:ListItem>
                                    <asp:ListItem Value="1">普通用户</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# getLevelName(Container.DataItem) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="regtime" HeaderText="注册时间" SortExpression="regtime"  ReadOnly="true"/>
                        <asp:BoundField DataField="email" HeaderText="邮箱" SortExpression="email"  ReadOnly="true"/>
                        <asp:CommandField CancelText="取消" DeleteText="删除" EditText="编辑" ShowDeleteButton="True" ShowEditButton="True" UpdateText="更新" />
                    </Columns>
                </asp:GridView>


               


                <asp:SqlDataSource ID="SqlDataSourceUser" runat="server" ConnectionString="<%$ ConnectionStrings:movie %>" 
                    DeleteCommand="DELETE FROM [users] WHERE [id] = @id" 
                    InsertCommand="INSERT INTO [users] ([id], [name], [head], [level], [password], [regtime], [email]) VALUES (@id, @name, @head, @level, @password, @regtime, @email)" 
                    SelectCommand="SELECT * FROM [users] ORDER BY [level],[id]"
                     UpdateCommand="UPDATE [users] SET [level] = @level WHERE [id] = -1">
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="head" Type="String" />
                        <asp:Parameter Name="level" Type="Int32" />
                        <asp:Parameter Name="password" Type="String" />
                        <asp:Parameter Name="regtime" Type="DateTime" />
                        <asp:Parameter Name="email" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="head" Type="String" />
                        <asp:Parameter Name="level" Type="Int32" />
                        <asp:Parameter Name="password" Type="String" />
                        <asp:Parameter Name="regtime" Type="DateTime" />
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>


       

    </form>
</asp:Content>

