<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EditMovie.aspx.cs" Inherits="EditMovie" MaintainScrollPositionOnPostback="true" %>

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
            background-color:#ffffff;
        }

    </style>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server">

        <asp:ScriptManager runat="server" ID="ScriptManager1">
        </asp:ScriptManager>

        <asp:UpdatePanel runat="server" ID="UpdatePanelNews" UpdateMode="Conditional">

            <ContentTemplate>
                <h1 style="float: left; padding: 5px;">相关新闻</h1>
                <asp:Button runat="server" ID="addNews" OnClick="btnAddNews_Click" Text="添加新闻" CssClass="addbtn" />


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


                        <asp:CommandField CancelText="取消" DeleteText="删除" EditText="编辑" ShowDeleteButton="True" ShowEditButton="True" UpdateText="更新" HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem">
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
                <div style="margin-top:50px">
                    <h1 style="float: left; padding: 5px; ">电影票房</h1>
                    <asp:Button runat="server" ID="Button4" OnClick="btnAddSaleClick" Text="添加票房" CssClass="addbtn" />
                </div>
                
                

                <asp:GridView ID="GridViewSales" runat="server" DataSourceID="SqlDataSourceSales" Width="100%" AutoGenerateColumns="False" CellPadding="4" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" DataKeyNames="id">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id"  HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem">
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


                        <asp:BoundField DataField="sales" HeaderText="票房" SortExpression="sales"  HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem">
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








        <asp:UpdatePanel ID="UpdatePanelImage" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <h1 style="padding: 10px; margin-top: 50px">相关图片</h1>
                <table id="TableImage" runat="server" style="width: 100%; border-collapse: separate; border-spacing: 50px">
                    <tr style="text-align: center;">
                        <td style="width: 300px; text-align: center">
                            <img runat="server" id="ImageIcon" style="background-color: #eeeeee; width: 250px" src="<%# getIconUrl() %>" /></td>
                        <td>
                            <asp:TextBox ID="TextBoxIcon" runat="server" Style="width: 100%;" AutoPostBack="true" Text="<%# getIconUrl() %>" /></td>

                        <td style="width: 200px">
                            <asp:Button runat="server" ID="ButtonUpdateIcon" Text="更新" Width="100px" Height="50px" OnClick="updateIconClick" /></td>
                    </tr>

                    <tr style="text-align: center;">
                        <td style="width: 300px; text-align: center">
                            <img runat="server" id="ImageBanner" style="background-color: #eeeeee; width: 250px;" src="<%# getBannerUrl() %>" /></td>
                        <td>
                            <asp:TextBox ID="TextBoxBanner" runat="server" Style="width: 100%;" AutoPostBack="true" Text="<%# getBannerUrl() %>" /></td>

                        <td style="width: 200px">
                            <asp:Button runat="server" ID="ButtonUpdateBanner" Text="更新" Width="100px" Height="50px" OnClick="updateBannerClick" /></td>
                    </tr>

                    <tr style="text-align: center;">
                        <td style="width: 300px; text-align: center">
                            <img runat="server" id="Image0" style="background-color: #eeeeee; width: 250px;" src="<%# getOperaImageUrl(0) %>" /></td>
                        <td>
                            <asp:TextBox ID="TextBox0" runat="server" Style="width: 100%;" AutoPostBack="true" Text="<%# getOperaImageUrl(0) %>" /></td>

                        <td style="width: 200px">
                            <asp:Button runat="server" ID="Button0" Text="更新" Width="100px" Height="50px" OnClick="updateOperaImageUrl0" /></td>
                    </tr>

                    <tr style="text-align: center;">
                        <td style="width: 300px; text-align: center">
                            <img runat="server" id="Image1" style="background-color: #eeeeee; width: 250px;" src="<%# getOperaImageUrl(1) %>" /></td>
                        <td>
                            <asp:TextBox ID="TextBox1" runat="server" Style="width: 100%;" AutoPostBack="true" Text="<%# getOperaImageUrl(1) %>" /></td>

                        <td style="width: 200px">
                            <asp:Button runat="server" ID="Button1" Text="更新" Width="100px" Height="50px" OnClick="updateOperaImageUrl1" /></td>
                    </tr>

                    <tr style="text-align: center;">
                        <td style="width: 300px; text-align: center">
                            <img runat="server" id="Image2" style="background-color: #eeeeee; width: 250px;" src="<%# getOperaImageUrl(2) %>" /></td>
                        <td>
                            <asp:TextBox ID="TextBox2" runat="server" Style="width: 100%;" AutoPostBack="true" Text="<%# getOperaImageUrl(2) %>" /></td>

                        <td style="width: 200px">
                            <asp:Button runat="server" ID="Button2" Text="更新" Width="100px" Height="50px" OnClick="updateOperaImageUrl2" /></td>
                    </tr>

                    <tr style="text-align: center;">
                        <td style="width: 300px; text-align: center">
                            <img runat="server" id="Image3" style="background-color: #eeeeee; width: 250px;" src="<%# getOperaImageUrl(3) %>" /></td>
                        <td>
                            <asp:TextBox ID="TextBox3" runat="server" Style="width: 100%;" AutoPostBack="true" Text="<%# getOperaImageUrl(3) %>" /></td>

                        <td style="width: 200px">
                            <asp:Button runat="server" ID="Button3" Text="更新" Width="100px" Height="50px" OnClick="updateOperaImageUrl3" /></td>
                    </tr>


                </table>
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
