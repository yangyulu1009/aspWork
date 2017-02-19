<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditMovie.aspx.cs" Inherits="EditMovie" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .gridheader {text-align:center; height:40px;font-family:'Microsoft YaHei';font-weight:normal;}
        .griditem {text-align:center;height: 40px;font-family:'Microsoft YaHei';font-weight:normal;}
        .gridEdit {text-align:center;}
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSourceNews" Width="100%" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="ID" ReadOnly="True" SortExpression="id" HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem" >
<HeaderStyle CssClass="gridheader"></HeaderStyle>

<ItemStyle CssClass="griditem"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="title" HeaderText="新闻标题" SortExpression="title" HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem">
<HeaderStyle CssClass="gridheader"></HeaderStyle>

<ItemStyle CssClass="griditem"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="content" HeaderText="新闻内容" SortExpression="content" HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem">
<HeaderStyle CssClass="gridheader"></HeaderStyle>

<ItemStyle CssClass="griditem"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="url" HeaderText="新闻链接" SortExpression="url" HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem">
<HeaderStyle CssClass="gridheader"></HeaderStyle>

<ItemStyle CssClass="griditem"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="release_date" HeaderText="发布日期" SortExpression="release_date" HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem">
<HeaderStyle CssClass="gridheader"></HeaderStyle>

<ItemStyle CssClass="griditem"></ItemStyle>
                </asp:BoundField>
                <asp:CommandField CancelText="取消" DeleteText="删除" EditText="编辑" ShowDeleteButton="True" ShowEditButton="True" HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem">
<HeaderStyle CssClass="gridheader"></HeaderStyle>

<ItemStyle CssClass="griditem"></ItemStyle>
                </asp:CommandField>
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" ForeColor="#333333" Font-Bold="True" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceNews" runat="server" ConnectionString="<%$ ConnectionStrings:movie %>" SelectCommand="SELECT [id], [title], [content], [url], [release_date] FROM [news] WHERE ([movie_id] = @id) ORDER BY [release_date] DESC, [id] ASC">
            <SelectParameters>
                <asp:QueryStringParameter Name="id" QueryStringField="id" Type="Int32" DefaultValue="1" />
            </SelectParameters>
        </asp:SqlDataSource>

    </form>
</body>
</html>
