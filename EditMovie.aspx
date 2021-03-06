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

            .griditem img {
                height: 100%;
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

        .long-text {
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .long-text-edit {
        }
    </style>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server">

        <asp:ScriptManager runat="server" ID="ScriptManager1">
        </asp:ScriptManager>

        <asp:UpdatePanel ID="UpdatePanelDesc" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <h1 style="padding: 5px;">Storyline</h1>
                <asp:GridView ID="GridViewDesc" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSourceDesc">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="ID" ReadOnly="True" SortExpression="id" HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem" ItemStyle-Width="5%">
                            <HeaderStyle CssClass="gridheader" />
                            <ItemStyle CssClass="griditem" />
                        </asp:BoundField>
                        <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="Movie Title" SortExpression="name">
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLinkMovieName" runat="server" Text='<%# Bind("name") %>' NavigateUrl='<%# getMovieUrl(Container.DataItem) %>' Target="_blank"></asp:HyperLink>
                            </ItemTemplate>
                            <HeaderStyle CssClass="gridheader" />
                            <ItemStyle CssClass="griditem" Width="15%" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Storyline" SortExpression="description" HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("description") %>' TextMode="MultiLine" Width="100%"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("description") %>' Width="100%"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle CssClass="gridheader" />
                            <ItemStyle CssClass="griditem" />
                        </asp:TemplateField>




                        <asp:CommandField CancelText="Cancel" DeleteText="" EditText="Edit" ShowEditButton="True" UpdateText="Update" HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem" ItemStyle-Width="20%" >
                        <HeaderStyle CssClass="gridheader" />
                        <ItemStyle CssClass="griditem" Width="20%" />
                        </asp:CommandField>
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


        



        <asp:UpdatePanel runat="server" ID="UpdatePanelRole" UpdateMode="Conditional">

            


            <ContentTemplate>
                <h1 style="padding: 5px; margin-top: 50px">Related Stars</h1>

                <asp:GridView runat="server" ID="GridViewRole" AutoGenerateColumns="False" DataKeyNames="id"  DataSourceID="SqlDataSourceRole" OnRowDeleted="GridViewRole_RowDeleted">



                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" ItemStyle-Width="10%"/>
                        <asp:TemplateField HeaderText="Name" ItemStyle-Width="50%">
                            <ItemTemplate>
                                <asp:Label ID="LabelPeopleName" runat="server"><%# getPeopleName(Container.DataItem) %></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Role" ItemStyle-Width="30%">
                            <ItemTemplate>
                                <asp:Label ID="LabelRoleName" runat="server" Text='<%# Bind("role") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:CommandField ShowDeleteButton="True" DeleteText="Delete" ShowCancelButton="False" ItemStyle-Width="10%"/>

                    </Columns>



                </asp:GridView>

                <asp:SqlDataSource ID="SqlDataSourceRole" runat="server" ConnectionString="<%$ ConnectionStrings:movie %>" DeleteCommand="DELETE FROM [role] WHERE [id] = @id" InsertCommand="INSERT INTO [role] ([id], [movie_id], [people_id], [role]) VALUES (@id, @movie_id, @people_id, @role)" SelectCommand="SELECT * FROM [role] WHERE ([movie_id] = @movie_id)" UpdateCommand="UPDATE [role] SET [movie_id] = @movie_id, [people_id] = @people_id, [role] = @role WHERE [id] = @id">
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                        <asp:Parameter Name="movie_id" Type="Int32" />
                        <asp:Parameter Name="people_id" Type="Int32" />
                        <asp:Parameter Name="role" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:QueryStringParameter DefaultValue="1" Name="movie_id" QueryStringField="id" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="movie_id" Type="Int32" />
                        <asp:Parameter Name="people_id" Type="Int32" />
                        <asp:Parameter Name="role" Type="String" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>


               <table style="width: 100%" runat="server" id="TableRole">
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="LabelRoleId" Text='<%# Role.getNewId() %>'></asp:Label>
                        </td>
                        <td style="width: 50%">
                            <asp:DropDownList runat="server" Width="50%" ID="DPLPeople" AutoPostBack="false" />
                        </td>

                        <td style="width:30%">
                            <asp:DropDownList runat="server" Width="50%" ID="DPLRole" AutoPostBack="false">
                                <asp:ListItem Value="Director" Text="Director" />
                                <asp:ListItem Value="Actor" Text="Actor" />
                                <asp:ListItem Value="Writer" Text="Writer" />
                            </asp:DropDownList>
                        </td>

                        <td style="width: 10%">
                            <asp:LinkButton runat="server" ID="ButtonAddRole" OnClick="ButtonAddRole_Click" Text="添加" />
                        </td>
                    </tr>
                </table>

         
               
               
                
            </ContentTemplate>

           


        </asp:UpdatePanel>

         



        



         <!--
                        
                            -->



        <asp:UpdatePanel runat="server" ID="UpdatePanelNews" UpdateMode="Conditional">

            <ContentTemplate>

                <h1 style="padding: 5px; margin-top: 100px">Related News</h1>

                <asp:GridView ID="GridViewNews" runat="server" DataSourceID="SqlDataSourceNews" Width="100%" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem" ItemStyle-Width="5%">
                            <HeaderStyle CssClass="gridheader" />
                            <ItemStyle CssClass="griditem" />
                        </asp:BoundField>


                        <asp:TemplateField HeaderText="Publish Time" SortExpression="reldate" ItemStyle-Width="10%">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBoxNewsDate" runat="server" Text='<%# Bind("reldate", "{0:yyyy-MM-dd}") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="LabelNewsDate" runat="server" Text='<%# Bind("reldate", "{0:yyyy-MM-dd}") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle CssClass="gridheader" />
                            <ItemStyle CssClass="griditem" />
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="News Content" SortExpression="content">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("content") %>' Width="400px" CssClass="long-text-edit" TextMode="MultiLine" Height="200px"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("content") %>' CssClass="long-text" Width="400px"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle CssClass="gridheader" />
                            <ItemStyle CssClass="griditem" />
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="News Link" SortExpression="url">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBoxNewsLink" runat="server" Text='<%# Bind("url") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:HyperLink ID="LinkNewsLink" runat="server" Text='<%# Bind("url") %>' NavigateUrl='<%# Bind("url") %>' Target="_blank"></asp:HyperLink>
                            </ItemTemplate>
                            <HeaderStyle CssClass="gridheader" />
                            <ItemStyle CssClass="griditem" />
                        </asp:TemplateField>


                        <asp:CommandField CancelText="Cancel" DeleteText="Delete" EditText="Edit" ShowDeleteButton="True" ShowEditButton="True" UpdateText="Update" HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem" ItemStyle-Width="20%">
                            <HeaderStyle CssClass="gridheader" />
                            <ItemStyle CssClass="griditem" Width="20%" />
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

                <asp:Button runat="server" ID="ButtonAddNews" OnClick="btnAddNews_Click" Text="Add News" CssClass="addbtn" />


                <asp:SqlDataSource ID="SqlDataSourceNews" runat="server" ConnectionString="<%$ ConnectionStrings:movie %>"
                    SelectCommand="SELECT news.* FROM [news] WHERE ([movie_id] = @movie_id)"
                    DeleteCommand="DELETE FROM [news] WHERE [id] = @id"
                    UpdateCommand="UPDATE [news] SET [content] = @content, [url] = @url, [reldate] = @reldate WHERE [id] = @id">

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
                    <SelectParameters>
                        <asp:QueryStringParameter DefaultValue="1" Name="movie_id" QueryStringField="id" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>



            </ContentTemplate>

            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="ButtonAddNews" />
            </Triggers>

        </asp:UpdatePanel>



        <div class="clearfix" />


        <asp:UpdatePanel runat="server" ID="UpdatePanelSales" UpdateMode="Conditional">

            <ContentTemplate>
                <h1 style="padding: 5px; margin-top: 100px">Box Offices</h1>



                <asp:GridView ID="GridViewSales" runat="server" DataSourceID="SqlDataSourceSales" Width="100%" AutoGenerateColumns="False" CellPadding="4" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" DataKeyNames="id">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem" ItemStyle-Width="5%">
                            <HeaderStyle CssClass="gridheader" />
                            <ItemStyle CssClass="griditem" />
                        </asp:BoundField>


                        <asp:TemplateField HeaderText="Date" ItemStyle-Width="10%">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBoxSale" runat="server" Text='<%#  Bind("reldate", "{0:yyyy-MM-dd}") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="LabelSale" runat="server" Text='<%#  Bind("reldate", "{0:yyyy-MM-dd}") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle CssClass="gridheader" />
                            <ItemStyle CssClass="griditem" />
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Week" HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem">
                            <ItemTemplate>
                                <%# getWeek(Container.DataItem) %>
                            </ItemTemplate>
                        </asp:TemplateField>


                        <asp:BoundField DataField="sales" HeaderText="Daily Sales" SortExpression="sales" HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem">
                            <HeaderStyle CssClass="gridheader" />
                            <ItemStyle CssClass="griditem" />
                        </asp:BoundField>
                        <asp:CommandField CancelText="Cancel" DeleteText="Delete" EditText="Edit" ShowDeleteButton="True" ShowEditButton="True" UpdateText="更新" HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem" ItemStyle-Width="20%">
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

                <asp:Button runat="server" ID="ButtonAddSale" OnClick="btnAddSaleClick" Text="Add" CssClass="addbtn" />


                <asp:SqlDataSource ID="SqlDataSourceSales" runat="server" ConnectionString="<%$ ConnectionStrings:movie %>"
                    SelectCommand="SELECT * FROM [sales] WHERE [movie_id] = @movie_id"
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
                    <SelectParameters>
                        <asp:QueryStringParameter DefaultValue="1" Name="movie_id" QueryStringField="id" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>


            </ContentTemplate>

            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="ButtonAddSale" />
            </Triggers>

        </asp:UpdatePanel>

        <div class="clearfix" />






        <asp:UpdatePanel runat="server" ID="UpdatePanelImage" UpdateMode="Conditional">
            <ContentTemplate>

                <h1 style="padding: 5px; margin-top: 100px">Related Pictures</h1>
                <asp:GridView ID="GridViewImage" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSourceImage" OnRowUpdating="GridViewImage_RowUpdating">


                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="ID" ReadOnly="True" SortExpression="id" HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem" ItemStyle-Width="5%">
                            <HeaderStyle CssClass="gridheader" />
                            <ItemStyle CssClass="griditem" />
                        </asp:BoundField>
                        <asp:ImageField DataImageUrlField="url" HeaderText="Image" HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem" ItemStyle-Height="100px">
                            <HeaderStyle CssClass="gridheader" />
                            <ItemStyle CssClass="griditem" />
                        </asp:ImageField>
                        <asp:TemplateField HeaderText="Image Description" HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem" ItemStyle-Width="10%">
                            <ItemTemplate>
                                <%# getImageDesc(Container.DataItemIndex) %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField CancelText="Cancel" EditText="Edit" ShowEditButton="True" UpdateText="Update" HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem" ItemStyle-Width="20%">
                            <HeaderStyle CssClass="gridheader" />
                            <ItemStyle CssClass="griditem" />
                        </asp:CommandField>
                    </Columns>



                </asp:GridView>


                <asp:SqlDataSource ID="SqlDataSourceImage" runat="server" ConnectionString="<%$ ConnectionStrings:movie %>"
                    DeleteCommand="DELETE FROM [image] WHERE [id] = @id" InsertCommand="INSERT INTO [image] ([id], [url]) VALUES (@id, @url)"
                    SelectCommand="SELECT [id], [url] FROM [image] WHERE ([movie_id] = @movie_id)"
                    UpdateCommand="UPDATE [image] SET [url] = @url WHERE [id] = @id">
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



        <asp:UpdatePanel runat="server" ID="UpdatePanelVideos" UpdateMode="Conditional">
            <ContentTemplate>

                <h1 style="padding: 5px; margin-top: 50px">Related Videos</h1>
                <asp:GridView ID="GridViewVideos" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSourceVideo" OnRowUpdating="GridViewVideos_RowUpdating">


                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem" ItemStyle-Width="5%"></asp:BoundField>
                        <asp:ImageField DataImageUrlField="image_url" HeaderText="Image" HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem" ItemStyle-Height="100px">
                        </asp:ImageField>
                        <asp:BoundField DataField="video_url" HeaderText="Video Url" SortExpression="video_url" HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem" />
                        <asp:TemplateField HeaderText="Video Description" HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem" ItemStyle-Width="10%">
                            <ItemTemplate>
                                <%# getVideoDesc(Container.DataItemIndex) %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField CancelText="Cancel" EditText="Edit" ShowEditButton="True" UpdateText="Update" HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem" ItemStyle-Width="20%" />
                    </Columns>



                </asp:GridView>


                <asp:SqlDataSource ID="SqlDataSourceVideo" runat="server" ConnectionString="<%$ ConnectionStrings:movie %>"
                    DeleteCommand="DELETE FROM [video] WHERE [id] = @id"
                    InsertCommand="INSERT INTO [video] ([id], [image_url], [video_url]) VALUES (@id, @image_url, @video_url)"
                    SelectCommand="SELECT [id], [image_url], [video_url] FROM [video] WHERE ([movie_id] = @movie_id)"
                    UpdateCommand="UPDATE [video] SET [image_url] = @image_url, [video_url] = @video_url WHERE [id] = @id">
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                        <asp:Parameter Name="image_url" Type="String" />
                        <asp:Parameter Name="video_url" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:QueryStringParameter DefaultValue="1" Name="movie_id" QueryStringField="id" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="image_url" Type="String" />
                        <asp:Parameter Name="video_url" Type="String" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>

            </ContentTemplate>


        </asp:UpdatePanel>





        <asp:UpdatePanel ID="UpdatePanelResponse" runat="server" UpdateMode="Conditional"  Visible="<%# showResponses() %>">
            <ContentTemplate>
                <h1 style="padding: 5px; margin-top: 100px">Movie Comment</h1>

                <asp:GridView runat="server" ID="GridViewResponse" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSourceResponse">

                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem" ItemStyle-Width="5%" />
                        <asp:TemplateField HeaderText="User" SortExpression="user_id" HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem">
                            <ItemTemplate>
                                <asp:Label ID="LabelResponse" runat="server" Text='<%# getUserName(Container.DataItem) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="reply_time" HeaderText="Response Time" ReadOnly="True" SortExpression="reply_time" />
                        <asp:BoundField DataField="comment" HeaderText="Comment" ReadOnly="True" SortExpression="comment" />
                        <asp:CommandField DeleteText="Delete" ShowDeleteButton="True" ItemStyle-Width="20%" />
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



    </form>




</asp:Content>
