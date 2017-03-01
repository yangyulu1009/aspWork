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
                <h1 style="float: left; padding: 5px;">电影</h1>
                <asp:Button runat="server" ID="btnAdd" OnClick="btnAdd_Click" Text="添加电影" CssClass="addbtn" />


                <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSourceMovie" Width="100%" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="ID" SortExpression="id" HeaderStyle-HorizontalAlign="Center" HeaderStyle-CssClass="gridheader" ReadOnly="True" ItemStyle-CssClass="griditem" ItemStyle-Width="5%">
                            <HeaderStyle HorizontalAlign="Center" CssClass="gridheader"></HeaderStyle>

                            <ItemStyle CssClass="griditem"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="name" HeaderText="电影名称" SortExpression="name" HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem">
                            <HeaderStyle CssClass="gridheader"></HeaderStyle>

                            <ItemStyle CssClass="griditem"></ItemStyle>
                        </asp:BoundField>



                        <asp:BoundField DataField="year" HeaderText="年份" SortExpression="year" HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem" ItemStyle-Width="5%">
                            <HeaderStyle CssClass="gridheader"></HeaderStyle>

                            <ItemStyle CssClass="griditem"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="country" HeaderText="国家" SortExpression="country" HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem" ItemStyle-Width="5%">
                            <HeaderStyle CssClass="gridheader"></HeaderStyle>

                            <ItemStyle CssClass="griditem"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="star" HeaderText="星级" SortExpression="star" HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem" ItemStyle-Width="5%">
                            <HeaderStyle CssClass="gridheader"></HeaderStyle>

                            <ItemStyle CssClass="griditem"></ItemStyle>
                        </asp:BoundField>




                        <asp:BoundField DataField="allsales" HeaderText="票房" HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem" ItemStyle-Width="5%">
                            <HeaderStyle CssClass="gridheader"></HeaderStyle>

                            <ItemStyle CssClass="griditem"></ItemStyle>
                        </asp:BoundField>


                        <asp:TemplateField HeaderText="类型" HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem" ItemStyle-Width="5%">
                            <ItemTemplate>
                                <%# getGenres(Container.DataItem) %>
                            </ItemTemplate>

                            <EditItemTemplate>
                                <asp:TextBox runat="server" ID="TextBoxGenres" Text="<%# getGenres(Container.DataItem) %>" />
                            </EditItemTemplate>

                            <HeaderStyle CssClass="gridheader"></HeaderStyle>

                            <ItemStyle CssClass="griditem"></ItemStyle>
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="关键词" HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem" ItemStyle-Width="10%">
                            <ItemTemplate>
                                <%# getKeywords(Container.DataItem) %>
                            </ItemTemplate>

                            <EditItemTemplate>
                                <asp:TextBox runat="server" ID="TextBoxKeys" Text="<%# getKeywords(Container.DataItem) %>" />
                            </EditItemTemplate>
                            <HeaderStyle CssClass="gridheader" />
                            <ItemStyle CssClass="griditem" />
                        </asp:TemplateField>



                        <asp:CommandField EditText="编辑" ItemStyle-CssClass="griditem" ShowEditButton="True" CancelText="取消" UpdateText="更新" InsertText="添加" NewText="添加" HeaderStyle-CssClass="gridheader" ItemStyle-Width="10%" DeleteText="删除" ShowDeleteButton="True">
                            <HeaderStyle CssClass="gridheader" />
                            <ItemStyle />
                        </asp:CommandField>


                        <asp:HyperLinkField DataNavigateUrlFields="id" DataNavigateUrlFormatString="EditMovie.aspx?id={0}" Text="编辑其它" Target="_blank">
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

                <asp:SqlDataSource ID="SqlDataSourceMovie" runat="server" ConnectionString="<%$ ConnectionStrings:movie %>"
                    SelectCommand="SELECT movie.* FROM movie"
                    DeleteCommand="DELETE FROM movie WHERE (id = @id)"
                    UpdateCommand="Update movie set name=@name, allsales=@allsales, country=@country, star=@star, year=@year WHERE (id=@id)"></asp:SqlDataSource>

            </ContentTemplate>
        </asp:UpdatePanel>



    </form>

</asp:Content>

