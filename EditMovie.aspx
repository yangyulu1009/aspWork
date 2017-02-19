<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditMovie.aspx.cs" Inherits="EditMovie" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        
        
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSourceMovie" ForeColor="#333333" GridLines="None" Width="100%">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="ID" ReadOnly="True" SortExpression="id" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>

                <asp:BoundField DataField="name" HeaderText="电影名称" SortExpression="name" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>

                <asp:BoundField DataField="description" HeaderText="剧情简介" SortExpression="description">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>

                <asp:BoundField DataField="year" HeaderText="上映年份" SortExpression="year">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>

                <asp:BoundField DataField="country" HeaderText="国家" SortExpression="country">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>

                <asp:BoundField DataField="star" HeaderText="星级" SortExpression="star">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>

                <asp:BoundField DataField="genre" HeaderText="电影类型" SortExpression="genre">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>

                <asp:BoundField DataField="allsales" HeaderText="总票房" SortExpression="allsales">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>

                <asp:CommandField EditText="编辑" ShowEditButton="True" />
                <asp:CommandField ShowDeleteButton="True" DeleteText="删除" />


            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
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
</body>
</html>
