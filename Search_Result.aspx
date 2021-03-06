﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Search_Result.aspx.cs" Inherits="Search_Result" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeader" Runat="Server">
   <style>

       td.w3-list-img a {
           display:block;
            font-size: 1em;
            font-weight: 600;
            text-decoration: none;
            display: block;
            margin: .5em 0 0 0;
            letter-spacing: 1px;
       }

   </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="w3_content_agilleinfo_inner">
            <div class="agile_featured_movies">
                <div class="inner-agile-w3l-part-head">
                    <!-- <h3 class="w3l-inner-h-title">Movie List</h3>
                    <p class="w3ls_head_para">Add short Description</p> --></div>
                <div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
                    <div id="myTabContent" class="tab-content">
                        <div role="tabpanel" class="tab-pane fade in active" id="home" aria-labelledby="home-tab">
                            <div class="agile-news-table">
                                <div class="w3ls-news-result">
                                    <h4>Search Results :
                                        <span><%# getMovieCount() %></span></h4>
                                </div>
                                <table id="table-breakpoint">
                                    <thead>
                                        <tr>
                                            <th>No.</th>
                                            <th>Movie Name</th>
                                            <th>Year</th>
                                            <th>Country</th>
                                            <th>Director</th>
                                            <th>Actor</th>
                                            <th>Writer</th>
                                            <th>Rating</th></tr>
                                    </thead>
                                    <tbody>
                                        <%# getSearchResultHtmls() %>
                                  
        
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!-- <div role="tabpanel" class="tab-pane fade" id="a" aria-labelledby="a-tab"> --></div>
                </div>
            </div>
        </div>
</asp:Content>

