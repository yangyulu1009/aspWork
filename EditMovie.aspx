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
    </style>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server">

        <asp:ScriptManager runat="server" ID="ScriptManager1">
        </asp:ScriptManager>

        <asp:UpdatePanel runat="server" ID="UpdatePanelNews" UpdateMode="Conditional">

            <ContentTemplate>
                <h1 style="float: left; padding: 5px;">相关新闻</h1>
                <asp:Button runat="server" ID="addNews" OnClick="btnAdd_Click" Text="添加新闻" CssClass="addbtn" />


                <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSourceNews" Width="100%" Style="font-size: 30px" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="ID" ReadOnly="True" SortExpression="id" HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem">
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
                        <asp:CommandField CancelText="取消" DeleteText="删除" EditText="编辑" ShowDeleteButton="True" ShowEditButton="True" HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem" UpdateText="更新">
                            <HeaderStyle CssClass="gridheader"></HeaderStyle>

                            <ItemStyle CssClass="griditem"></ItemStyle>
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
                    SelectCommand="SELECT [id], [content], [url], [release_date] FROM [news] WHERE ([movie_id] = @id) ORDER by [id] ASC"
                    DeleteCommand="DELETE FROM news WHERE (id = @id)"
                    UpdateCommand="Update news set content=@content, url=@url, release_date=@release_date WHERE (id=@id)">

                    <SelectParameters>
                        <asp:QueryStringParameter Name="id" QueryStringField="id" Type="Int32" DefaultValue="1" />
                    </SelectParameters>
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






        <asp:UpdatePanel runat="server" ID="UpdatePanelSales" UpdateMode="Conditional">

            <ContentTemplate>
                <h1 style="float: left; padding: 5px;">电影票房</h1>
                <asp:Button runat="server" ID="Button4" OnClick="btnAddSaleClick" Text="添加票房" CssClass="addbtn" />


                <asp:GridView ID="GridViewSales" runat="server" DataSourceID="SqlDataSourceSales" Width="100%" Style="font-size: 30px" AutoGenerateColumns="False" CellPadding="4" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" DataKeyNames="id" OnRowEditing="GridViewSales_RowEditing" OnRowUpdating="GridViewSales_RowUpdating">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" />
                        <asp:TemplateField HeaderText="电影名称">
                            <ItemTemplate>
                                <%# getMovieName(Container.DataItem) %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="dropDownListMovie" runat="server">

                                </asp:DropDownList>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="date" HeaderText="日期" SortExpression="date" />
                        <asp:BoundField DataField="sales" HeaderText="票房" SortExpression="sales" />
                        <asp:CommandField CancelText="取消" DeleteText="删除" EditText="编辑" ShowDeleteButton="True" ShowEditButton="True" UpdateText="更新" />
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
                    InsertCommand="INSERT INTO [sales] ([id], [movie_id], [date], [sales]) VALUES (@id, @movie_id, @date, @sales)" 
                    UpdateCommand="UPDATE [sales] SET [date] = @date, [sales] = @sales WHERE [id] = @id">
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                        <asp:Parameter Name="movie_id" Type="Int32" />
                        <asp:Parameter Name="date" Type="String" />
                        <asp:Parameter Name="sales" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="movie_id" Type="Int32" />
                        <asp:Parameter Name="date" Type="String" />
                        <asp:Parameter Name="sales" Type="String" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                    



            </ContentTemplate>

            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="addNews" />
            </Triggers>

        </asp:UpdatePanel>


    </form>




</asp:Content>
