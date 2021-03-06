﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Single.aspx.cs" Inherits="Single" %>


<asp:Content ID="Header1" ContentPlaceHolderID="ContentPlaceHolderHeader" runat="server">

    <style>
        .send-rsp-btn {
            outline: none;
            font-style: normal;
            padding: 0.9em 4em;
            background: #02a388;
            font-size: 16px;
            color: #fff;
            display: block;
            border: none;
            width: 170px;
        }

        .opera-img {
            width: 178px;
            height: 200px;
        }

        .response-head {
            width: 80px;
            height: 80px;
            border-radius:40px;
        }
    </style>
</asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <form id="form1" runat="server">

        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>


        <div class="w3_content_agilleinfo_inner">
            <div class="agile_featured_movies">
                <div class="inner-agile-w3l-part-head">
                    <h3 class="w3l-inner-h-title"><%# getMovie().name %></h3>
                </div>
                <div class="latest-news-agile-info">
                    <div class="col-md-8 latest-news-agile-left-content">
                        <div class="single video_agile_player">
                            <div class="video-grid-single-page-agileits">
                                <div data-video="<%# getMovie().getBannerVideoUrl() %>" id="video">
                                    <img src="<%# getMovie().getBannerImageUrl() %>" alt="" class="img-responsive" />
                                </div>
                            </div>
                            <!-- <h4>Force 2 | Official Trailer | John Abraham, Sonakshi Sinha and Tahir Raj Bhasin</h4> -->
                            <div class="player-text side-bar-info">
                                <p class="fexi_header"><%# getMovie().name %></p>
                                <p class="fexi_header_para">
                                    <span class="conjuring_w3">Story Line
                                <label>:</label></span>
                                    <%# getMovie().description %>
                                </p>
                                <p class="fexi_header_para"><span>Release On<label>:</label></span><%# getMovie().year %></p>
                                <p class="fexi_header_para"><span>Country<label>:</label></span><%# getMovie().country %></p>
                                <p class="fexi_header_para"><span>Director<label>:</label></span>
                                    <%# getRoleHtmls(Role.DIRECTOR) %>
                                </p>
                                <p class="fexi_header_para"><span>Writer<label>:</label></span>
                                    <%# getRoleHtmls(Role.WRITER) %>
                                </p>
                                <p class="fexi_header_para"><span>Actor<label>:</label></span>
                                    <%# getRoleHtmls(Role.ACTOR) %>
                                </p>
                                <p class="fexi_header_para"><span>Genre<label>:</label></span>
                                    <%# getGenreHtmls() %>
                                </p>
                                <p class="fexi_header_para"><span>Key Words<label>:</label></span><%# getMovie().keywords %></p>
                                <p class="fexi_header_para fexi_header_para1"><span>Star Rating<label>:</label></span>
                                    <!-- <a href="#"> -->
                                    <i runat="server" id="star1" class="fa fa-star" aria-hidden="true"></i>
                                    <!-- <a href="#"> -->
                                    <i runat="server" id="star2" class="fa fa-star" aria-hidden="true"></i>
                                    <!-- <a href="#"> -->
                                    <i runat="server" id="star3" class="fa fa-star-half-o" aria-hidden="true"></i>
                                    <!-- <a href="#"> -->
                                    <i runat="server" id="star4" class="fa fa-star-o" aria-hidden="true"></i>
                                    <!-- <a href="#"> -->
                                    <i runat="server" id="star5" class="fa fa-star-o" aria-hidden="true"></i>
                                </p>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="admin-text">
                            <h5>Photographs</h5>
                            <img src="<%# getMovie().getOperaImage(0) %>" class="opera-img" />
                            <img src="<%# getMovie().getOperaImage(1) %>" class="opera-img" />
                            <img src="<%# getMovie().getOperaImage(2) %>" class="opera-img" />
                            <img src="<%# getMovie().getOperaImage(3) %>" class="opera-img" />
                            <div class="clearfix"></div>
                        </div>
                        <div class="admin-text">
                            <h5>Videos</h5>
                            <a href="<%# Video.getVideoUrl(getMovieId(), 1) %>">
                                <img src="<%# Video.getImageUrl(getMovieId(), 1) %>" class="opera-img" /></a>
                            <a href="<%# Video.getVideoUrl(getMovieId(), 2) %>">
                                <img src="<%# Video.getImageUrl(getMovieId(), 2) %>" class="opera-img" /></a>
                            <a href="<%# Video.getVideoUrl(getMovieId(), 3) %>">
                                <img src="<%# Video.getImageUrl(getMovieId(), 3) %>" class="opera-img" /></a>
                            <a href="<%# Video.getVideoUrl(getMovieId(), 4) %>">
                                <img src="<%# Video.getImageUrl(getMovieId(), 4) %>" class="opera-img" /></a>
                            <div class="clearfix"></div>
                        </div>




                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">

                            <ContentTemplate>
                                <asp:Repeater ID="RepeaterResponses" runat="server" DataSourceID="SqlDataSourceResponses">
                                    <HeaderTemplate>
                                        <h2 style="margin-top: 40px">Responses</h2>

                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <%# getResponseHtml(Container.ItemIndex) %>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                    </FooterTemplate>
                                </asp:Repeater>
                                <%--  --%>
                                <asp:SqlDataSource ID="SqlDataSourceResponses" runat="server" ConnectionString="<%$ ConnectionStrings:movie %>" SelectCommand="SELECT * FROM [responses] WHERE ([movie_id] = @movieId)">
                                    <SelectParameters>
                                        <asp:QueryStringParameter DefaultValue="1" Name="movieId" QueryStringField="id" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>

                                <div class="all-comments-info">
                                    <h5>LEAVE A COMMENT</h5>
                                    <asp:TextBox ID="TextBoxResp" runat="server" Columns="3" Width="100%" Rows="5" TextMode="MultiLine"></asp:TextBox>
                                    <asp:Button ID="ButtonSendRsp" runat="server" Text="SEND" OnClick="ButtonSendRsp_Click" CssClass="send-rsp-btn" Visible="false" />
                                    <%# getSendResponseHtml() %>
                                </div>
                            </ContentTemplate>

                        </asp:UpdatePanel>





                    </div>
                    <div class="col-md-4 latest-news-agile-right-content">
                        <h4 class="side-t-w3l-agile">News</h4>
                        <%# getNewsHtml() %>
                        <div class="clearfix"></div>
                        <div class="agile-info-recent">
                            <h4 class="side-t-w3l-agile">Box Office Sales</h4>
                            <div class="w3ls-recent-grids">
                                <table border="1" style="width: 100%">
                                    <tr>
                                        <th>Date</th>
                                        <th>Week</th>
                                        <th>Sales</th>
                                    </tr>
                                    <%# getSalesHtml() %>
                                </table>
                                <ul class="w3l-sider-list">
                                    <li>
                                        <i class="fa fa-clock-o" aria-hidden="true"></i>Till
                                        <%# getTillDate() %></li>
                                    <li>Total Sales:$
                                        <%# getMovie().allSales %></li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>

    </form>



</asp:Content>

