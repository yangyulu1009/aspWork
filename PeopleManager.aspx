<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PeopleManager.aspx.cs" Inherits="PeopleManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeader" runat="Server">
    <style>

        .add-people-btn {
            width: 128px;
            height: 46px;
            margin: 20px 35px 0 0;
        }


    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <form id="form1" runat="server">

        <asp:ScriptManager runat="server" ID="ScriptManager1">
        </asp:ScriptManager>

        <asp:UpdatePanel runat="server" ID="UpdatePanel1">


            <ContentTemplate>

                <asp:GridView runat="server" ID="GridViewPeople" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSourcePeople">


                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="ID" ReadOnly="True" SortExpression="id" ItemStyle-Width="5%">
                        <ItemStyle Width="5%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="name" HeaderText="名字" SortExpression="name" />
                        <asp:TemplateField HeaderText="链接" SortExpression="url">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("url") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:HyperLink ID="Label1" runat="server" Text='<%# Bind("url") %>' NavigateUrl='<%# Bind("url") %>' Target="_blank"></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField CancelText="取消" DeleteText="删除" EditText="编辑" NewText="添加" ShowDeleteButton="True" ShowEditButton="True" UpdateText="更新" ItemStyle-Width="10%">
                        <ItemStyle Width="10%" />
                        </asp:CommandField>
                    </Columns>


                </asp:GridView>


                <asp:SqlDataSource ID="SqlDataSourcePeople" runat="server" ConnectionString="<%$ ConnectionStrings:movie %>" 
                    DeleteCommand="DELETE FROM [people] WHERE [id] = @id" 
                    InsertCommand="INSERT INTO [people] ([id], [name], [url]) VALUES (@id, @name, @url)" 
                    SelectCommand="SELECT * FROM [people]" 
                    UpdateCommand="UPDATE [people] SET [name] = @name, [url] = @url WHERE [id] = @id">
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="url" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="url" Type="String" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>


                <div style="text-align:right">
                     <asp:Button ID="ButtonAddPeople" runat="server" CssClass="add-people-btn" Text="添加明星" OnClick="ButtonAddPeople_Click"/>
                </div>
               

            </ContentTemplate>


        </asp:UpdatePanel>

    </form>

</asp:Content>

