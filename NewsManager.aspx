<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewsManager.aspx.cs" Inherits="NewsManager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSourceNews">
            <HeaderTemplate>
                <table style="width:100%; color:white; font-weight:700; font-size: 18px;" border="0">
                    <tr style="background-color: black; height: 35px">
                        <th style="width:5%;">ID</th>
                        <th style="width:5%;">电影</th>
                        <th style="width:20%">标题</th>
                        <th style="width:40%">内容</th>
                        <th style="width:20%">链接</th>
                        <th style="width:5%">编辑</th>
                        <th style="width:5%">删除</th>
                    </tr>
                </table>
            </HeaderTemplate>

            <ItemTemplate>
                <table style="width: 100%; color: black; border-collapse: collapse; font-family:'Times New Roman', Times, serif;" border="0">
                    <tr style="height: 35px">
                        <td style="width: 5%; text-align: center"><%# Eval("id") %></td>
                        <td style="width: 5%; text-align: center"><%# Eval("movie_id") %></td>
                        <td style="width: 20%; text-align: left"><%# Eval("title") %></td>
                        <td style="width: 40%; text-align: left"><%# Eval("content") %></td>
                        <td style="width: 20%; text-align: left"><%# Eval("url") %></td>
                        <td style="width: 5%; text-align: center"><a href="<%# Eval("id", "NewsEdit.aspx?id={0}") %>">编辑</a></td>
                        <td style="width: 5%; text-align: center">
                            <asp:LinkButton ID="LinkButton2" runat="server" OnCommand="LinkButton2_Command" CommandName='<%# Eval("id") %>'>删除</asp:LinkButton></td>
                    </tr>

                </table>

            </ItemTemplate>
        </asp:Repeater>
        <asp:SqlDataSource ID="SqlDataSourceNews" runat="server" ConnectionString="<%$ ConnectionStrings:movie %>" SelectCommand="SELECT * FROM [news]"></asp:SqlDataSource>
    </form>
</body>
</html>
