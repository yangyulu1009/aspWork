<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MovieManager.aspx.cs" Inherits="MovieManager2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSourceMovie" ForeColor="#333333" GridLines="None" Width="100%">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="ID" SortExpression="id" HeaderStyle-HorizontalAlign="Center" HeaderStyle-CssClass="gridheader" ReadOnly="True" ItemStyle-CssClass="griditem">
<HeaderStyle HorizontalAlign="Center" CssClass="gridheader"></HeaderStyle>

<ItemStyle CssClass="griditem"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="name" HeaderText="电影名称" SortExpression="name"  HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem">
<HeaderStyle CssClass="gridheader"></HeaderStyle>

<ItemStyle CssClass="griditem"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="description" HeaderText="剧情简介" SortExpression="description"  HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem">
<HeaderStyle CssClass="gridheader"></HeaderStyle>

<ItemStyle CssClass="griditem"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="year" HeaderText="上映年份" SortExpression="year"  HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem">
<HeaderStyle CssClass="gridheader"></HeaderStyle>

<ItemStyle CssClass="griditem"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="country" HeaderText="国家" SortExpression="country"  HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem">
<HeaderStyle CssClass="gridheader"></HeaderStyle>

<ItemStyle CssClass="griditem"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="star" HeaderText="星级" SortExpression="star"  HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem">
<HeaderStyle CssClass="gridheader"></HeaderStyle>

<ItemStyle CssClass="griditem"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="genre" HeaderText="电影类型" SortExpression="genre"  HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem">
<HeaderStyle CssClass="gridheader"></HeaderStyle>

<ItemStyle CssClass="griditem"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="allsales" HeaderText="总票房" SortExpression="allsales"  HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem">

<HeaderStyle CssClass="gridheader"></HeaderStyle>

<ItemStyle CssClass="griditem"></ItemStyle>
                    </asp:BoundField>

                    <asp:CommandField EditText="编辑" ShowEditButton="True" CancelText="取消" UpdateText="更新" >
                    <ItemStyle CssClass="gridEdit" />
                    </asp:CommandField>
                    <asp:CommandField ShowDeleteButton="True" DeleteText="删除" >


                    <ItemStyle CssClass="gridEdit" />
                    </asp:CommandField>


                    <asp:HyperLinkField DataNavigateUrlFields="id" DataNavigateUrlFormatString="EditMovie.aspx?id={0}" Text="编辑其它" Target="_blank">
                    <ItemStyle CssClass="gridEdit" />
                    </asp:HyperLinkField>
                </Columns>
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <SortedAscendingCellStyle BackColor="#FDF5AC" />
                <SortedAscendingHeaderStyle BackColor="#4D0000" />
                <SortedDescendingCellStyle BackColor="#FCF6C0" />
                <SortedDescendingHeaderStyle BackColor="#820000" />
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSourceMovie" runat="server" ConnectionString="<%$ ConnectionStrings:movie %>" 
                SelectCommand="SELECT movie.* FROM movie"
                DeleteCommand="DELETE FROM movie WHERE (id = @id)"
                UpdateCommand="Update movie set name=@name, allsales=@allsales, description=@description, genre=@genre, country=@country, star=@star, year=@year WHERE (id=@id)"
                ></asp:SqlDataSource>

        </form>

</asp:Content>

