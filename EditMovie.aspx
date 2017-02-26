﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EditMovie.aspx.cs" Inherits="EditMovie" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Header1" ContentPlaceHolderID="ContentPlaceHolderHeader" runat="server">
    <style>
        .addbtn {
            float: right;
            width: 100px;
            height: 40px;
            position: relative;
            top: 5px;
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

        table tr td {
            background-color: #ffffff;
        }

        .buttonDesc {
            width: 100px;
            height: 40px;
            margin-top: 10px;
        }

        .tbDesc {
            font-size: 20px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server">

        <asp:ScriptManager runat="server" ID="ScriptManager1">
        </asp:ScriptManager>

        <asp:UpdatePanel ID="UpdatePanelDesc" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <h1 style="padding: 5px;">电影简介</h1>
                <asp:GridView ID="GridViewDesc" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSourceDesc">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="ID" ReadOnly="True" SortExpression="id" HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem" ItemStyle-Width="5%">
                        <HeaderStyle CssClass="gridheader" />
                        <ItemStyle CssClass="griditem" />
                        </asp:BoundField>
                        <asp:BoundField ConvertEmptyStringToNull="False" DataField="name" HeaderText="电影名称" ItemStyle-Width="15%" ReadOnly="True" SortExpression="name" HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem">
                        <HeaderStyle CssClass="gridheader" />
                        <ItemStyle CssClass="griditem" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="电影简介" SortExpression="description" HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("description") %>' TextMode="MultiLine" Width="100%"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("description") %>' Width="100%"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle CssClass="gridheader" />
                            <ItemStyle CssClass="griditem" />
                        </asp:TemplateField>
                        <asp:CommandField CancelText="取消" DeleteText="" EditText="编辑" ShowEditButton="True" UpdateText="更新" ItemStyle-Width="10%" HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem"/>
                    </Columns>


                </asp:GridView>


                <asp:SqlDataSource ID="SqlDataSourceDesc" runat="server" ConnectionString="<%$ ConnectionStrings:movie %>" 
                    DeleteCommand="DELETE FROM [movie] WHERE [id] = @id" 
                    InsertCommand="INSERT INTO [movie] ([id], [name], [description]) VALUES (@id, @name, @description)" 
                    SelectCommand="SELECT [id], [name], [description] FROM [movie] WHERE ([id] = @id)" 
                    UpdateCommand="UPDATE [movie] SET [description] = @description WHERE [id] = @id">
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="description" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:QueryStringParameter DefaultValue="1" Name="id" QueryStringField="id" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="description" Type="String" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>


            </ContentTemplate>

        </asp:UpdatePanel>





        <asp:UpdatePanel ID="UpdatePanelImage" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:GridView ID="GridViewImage" runat="server" AutoGenerateColumns="False" OnDataBinding="GridViewImage_DataBinding" OnRowDataBound="GridViewImage_RowDataBound">



                    <Columns>
                        <asp:ImageField HeaderText="图标">
                        </asp:ImageField>
                        <asp:ImageField HeaderText="海报">
                        </asp:ImageField>
                        <asp:ImageField HeaderText="剧照1">
                        </asp:ImageField>
                        <asp:ImageField HeaderText="剧照2">
                        </asp:ImageField>
                        <asp:ImageField HeaderText="剧照3">
                        </asp:ImageField>
                        <asp:ImageField HeaderText="剧照4">
                        </asp:ImageField>
                        <asp:CommandField CancelText="取消" EditText="编辑" ShowEditButton="True" UpdateText="更新" />
                    </Columns>



                </asp:GridView>

                <asp:SqlDataSource ID="SqlDataSourceImage" runat="server" ConnectionString="<%$ ConnectionStrings:movie %>" DeleteCommand="DELETE FROM [image] WHERE [id] = @id" InsertCommand="INSERT INTO [image] ([id], [url]) VALUES (@id, @url)" SelectCommand="SELECT [id], [url] FROM [image] WHERE ([movie_id] = @movie_id)" UpdateCommand="UPDATE [image] SET [url] = @url WHERE [id] = @id">
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                        <asp:Parameter Name="url" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:QueryStringParameter DefaultValue="1" Name="movie_id" QueryStringField="id" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="url" Type="String" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>

            </ContentTemplate>


        </asp:UpdatePanel>




        <asp:UpdatePanel runat="server" ID="UpdatePanelNews" UpdateMode="Conditional">

            <ContentTemplate>

                <div style="margin-top: 50px">
                    <h1 style="float: left; padding: 5px;">相关新闻</h1>
                    <asp:Button runat="server" ID="addNews" OnClick="btnAddNews_Click" Text="添加新闻" CssClass="addbtn" />
                </div>



                <asp:GridView ID="GridViewNews" runat="server" DataSourceID="SqlDataSourceNews" Width="100%" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem">
                            <HeaderStyle CssClass="gridheader" />
                            <ItemStyle CssClass="griditem" />
                        </asp:BoundField>


                        <asp:TemplateField HeaderText="发布时间" SortExpression="reldate">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("reldate", "{0:yyyy-MM-dd}") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("reldate", "{0:yyyy-MM-dd}") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle CssClass="gridheader" />
                            <ItemStyle CssClass="griditem" />
                        </asp:TemplateField>


                        <asp:BoundField DataField="content" HeaderText="新闻内容" SortExpression="content" HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem">
                            <HeaderStyle CssClass="gridheader" />
                            <ItemStyle CssClass="griditem" />
                        </asp:BoundField>


                        <asp:TemplateField HeaderText="新闻链接" SortExpression="url">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("url") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:HyperLink ID="Link1" runat="server" Text='<%# Bind("url") %>' NavigateUrl='<%# Bind("url") %>' Target="_blank"></asp:HyperLink>
                            </ItemTemplate>
                            <HeaderStyle CssClass="gridheader" />
                            <ItemStyle CssClass="griditem" />
                        </asp:TemplateField>


                        <asp:CommandField CancelText="取消" DeleteText="删除" EditText="编辑" ShowDeleteButton="True" ShowEditButton="True" UpdateText="更新" HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem"></asp:CommandField>
                    </Columns>
                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" ForeColor="#330099" />
                    <SelectedRowStyle BackColor="#FFCC66" ForeColor="#663399" Font-Bold="True" />
                    <SortedAscendingCellStyle BackColor="#FEFCEB" />
                    <SortedAscendingHeaderStyle BackColor="#AF0101" />
                    <SortedDescendingCellStyle BackColor="#F6F0C0" />
                    <SortedDescendingHeaderStyle BackColor="#7E0000" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourceNews" runat="server" ConnectionString="<%$ ConnectionStrings:movie %>"
                    SelectCommand="SELECT news.* FROM [news]"
                    DeleteCommand="DELETE FROM [news] WHERE [id] = @id"
                    UpdateCommand="UPDATE [news] SET [content] = @content, [url] = @url, [reldate] = @reldate WHERE [id] = @id"
                    InsertCommand="INSERT INTO [news] ([id], [content], [url], [reldate], [movie_id]) VALUES (@id, @content, @url, @reldate, @movie_id)">

                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                        <asp:Parameter Name="content" Type="String" />
                        <asp:Parameter Name="url" Type="String" />
                        <asp:Parameter DbType="Date" Name="reldate" />
                        <asp:Parameter Name="movie_id" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="content" Type="String" />
                        <asp:Parameter Name="url" Type="String" />
                        <asp:Parameter DbType="Date" Name="reldate" />
                        <asp:Parameter Name="movie_id" Type="Int32" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>



            </ContentTemplate>

            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="addNews" />
            </Triggers>

        </asp:UpdatePanel>






        <asp:UpdatePanel runat="server" ID="UpdatePanelSales" UpdateMode="Conditional">

            <ContentTemplate>
                <div style="margin-top: 50px">
                    <h1 style="float: left; padding: 5px;">电影票房</h1>
                    <asp:Button runat="server" ID="Button4" OnClick="btnAddSaleClick" Text="添加票房" CssClass="addbtn" />
                </div>



                <asp:GridView ID="GridViewSales" runat="server" DataSourceID="SqlDataSourceSales" Width="100%" AutoGenerateColumns="False" CellPadding="4" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" DataKeyNames="id">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem">
                            <HeaderStyle CssClass="gridheader" />
                            <ItemStyle CssClass="griditem" />
                        </asp:BoundField>


                        <asp:TemplateField HeaderText="日期">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBoxSale" runat="server" Text='<%#  Bind("reldate", "{0:yyyy-MM-dd}") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="LabelSale" runat="server" Text='<%#  Bind("reldate", "{0:yyyy-MM-dd}") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle CssClass="gridheader" />
                            <ItemStyle CssClass="griditem" />
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="星期" HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem">
                            <ItemTemplate>
                                <%# getWeek(Container.DataItem) %>
                            </ItemTemplate>
                        </asp:TemplateField>


                        <asp:BoundField DataField="sales" HeaderText="票房" SortExpression="sales" HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem">
                            <HeaderStyle CssClass="gridheader" />
                            <ItemStyle CssClass="griditem" />
                        </asp:BoundField>
                        <asp:CommandField CancelText="取消" DeleteText="删除" EditText="编辑" ShowDeleteButton="True" ShowEditButton="True" UpdateText="更新" HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem">
                            <HeaderStyle CssClass="gridheader" />
                            <ItemStyle CssClass="griditem" />
                        </asp:CommandField>
                    </Columns>
                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" ForeColor="#330099" />
                    <SelectedRowStyle BackColor="#FFCC66" ForeColor="#663399" Font-Bold="True" />
                    <SortedAscendingCellStyle BackColor="#FEFCEB" />
                    <SortedAscendingHeaderStyle BackColor="#AF0101" />
                    <SortedDescendingCellStyle BackColor="#F6F0C0" />
                    <SortedDescendingHeaderStyle BackColor="#7E0000" />
                </asp:GridView>




                <asp:SqlDataSource ID="SqlDataSourceSales" runat="server" ConnectionString="<%$ ConnectionStrings:movie %>"
                    SelectCommand="SELECT * FROM [sales]"
                    DeleteCommand="DELETE FROM [sales] WHERE [id] = @id"
                    InsertCommand="INSERT INTO [sales] ([id], [movie_id], [reldate], [sales]) VALUES (@id, @movie_id, @reldate, @sales)"
                    UpdateCommand="UPDATE [sales] SET [sales] = @sales, [reldate] = @reldate WHERE [id] = @id">
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                        <asp:Parameter Name="movie_id" Type="Int32" />
                        <asp:Parameter Name="reldate" DbType="Date" />
                        <asp:Parameter Name="sales" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="movie_id" Type="Int32" />
                        <asp:Parameter Name="reldate" DbType="date" />
                        <asp:Parameter Name="sales" Type="String" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>




            </ContentTemplate>

            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="addNews" />
            </Triggers>

        </asp:UpdatePanel>




        <asp:UpdatePanel ID="UpdatePanelResponse" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div style="margin-top: 50px">
                    <h1 style="float: left; padding: 5px;">电影评论</h1>
                </div>

                <asp:GridView runat="server" ID="GridViewResponse" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSourceResponse">

                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem" />
                        <asp:TemplateField HeaderText="用户" SortExpression="user_id" HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# getUserName(Container.DataItem) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="reply_time" HeaderText="评论时间" ReadOnly="True" SortExpression="reply_time" />
                        <asp:BoundField DataField="comment" HeaderText="评论" ReadOnly="True" SortExpression="comment" />
                        <asp:CommandField DeleteText="删除" ShowDeleteButton="True" />
                    </Columns>

                </asp:GridView>

                <asp:SqlDataSource ID="SqlDataSourceResponse" runat="server" ConnectionString="<%$ ConnectionStrings:movie %>"
                    DeleteCommand="DELETE FROM [responses] WHERE [id] = @id"
                    InsertCommand="INSERT INTO [responses] ([id], [movie_id], [user_id], [reply_time], [comment]) VALUES (@id, @movie_id, @user_id, @reply_time, @comment)"
                    SelectCommand="SELECT * FROM [responses] WHERE ([movie_id] = @movie_id)"
                    UpdateCommand="UPDATE [responses] SET [movie_id] = @movie_id, [user_id] = @user_id, [reply_time] = @reply_time, [comment] = @comment WHERE [id] = @id">
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                        <asp:Parameter Name="movie_id" Type="Int32" />
                        <asp:Parameter Name="user_id" Type="Int32" />
                        <asp:Parameter Name="reply_time" Type="String" />
                        <asp:Parameter Name="comment" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:QueryStringParameter DefaultValue="1" Name="movie_id" QueryStringField="id" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="movie_id" Type="Int32" />
                        <asp:Parameter Name="user_id" Type="Int32" />
                        <asp:Parameter Name="reply_time" Type="String" />
                        <asp:Parameter Name="comment" Type="String" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>

            </ContentTemplate>

        </asp:UpdatePanel>







        <asp:UpdatePanel ID="UpdatePanelVideo" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <h1 style="padding: 10px; margin-top: 50px">相关视频</h1>
                <table id="TableVideo" runat="server" style="width: 100%; border-collapse: separate; border-spacing: 50px">

                    <tr style="text-align: center;">
                        <td style="width: 300px; text-align: center">
                            <img runat="server" id="VideoImage0" style="background-color: #eeeeee; width: 250px;" src="<%# getVideoImageUrl(0) %>" /></td>
                        <td>
                            <asp:TextBox ID="TextBoxVideoImage0" runat="server" Style="width: 100%;" AutoPostBack="true" Text="<%# getVideoImageUrl(0) %>" /></td>

                        <td>
                            <asp:TextBox ID="TextBoxVideoUrl0" runat="server" Style="width: 100px;" AutoPostBack="true" Text="<%# getVideoUrl(0) %>" /></td>

                        <td style="width: 200px">
                            <asp:Button runat="server" ID="ButtonVideo0" Text="更新" Width="100px" Height="50px" OnClick="updateVideo0" /></td>
                    </tr>

                    <tr style="text-align: center;">
                        <td style="width: 300px; text-align: center">
                            <img runat="server" id="VideoImage1" style="background-color: #eeeeee; width: 250px;" src="<%# getVideoImageUrl(1) %>" /></td>
                        <td>
                            <asp:TextBox ID="TextBoxVideoImage1" runat="server" Style="width: 100%;" AutoPostBack="true" Text="<%# getVideoImageUrl(1) %>" /></td>

                        <td>
                            <asp:TextBox ID="TextBoxVideoUrl1" runat="server" Style="width: 100px;" AutoPostBack="true" Text="<%# getVideoUrl(1) %>" /></td>

                        <td style="width: 200px">
                            <asp:Button runat="server" ID="ButtonVideo1" Text="更新" Width="100px" Height="50px" OnClick="updateVideo1" /></td>
                    </tr>

                    <tr style="text-align: center;">
                        <td style="width: 300px; text-align: center">
                            <img runat="server" id="VideoImage2" style="background-color: #eeeeee; width: 250px;" src="<%# getVideoImageUrl(2) %>" /></td>
                        <td>
                            <asp:TextBox ID="TextBoxVideoImage2" runat="server" Style="width: 100%;" AutoPostBack="true" Text="<%# getVideoImageUrl(2) %>" /></td>

                        <td>
                            <asp:TextBox ID="TextBoxVideoUrl2" runat="server" Style="width: 100px;" AutoPostBack="true" Text="<%# getVideoUrl(2) %>" /></td>

                        <td style="width: 200px">
                            <asp:Button runat="server" ID="ButtonVideo2" Text="更新" Width="100px" Height="50px" OnClick="updateVideo2" /></td>
                    </tr>

                    <tr style="text-align: center;">
                        <td style="width: 300px; text-align: center">
                            <img runat="server" id="VideoImage3" style="background-color: #eeeeee; width: 250px;" src="<%# getVideoImageUrl(3) %>" /></td>
                        <td>
                            <asp:TextBox ID="TextBoxVideoImage3" runat="server" Style="width: 100%;" AutoPostBack="true" Text="<%# getVideoImageUrl(3) %>" /></td>

                        <td>
                            <asp:TextBox ID="TextBoxVideoUrl3" runat="server" Style="width: 100px;" AutoPostBack="true" Text="<%# getVideoUrl(3) %>" /></td>

                        <td style="width: 200px">
                            <asp:Button runat="server" ID="ButtonVideo3" Text="更新" Width="100px" Height="50px" OnClick="updateVideo3" /></td>
                    </tr>


                </table>
            </ContentTemplate>

        </asp:UpdatePanel>








    </form>




</asp:Content>
