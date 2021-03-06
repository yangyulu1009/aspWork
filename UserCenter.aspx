﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UserCenter.aspx.cs" Inherits="UserCenter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeader" runat="Server">
    <style>
        .user-head {
            width: 100px;
            height: 100px;
        }

        .user-head-upload {
            margin-top: 8px;
        }

        .user-head-submit {
            margin-top: 8px;
        }

        .user-info {
            font-size: 18px;
            margin: 0 0 15px 0;
        }

        .user-info-input {
            margin: 10px;
        }

        .grid-response-header {
            position: relative;
            margin: 100px 0 10px 10%;
            font-size: 20px;
        }

        .grid-response {
            margin: auto;
        }

        a.mod-pwd {
            width: 200px;
            background-color: #ccc;
            /* height: 48px; */
            display: block;
            text-align: center;
            padding: 7px;
        }

        p.extra-manager {
            margin: 27px;
            font-size:18px;
        }

        p.extra-manager a {
            width: 200px;
            background-color: #ccc;
            display: block;
            text-align: center;
            padding: 7px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="modal fade" id="myModalRePwd" tabindex="-1" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4>Change Password</h4>
                    <div class="login-form">
                        <form action="?action=modpwd" method="post">
                            <input type="password" name="OldPassword" placeholder="Old Password" required="" autocomplete="off" />
                            <input type="password" name="NewPassword" placeholder="New Password" required="" autocomplete="off" />
                            <div class="tp">
                                <input type="submit" value="Submit" />
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <form runat="server">
        <div runat="server" id="RootContainer">

            <table style="width: 80%; margin: auto">
                <tr>

                    <td style="width: 30%">
                        <asp:ImageButton ID="ImageHead" runat="server" ImageUrl='<%# getUserHead() %>' CssClass="user-head" />

                        <asp:FileUpload ID="ImageUpload" runat="server" Visible="True" CssClass="user-head-upload" />

                        <asp:Button ID="ButtonUpload" runat="server" Text="Upload" CssClass="user-head-submit" OnClick="ButtonUpload_Click" />
                    </td>

                    <td style="width: 40%">
                        <p class="user-info">Name：<asp:Label ID="LabelNick" runat="server" Text='<%# getUser().name %>' /></p>
                        <p class="user-info">Email：<asp:Label ID="LabelEmail" runat="server" Text='<%# getUser().email %>' /></p>
                        <p class="user-info">Level：<asp:Label ID="LabelPrevilage" runat="server" Text='<%# getPrevilage() %>' /></p>
                        <p class="user-info">Register Time：<asp:Label ID="LabelTime" runat="server" Text='<%# getRegTime() %>' /></p>
                        <p class="user-info">
                            <a href="#" class="mod-pwd" data-toggle="modal" data-target="#myModalRePwd">Change Password</a>
                        </p>

                    </td>

                    <td style="width: 30%">
                        <div runat="server" id="ManagerContainer">
                            <p class="extra-manager"><a href="MovieManager.aspx" target="_blank">Movie Manager</a></p>
                            <p class="extra-manager"><a href="UsersManager.aspx" target="_blank">User Manager</a></p>
                            <p class="extra-manager"><a href="PeopleManager.aspx" target="_blank">Star Manager</a></p>
                        </div>
                    </td>

                </tr>

            </table>



        </div>





        <asp:ScriptManager runat="server" ID="ScriptManager1" />

        <asp:UpdatePanel runat="server" ID="UpdatePanelResponses">
            <ContentTemplate>
                <p class="grid-response-header">My Comment</p>
                <asp:GridView runat="server" ID="GridViewResponses" Width="80%" CssClass="grid-response" DataSourceID="SqlDataSourceResponses" AutoGenerateColumns="False" DataKeyNames="id" OnRowUpdating="GridViewResponses_RowUpdating">


                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="ID" ItemStyle-Width="10%" ReadOnly="true" SortExpression="id" />
                        <asp:TemplateField HeaderText="Movie Title" SortExpression="movie_id" ItemStyle-Width="30%">
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# getMovieName(Container.DataItem) %>'
                                    NavigateUrl='<%# getMovieUrl(Container.DataItem) %>' Target="_blank"></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField ApplyFormatInEditMode="True" DataField="comment" HeaderText="Comment" SortExpression="comment" />
                        <asp:BoundField DataField="reply_time" HeaderText="Response Time" ReadOnly="True" SortExpression="reply_time" ItemStyle-Width="20%" />
                        <asp:CommandField CancelText="Cancel" DeleteText="Delete" EditText="Edit" ShowDeleteButton="True" ShowEditButton="True" UpdateText="Update" ItemStyle-Width="10%" />
                    </Columns>


                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourceResponses" runat="server" ConnectionString="<%$ ConnectionStrings:movie %>"
                    DeleteCommand="DELETE FROM [responses] WHERE [id] = @id"
                    InsertCommand="INSERT INTO [responses] ([id], [movie_id], [user_id], [reply_time], [comment]) VALUES (@id, @movie_id, @user_id, @reply_time, @comment)"
                    SelectCommand="SELECT * FROM [responses] WHERE ([user_id] = @user_id) ORDER BY [reply_time] DESC, [id] DESC"
                    UpdateCommand="UPDATE [responses] SET [comment] = @comment WHERE [id] = @id">
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                        <asp:Parameter Name="movie_id" Type="Int32" />
                        <asp:Parameter Name="user_id" Type="Int32" />
                        <asp:Parameter Name="reply_time" Type="DateTime" />
                        <asp:Parameter Name="comment" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="user_id" SessionField="userId" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="movie_id" Type="Int32" />
                        <asp:Parameter Name="user_id" Type="Int32" />
                        <asp:Parameter Name="reply_time" Type="DateTime" />
                        <asp:Parameter Name="comment" Type="String" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </ContentTemplate>


        </asp:UpdatePanel>

    </form>

</asp:Content>

