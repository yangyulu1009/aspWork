<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Single.aspx.cs" Inherits="Single" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="w3_content_agilleinfo_inner">
    <div class="agile_featured_movies">
        <div class="inner-agile-w3l-part-head">
            <h3 class="w3l-inner-h-title">
                <%# mMovie.name %></h3>
            <p class="w3ls_head_para">
                <%# mMovie.description %></p>
        </div>
        <div class="latest-news-agile-info">
            <div class="col-md-8 latest-news-agile-left-content">
                <div class="single video_agile_player">
                    <div class="video-grid-single-page-agileits">
                        <div data-video="f2Z65fobH2I" id="video">
                            <img src="<%# mMovie.getSingleImage() %>" alt="" class="img-responsive" />
                        </div>
                    </div>
                    <!-- <h4>Force 2 | Official Trailer | John Abraham, Sonakshi Sinha and Tahir Raj Bhasin</h4> -->
                    <div class="player-text side-bar-info">
                        <p class="fexi_header">Me Before You</p>
                        <p class="fexi_header_para">
                            <span>Story Line
                                <label>:</label></span>
                            <%# mMovie.description %></p>
                        <p class="fexi_header_para">
                            <span>Release On
                                <label>:</label></span>
                            <%# mMovie.year %></p>
                        <p class="fexi_header_para">
                            <span>Country
                                <label>:</label></span>
                            <%# mMovie.country %></p>
                        <p class="fexi_header_para">
                            <span>Director
                                <label>:</label></span>
                            <a href="https://en.wikipedia.org/wiki/Scott_DerricksonScott">
                                <%# mMovie.getDirector() %></a>
                        </p>
                        <p class="fexi_header_para">
                            <span>Writer
                                <label>:</label></span>
                            <a href="https://en.wikipedia.org/wiki/Jon_Spaihts">
                                <%# mMovie.getWriter() %></a>
                        </p>
                        <p class="fexi_header_para">
                            <span>Actor
                                <label>:</label></span>
                            <a href="https://en.wikipedia.org/wiki/Benedict_Cumberbatch">
                                <%# mMovie.getActor() %></a>
                        </p>
                        <p class="fexi_header_para">
                            <span>Genre
                                <label>:</label></span>
                            <a href=" http://localhost/zxc/comedy.html ">
                                <%# mMovie.genre %></a>
                        </p>
                        <p class="fexi_header_para">
                            <span>Key Words
                                <label>:</label></span>
                            <%# mMovie.getKeywords() %></p>
                        <p class="fexi_header_para fexi_header_para1">
                            <span>Star Rating
                                <label>:</label></span>
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
                    <img src="<%# mMovie.getOperaImage(0) %>" width="178" height="200" alt=""></a>
                    <img src="<%# mMovie.getOperaImage(1) %>" width="178" height="200" alt=""></a>
                    <img src="<%# mMovie.getOperaImage(2) %>" width="178" height="200" alt=""></a>
                    <img src="<%# mMovie.getOperaImage(3) %>" width="178" height="200" alt=""></a>
                    <div class="clearfix"></div>
                </div>
                <div class="admin-text">
                    <h5>Videos</h5>
                    <a href="<%# mMovie.getVideoUrl(0) %>">
                        <img src="<%# mMovie.getVideoImage(0) %>" width="178" height="200" alt=""></a>
                    <a href="<%# mMovie.getVideoUrl(1) %>">
                        <img src="<%# mMovie.getVideoImage(1) %>" width="178" height="200" alt=""></a>
                    <a href="<%# mMovie.getVideoUrl(2) %>">
                        <img src="<%# mMovie.getVideoImage(2) %>" width="178" height="200" alt=""></a>
                    <a href="<%# mMovie.getVideoUrl(3) %>">
                        <img src="<%# mMovie.getVideoImage(3) %>" width="178" height="200" alt=""></a>
                    <div class="clearfix"></div>
                </div>
                <div class="response">
                    <h4>Responses</h4>
                    <%# getResponseHtmls() %></div>
                <div class="all-comments-info">
                    <h5>LEAVE A COMMENT</h5>
                    <div class="agile-info-wthree-box">
                        <form>
                            <textarea placeholder="Message" required=""></textarea>
                            <input type="submit" value="SEND" />
                            <div class="clearfix"></div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-4 latest-news-agile-right-content">
                <h4 class="side-t-w3l-agile">News</h3>
                    <%# getNewsHtml() %>
                        <div class="clearfix"></div>
                        <div class="agile-info-recent">
                            <h4 class="side-t-w3l-agile">Box Office Sales</h4>
                            <div class="w3ls-recent-grids">
                                <table table width="100%" border="1">
                                    <tr>
                                        <th>Date</th>
                                        <th>Week</th>
                                        <th>Sales</th></tr>
                                    <%# getSalesHtml() %></table>
                                <ul class="w3l-sider-list">
                                    <li>
                                        <i class="fa fa-clock-o" aria-hidden="true"></i>Till
                                        <%# getTillDate() %></li>
                                    <li>Total Sales:$
                                        <%# mMovie.allSales %></li></ul>
                                <div class="clearfix"></div>
                            </div>
                        </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>

</asp:Content>

