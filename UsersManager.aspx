﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UsersManager.aspx.cs" Inherits="UsersManager" %>

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

     

                <asp:GridView runat="server" ID="GridViewUser" RowStyle-Height="60px" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSourceUser" OnRowDeleted="GridViewUser_RowDeleted" OnRowUpdated="GridViewUser_RowUpdated" OnRowDataBound="GridViewUser_RowDataBound" OnRowUpdating="GridViewUser_RowUpdating" OnRowDeleting="GridViewUser_RowDeleting">

                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server"  ImageUrl='<%# getHeadIcon(Container.DataItem) %>' CssClass="user-head"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" ReadOnly="true"/>
                        <asp:TemplateField HeaderText="Level" SortExpression="level">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownListLevel" runat="server">
                                    <asp:ListItem Value="0">Admin</asp:ListItem>
                                    <asp:ListItem Value="1">Common User</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# getLevelName(Container.DataItem) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="regtime" HeaderText="Register Time" SortExpression="regtime"  ReadOnly="true"/>
                        <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email"  ReadOnly="true"/>
                        <asp:CommandField CancelText="Cancel" DeleteText="Delete" EditText="Edit" ShowDeleteButton="True" ShowEditButton="True" UpdateText="Update" />
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

