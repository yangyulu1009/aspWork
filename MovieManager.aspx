<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MovieManager.aspx.cs" Inherits="MovieManager" %>

<asp:Content ID="Header1" ContentPlaceHolderID="ContentPlaceHolderHeader" runat="server">
    <style>
        .addbtn {
            float: right;
            width: 100px;
            height: 28px;
            position: relative;
            top: 9px;
            right: 2px;
        }

        .gridheader {
            text-align: center;
            height: 40px;
            font-family: 'Microsoft YaHei';
            font-weight: normal;
        }

        .griditem {
            text-align: center;
            height: 40px;
            font-family: 'Microsoft YaHei';
            font-weight: normal;
        }

        .gridEdit {
            text-align: center;
            width: 5%;
        }
    </style>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="form1" runat="server">

        <asp:ScriptManager runat="server" ID="ScriptManager1">
        </asp:ScriptManager>

        <asp:UpdatePanel runat="server" ID="UpdatePanel1">

            <ContentTemplate>
                <h1 style="float: left; padding: 5px;">Movies</h1>
                


                <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSourceMovie" Width="100%" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" OnRowDeleting="GridView1_RowDeleting">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="ID" SortExpression="id" HeaderStyle-HorizontalAlign="Center" HeaderStyle-CssClass="gridheader" ReadOnly="True" ItemStyle-CssClass="griditem" ItemStyle-Width="5%">
                            <HeaderStyle HorizontalAlign="Center" CssClass="gridheader"></HeaderStyle>

                            <ItemStyle CssClass="griditem"></ItemStyle>
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Movie Title" SortExpression="name">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBoxMovieName" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:HyperLink ID="LinkMovieName" runat="server" Text='<%# Bind("name") %>' NavigateUrl='<%# getSingleMovieUrl(Eval("id").ToString()) %>' Target="_blank"></asp:HyperLink>
                            </ItemTemplate>
                            <HeaderStyle CssClass="gridheader" />
                            <ItemStyle CssClass="griditem" />
                        </asp:TemplateField>



                        <asp:BoundField DataField="year" HeaderText="Year" SortExpression="year" HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem">
                            <HeaderStyle CssClass="gridheader"></HeaderStyle>

                            <ItemStyle CssClass="griditem"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="country" HeaderText="Country" SortExpression="country" HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem" >
                            <HeaderStyle CssClass="gridheader"></HeaderStyle>

                            <ItemStyle CssClass="griditem"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="star" HeaderText="Rating" SortExpression="star" HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem" >
                            <HeaderStyle CssClass="gridheader"></HeaderStyle>

                            <ItemStyle CssClass="griditem"></ItemStyle>
                        </asp:BoundField>




                        <asp:BoundField DataField="allsales" HeaderText="Total Sales" HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem">
                            <HeaderStyle CssClass="gridheader"></HeaderStyle>

                            <ItemStyle CssClass="griditem"></ItemStyle>
                        </asp:BoundField>


                        <asp:TemplateField HeaderText="Genre" HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("genre") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("genre") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle CssClass="gridheader" />
                            <ItemStyle CssClass="griditem" />
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Key Words" HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBoxKeywords" runat="server" Text='<%# Bind("keywords") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="LabelKeywords" runat="server" Text='<%# Bind("keywords") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle CssClass="gridheader" />
                            <ItemStyle CssClass="griditem" />
                        </asp:TemplateField>



                        <asp:CommandField EditText="Edit" ItemStyle-CssClass="griditem" ShowEditButton="True" CancelText="Cancel" UpdateText="Update" InsertText="Add" NewText="Add" HeaderStyle-CssClass="gridheader" ItemStyle-Width="10%" DeleteText="Delete" ShowDeleteButton="True">
                            <HeaderStyle CssClass="gridheader" />
                            <ItemStyle />
                        </asp:CommandField>


                        <asp:HyperLinkField DataNavigateUrlFields="id" DataNavigateUrlFormatString="EditMovie.aspx?id={0}" Text="Edit Detail" Target="_blank" ItemStyle-Width="10%">
                            <ItemStyle CssClass="gridEdit" />
                        </asp:HyperLinkField>

                    </Columns>
                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" ForeColor="#330099" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                    <SortedAscendingCellStyle BackColor="#FEFCEB" />
                    <SortedAscendingHeaderStyle BackColor="#AF0101" />
                    <SortedDescendingCellStyle BackColor="#F6F0C0" />
                    <SortedDescendingHeaderStyle BackColor="#7E0000" />
                </asp:GridView>

                <asp:Button runat="server" ID="btnAdd" OnClick="btnAdd_Click" Text="Add Movie" CssClass="addbtn" />

                <asp:SqlDataSource ID="SqlDataSourceMovie" runat="server" ConnectionString="<%$ ConnectionStrings:movie %>"
                    SelectCommand="SELECT * FROM [movie]"
                    DeleteCommand="DELETE FROM [movie] WHERE [id] = @id"
                    UpdateCommand="UPDATE [movie] SET [name] = @name, [allsales] = @allsales, [description] = @description, [country] = @country, [star] = @star, [year] = @year, [keywords] = @keywords, [genre] = @genre WHERE [id] = @id" 
                    InsertCommand="INSERT INTO [movie] ([id], [name], [allsales], [description], [country], [star], [year], [keywords], [genre]) VALUES (@id, @name, @allsales, @description, @country, @star, @year, @keywords, @genre)">
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="allsales" Type="String" />
                        <asp:Parameter Name="description" Type="String" />
                        <asp:Parameter Name="country" Type="String" />
                        <asp:Parameter Name="star" Type="Double" />
                        <asp:Parameter Name="year" Type="Int32" />
                        <asp:Parameter Name="keywords" Type="String" />
                        <asp:Parameter Name="genre" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="allsales" Type="String" />
                        <asp:Parameter Name="description" Type="String" />
                        <asp:Parameter Name="country" Type="String" />
                        <asp:Parameter Name="star" Type="Double" />
                        <asp:Parameter Name="year" Type="Int32" />
                        <asp:Parameter Name="keywords" Type="String" />
                        <asp:Parameter Name="genre" Type="String" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>

            </ContentTemplate>
        </asp:UpdatePanel>



    </form>

</asp:Content>

