<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Movietype.aspx.cs" Inherits="Movietype" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeader" runat="Server">
    <style>

        .blog-pagenat-wthree ul li a.myselect {
            background: #000000;
            color: #fff;
        }


    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <div class="w3_content_agilleinfo_inner" style="padding-top:0em">
        <div class="agile_featured_movies">
            <!--/tv-movies-->
            <h3 class="agile_w3_title hor-t"><span><%# getActionName() %></span></h3>
            <div class="wthree_agile-requested-movies tv-movies">
                <%# getMovietypeHtmls() %>
                <div class="clearfix"></div>
            </div>

            <div class="blog-pagenat-wthree">
                <ul>
                    <li><a class="frist" href='<%# getPrevUrl() %>'>Prev</a></li>
                    <%# getPageHtmls() %>
                    <li><a class="last" href='<%# getNextUrl() %>'>Next</a></li>
                </ul>
            </div>

        </div>
    </div>



</asp:Content>

