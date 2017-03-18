<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PeopleManager.aspx.cs" Inherits="PeopleManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeader" runat="Server">
    <style>

        .add-people-btn {
            width: 128px;
            height: 46px;
            margin: 20px 35px 0 0;
        }

        .edit-center {
            text-align:center;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <form id="form1" runat="server">

        <asp:ScriptManager runat="server" ID="ScriptManager1">
        </asp:ScriptManager>

        <asp:UpdatePanel runat="server" ID="UpdatePanel1">


            <ContentTemplate>

                <asp:GridView runat="server" ID="GridViewPeople" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSourcePeople" OnRowDeleting="GridViewPeople_RowDeleting" OnRowDeleted="GridViewPeople_RowDeleted">


                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="ID" ReadOnly="True" SortExpression="id" ItemStyle-Width="5%" />
                    
                        <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" ItemStyle-Width="30%"/>
                        <asp:TemplateField HeaderText="Url" SortExpression="url" ItemStyle-Width="55%">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("url") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:HyperLink ID="Label1" runat="server" Text='<%# Bind("url") %>' NavigateUrl='<%# Bind("url") %>' Target="_blank"></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField CancelText="Cancel" DeleteText="Delete" EditText="Edit" NewText="Add" 
                            ShowDeleteButton="True" ShowEditButton="True" UpdateText="Update" ItemStyle-Width="10%" ItemStyle-CssClass="edit-center">
                        <ItemStyle Width="10%"/>
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

                <table runat="server" style="width:100%" id="Table1">
                    <tr>
                        <td style="width:5%">
                            <asp:Label runat="server" ID="LabelPeopleId" Text="<%# People.getNewId() %>" />
                        </td>
                        <td style="width:30%">
                            <asp:TextBox runat="server" ID="TextBoxName"  Width="70%"/>
                        </td>
                        <td style="width:55%">
                            <asp:TextBox runat="server" ID="TextBoxUrl"  Width="100%" />
                        </td>
                        <td style="width:10%;text-align:center">
                            <asp:LinkButton runat="server" ID="LinkButtonAdd"  OnClick="LinkButtonAdd_Click" Text="添加"/>
                        </td>
                    </tr>

                </table>


            </ContentTemplate>


        </asp:UpdatePanel>

    </form>

</asp:Content>

