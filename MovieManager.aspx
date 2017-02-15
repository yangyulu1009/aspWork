<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MovieManager.aspx.cs" Inherits="NewsManager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="font-family: 'Microsoft YaHei'">
    <form id="form1" runat="server">
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSourceNews">
            <HeaderTemplate>
                <p style="font-size:30px; margin: 0px; padding: 0px; ">News</p>
                <table style="width:100%; color:white; font-weight:700; font-size: 18px;" border="0">
                    <tr style="background-color: black; height: 35px">
                        <th style="width:5%;">ID</th>
                        <th style="width:15%;">电影</th>
                        <th style="width:15%">标题</th>
                        <th style="width:35%">内容</th>
                        <th style="width:20%">链接</th>
                        <th style="width:5%">编辑</th>
                        <th style="width:5%">删除</th>
                    </tr>
                </table>
            </HeaderTemplate>

           
            <ItemTemplate>
                <table style="width: 100%; color: black; border-collapse: collapse;" border="0">
                    <tr style="height: 35px">
                        <td style="width: 5%; text-align: center"><%# Eval("id") %></td>
                        <td style="width: 15%; text-align: left"><%# getMovieName(Eval("id").ToString()) %></td>
                        <td style="width: 15%; text-align: left"><%# Eval("title") %></td>
                        <td style="width: 35%; text-align: left"><%# Eval("content") %></td>
                        <td style="width: 20%; text-align: left"><%# Eval("url") %></td>
                        <td style="width: 5%; text-align: center"><a target="_blank" href="<%# Eval("id", "EditNews.aspx?id={0}") %>">编辑</a></td>
                        <td style="width: 5%; text-align: center">
                            <asp:LinkButton ID="LinkButton2" runat="server" OnCommand="LinkButton1_Command" CommandName='<%# Eval("id") %>'>删除</asp:LinkButton></td>
                    </tr>

                </table>

            </ItemTemplate>
        </asp:Repeater>
        <asp:SqlDataSource ID="SqlDataSourceNews" runat="server" ConnectionString="<%$ ConnectionStrings:movie %>" SelectCommand="SELECT * FROM [news]"></asp:SqlDataSource>

        <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSourcePeople">
            <HeaderTemplate>
                <p style="font-size:30px; margin: 0px; padding: 0px; margin-top: 50px;">People</p>
                <table style="width:100%; color:white; font-weight:700; font-size: 18px;" border="0">
                    <tr style="background-color: black; height: 35px">
                        <th style="width:5%;">ID</th>
                        <th style="width:20%;">名字</th>
                        <th style="width:65%">链接</th>
                        <th style="width:5%">编辑</th>
                        <th style="width:5%">删除</th>
                    </tr>
                </table>
            </HeaderTemplate>

            <ItemTemplate>
                <table style="width: 100%; color: black; border-collapse: collapse;" border="0">
                    <tr style="height: 35px">
                        <td style="width: 5%; text-align: center"><%# Eval("id") %></td>
                        <td style="width: 20%; text-align: center"><%# Eval("name") %></td>
                        <td style="width: 65%; text-align: left"><%# Eval("url") %></td>
                        <td style="width: 5%; text-align: center"><a target="_blank" href="<%# Eval("id", "EditPeople.aspx?id={0}") %>">编辑</a></td>
                        <td style="width: 5%; text-align: center">
                            <asp:LinkButton ID="LinkButton2" runat="server" OnCommand="LinkButton2_Command" CommandName='<%# Eval("id") %>'>删除</asp:LinkButton></td>
                    </tr>

                </table>

            </ItemTemplate>
        </asp:Repeater>
        <asp:SqlDataSource ID="SqlDataSourcePeople" runat="server" ConnectionString="<%$ ConnectionStrings:movie %>" SelectCommand="SELECT * FROM [people]"></asp:SqlDataSource>


        <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSourceResponses">
            <HeaderTemplate>
                <p style="font-size:30px; margin: 0px; padding: 0px; margin-top: 50px;">Responses</p>
                <table style="width:100%; color:white; font-weight:700; font-size: 18px;" border="0">
                    <tr style="background-color: black; height: 35px">
                        <th style="width:5%;">ID</th>
                        <th style="width:20%;">电影</th>
                        <th style="width:15%">用户</th>
                        <th style="width:40%">评论</th>
                        <th style="width:10%">时间</th>
                        <th style="width:5%">编辑</th>
                        <th style="width:5%">删除</th>
                    </tr>
                </table>
            </HeaderTemplate>

            <ItemTemplate>
                <table style="width: 100%; color: black; border-collapse: collapse;" border="0">
                    <tr style="height: 35px">
                        <td style="width: 5%; text-align: center"><%# Eval("id") %></td>
                        <td style="width: 20%; text-align: center"><%# getMovieName(Eval("movie_id").ToString()) %></td>
                        <td style="width: 15%; text-align: center"><%# getUserName(Eval("user_id").ToString()) %></td>
                        <td style="width: 40%; text-align: center"><%# Eval("comment") %></td>
                        <td style="width: 10%; text-align: left"><%# Eval("reply_time") %></td>
                        <td style="width: 5%; text-align: center"><a target="_blank" href="<%# Eval("id", "EditResponses.aspx?id={0}") %>">编辑</a></td>
                        <td style="width: 5%; text-align: center">
                            <asp:LinkButton ID="LinkButton2" runat="server" OnCommand="LinkButton3_Command" CommandName='<%# Eval("id") %>'>删除</asp:LinkButton></td>
                    </tr>

                </table>

            </ItemTemplate>
        </asp:Repeater>
        <asp:SqlDataSource ID="SqlDataSourceResponses" runat="server" ConnectionString="<%$ ConnectionStrings:movie %>" SelectCommand="SELECT * FROM [responses]"></asp:SqlDataSource>


        <asp:Repeater ID="Repeater4" runat="server" DataSourceID="SqlDataSourceResponses">
            <HeaderTemplate>
                <p style="font-size:30px; margin: 0px; padding: 0px; margin-top: 50px;">Roles</p>
                <table style="width:100%; color:white; font-weight:700; font-size: 18px;" border="0">
                    <tr style="background-color: black; height: 35px">
                        <th style="width:5%;">ID</th>
                        <th style="width:25%;">电影</th>
                        <th style="width:20%">人名</th>
                        <th style="width:40%">角色</th>
                        <th style="width:5%">编辑</th>
                        <th style="width:5%">删除</th>
                    </tr>
                </table>
            </HeaderTemplate>

            <ItemTemplate>
                <table style="width: 100%; color: black; border-collapse: collapse;" border="0">
                    <tr style="height: 35px">
                        <td style="width: 5%; text-align: center"><%# Eval("id") %></td>
                        <td style="width: 25%; text-align: center"><%# getMovieName(Eval("movie_id").ToString()) %></td>
                        <td style="width: 20%; text-align: center"><%# getUserName(Eval("people_id").ToString()) %></td>
                        <td style="width: 40%; text-align: center"><%# Eval("role") %></td>
                        <td style="width: 5%; text-align: center"><a target="_blank" href="<%# Eval("id", "EditResponses.aspx?id={0}") %>">编辑</a></td>
                        <td style="width: 5%; text-align: center">
                            <asp:LinkButton ID="LinkButton2" runat="server" OnCommand="LinkButton4_Command" CommandName='<%# Eval("id") %>'>删除</asp:LinkButton></td>
                    </tr>

                </table>

            </ItemTemplate>
        </asp:Repeater>
        <asp:SqlDataSource ID="SqlDataSourceRole" runat="server" ConnectionString="<%$ ConnectionStrings:movie %>" SelectCommand="SELECT * FROM [role]"></asp:SqlDataSource>
    </form>
</body>
</html>
