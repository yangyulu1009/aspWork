<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Search_Result.aspx.cs" Inherits="Search_Result" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeader" Runat="Server">
   
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
                                        <span>25</span></h4>
                                </div>
                                <table id="table-breakpoint">
                                    <thead>
                                        <tr>
                                            <th>No.</th>
                                            <th>Movie Name</th>
                                            <th>Year</th>
                                            <th>Director</th>
                                            <th>Country</th>
                                            <th>Actor</th>
                                            <th>Rating</th></tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td class="w3-list-img">
                                                <a href="single.html">
                                                    <img src="images/m1.jpg" alt="" />
                                                    <span>Swiss Army Man</span></a>
                                            </td>
                                            <td>2016</td>
                                            <td>
                                                <a href="genre.html">张三</td>
                                            <td>United Kingdom</a></td>
                                            <td>
                                                <a href="comedy.html">胡歌</a></td>
                                            <td>7.0</td></tr>
                                        <tr>
                                            <td>2</td>
                                            <td class="w3-list-img">
                                                <a href="single.html">
                                                    <img src="images/m2.jpg" alt="" />
                                                    <span>Me Before you</span></a>
                                            </td>
                                            <td>2016</td>
                                            <td>
                                                <a href="genre.html">张三</td>
                                            <td>United Kingdom</a></td>
                                            <td>
                                                <a href="comedy.html">胡歌</a></td>
                                            <td>7.0</td></tr>
                                        <tr>
                                            <td>3</td>
                                            <td class="w3-list-img">
                                                <a href="single.html">
                                                    <img src="images/m11.jpg" alt="" />
                                                    <span>Warcraft</span></a>
                                            </td>
                                            <td>2016</td>
                                            <td>
                                                <a href="genre.html">张三</td>
                                            <td>United Kingdom</a></td>
                                            <td>
                                                <a href="comedy.html">胡歌</a></td>
                                            <td>7.0</td></tr>
                                        <tr>
                                            <td>4</td>
                                            <td class="w3-list-img">
                                                <a href="single.html">
                                                    <img src="images/m3.jpg" alt="" />
                                                    <span>Deadpool</span></a>
                                            </td>
                                            <td>2016</td>
                                            <td>
                                                <a href="genre.html">张三</td>
                                            <td>United Kingdom</a></td>
                                            <td>
                                                <a href="comedy.html">胡歌</a></td>
                                            <td>7.0</td></tr>
                                        <tr>
                                            <td>5</td>
                                            <td class="w3-list-img">
                                                <a href="single.html">
                                                    <img src="images/m4.jpg" alt="" />
                                                    <span>Rogue One</span></a>
                                            </td>
                                            <td>2016</td>
                                            <td>
                                                <a href="genre.html">张三</td>
                                            <td>United Kingdom</a></td>
                                            <td>
                                                <a href="comedy.html">胡歌</a></td>
                                            <td>7.0</td></tr>
                                        <tr>
                                            <td>6</td>
                                            <td class="w3-list-img">
                                                <a href="single.html">
                                                    <img src="images/m5.jpg" alt="" />
                                                    <span>Storks</span></a>
                                            </td>
                                            <td>2016</td>
                                            <td>
                                                <a href="genre.html">张三</td>
                                            <td>United Kingdom</a></td>
                                            <td>
                                                <a href="comedy.html">胡歌</a></td>
                                            <td>9.0</td></tr>
                                        <tr>
                                            <td>7</td>
                                            <td class="w3-list-img">
                                                <a href="single.html">
                                                    <img src="images/m6.jpg" alt="" />
                                                    <span>Hopeless</span></a>
                                            </td>
                                            <td>2016</td>
                                            <td>
                                                <a href="genre.html">张三</td>
                                            <td>United Kingdom</a></td>
                                            <td>
                                                <a href="comedy.html">胡歌</a></td>
                                            <td>7.0</td></tr>
                                        <tr>
                                            <td>8</td>
                                            <td class="w3-list-img">
                                                <a href="single.html">
                                                    <img src="images/m7.jpg" alt="" />
                                                    <span>Mechanic</span></a>
                                            </td>
                                            <td>2016</td>
                                            <td>
                                                <a href="genre.html">张三</td>
                                            <td>United Kingdom</a></td>
                                            <td>
                                                <a href="comedy.html">胡歌</a></td>
                                            <td>7.0</td></tr>
                                        <tr>
                                            <td>9</td>
                                            <td class="w3-list-img">
                                                <a href="single.html">
                                                    <img src="images/m8.jpg" alt="" />
                                                    <span>Timeless</span></a>
                                            </td>
                                            <td>2016</td>
                                            <td>
                                                <a href="genre.html">张三</td>
                                            <td>United Kingdom</a></td>
                                            <td>
                                                <a href="comedy.html">胡歌</a></td>
                                            <td>7.0</td></tr>
                                        <tr>
                                            <td>10</td>
                                            <td class="w3-list-img">
                                                <a href="single.html">
                                                    <img src="images/m9.jpg" alt="" />
                                                    <span>Inferno</span></a>
                                            </td>
                                            <td>2016</td>
                                            <td>
                                                <a href="genre.html">张三</td>
                                            <td>United Kingdom</a></td>
                                            <td>
                                                <a href="comedy.html">胡歌</a></td>
                                            <td>7.0</td></tr>
                                        <tr>
                                            <td>11</td>
                                            <td class="w3-list-img">
                                                <a href="single.html">
                                                    <img src="images/m10.jpg" alt="" />
                                                    <span>Now You See Me 2</span></a>
                                            </td>
                                            <td>2016</td>
                                            <td>
                                                <a href="genre.html">张三</td>
                                            <td>United Kingdom</a></td>
                                            <td>
                                                <a href="comedy.html">胡歌</a></td>
                                            <td>7.0</td></tr>
                                        <tr>
                                            <td>12</td>
                                            <td class="w3-list-img">
                                                <a href="single.html">
                                                    <img src="images/m1.jpg" alt="" />
                                                    <span>Swiss Army Man</span></a>
                                            </td>
                                            <td>2016</td>
                                            <td>
                                                <a href="genre.html">张三</td>
                                            <td>United Kingdom</a></td>
                                            <td>
                                                <a href="comedy.html">胡歌</a></td>
                                            <td>7.0</td></tr>
                                        <tr>
                                            <td>13</td>
                                            <td class="w3-list-img">
                                                <a href="single.html">
                                                    <img src="images/m2.jpg" alt="" />
                                                    <span>Me Before you</span></a>
                                            </td>
                                            <td>2016</td>
                                            <td>
                                                <a href="genre.html">张三</td>
                                            <td>United Kingdom</a></td>
                                            <td>
                                                <a href="comedy.html">胡歌</a></td>
                                            <td>7.0</td></tr>
                                        <tr>
                                            <td>14</td>
                                            <td class="w3-list-img">
                                                <a href="single.html">
                                                    <img src="images/m11.jpg" alt="" />
                                                    <span>Warcraft</span></a>
                                            </td>
                                            <td>2016</td>
                                            <td>
                                                <a href="genre.html">张三</td>
                                            <td>United Kingdom</a></td>
                                            <td>
                                                <a href="comedy.html">胡歌</a></td>
                                            <td>7.0</td></tr>
                                        <tr>
                                            <td>15</td>
                                            <td class="w3-list-img">
                                                <a href="single.html">
                                                    <img src="images/m3.jpg" alt="" />
                                                    <span>Deadpool</span></a>
                                            </td>
                                            <td>2016</td>
                                            <td>
                                                <a href="genre.html">张三</td>
                                            <td>United Kingdom</a></td>
                                            <td>
                                                <a href="comedy.html">胡歌</a></td>
                                            <td>7.0</td></tr>
                                        <tr>
                                            <td>16</td>
                                            <td class="w3-list-img">
                                                <a href="single.html">
                                                    <img src="images/m4.jpg" alt="" />
                                                    <span>Rogue One</span></a>
                                            </td>
                                            <td>2016</td>
                                            <td>
                                                <a href="genre.html">张三</td>
                                            <td>United Kingdom</a></td>
                                            <td>
                                                <a href="comedy.html">胡歌</a></td>
                                            <td>7.0</td></tr>
                                        <tr>
                                            <td>17</td>
                                            <td class="w3-list-img">
                                                <a href="single.html">
                                                    <img src="images/m5.jpg" alt="" />
                                                    <span>Storks</span></a>
                                            </td>
                                            <td>2016</td>
                                            <td>
                                                <a href="genre.html">张三</td>
                                            <td>United Kingdom</a></td>
                                            <td>
                                                <a href="comedy.html">胡歌</a></td>
                                            <td>7.0</td></tr>
                                        <tr>
                                            <td>18</td>
                                            <td class="w3-list-img">
                                                <a href="single.html">
                                                    <img src="images/m6.jpg" alt="" />
                                                    <span>Hopeless</span></a>
                                            </td>
                                            <td>2016</td>
                                            <td>
                                                <a href="genre.html">张三</td>
                                            <td>United Kingdom</a></td>
                                            <td>
                                                <a href="comedy.html">胡歌</a></td>
                                            <td>7.0</td></tr>
                                        <tr>
                                            <td>19</td>
                                            <td class="w3-list-img">
                                                <a href="single.html">
                                                    <img src="images/m7.jpg" alt="" />
                                                    <span>Mechanic</span></a>
                                            </td>
                                            <td>2016</td>
                                            <td>
                                                <a href="genre.html">张三</td>
                                            <td>United Kingdom</a></td>
                                            <td>
                                                <a href="comedy.html">胡歌</a></td>
                                            <td>7.0</td></tr>
                                        <tr>
                                            <td>20</td>
                                            <td class="w3-list-img">
                                                <a href="single.html">
                                                    <img src="images/m8.jpg" alt="" />
                                                    <span>Timeless</span></a>
                                            </td>
                                            <td>2016</td>
                                            <td>
                                                <a href="genre.html">张三</td>
                                            <td>United Kingdom</a></td>
                                            <td>
                                                <a href="comedy.html">胡歌</a></td>
                                            <td>7.0</td></tr>
                                        <tr>
                                            <td>21</td>
                                            <td class="w3-list-img">
                                                <a href="single.html">
                                                    <img src="images/m9.jpg" alt="" />
                                                    <span>Inferno</span></a>
                                            </td>
                                            <td>2016</td>
                                            <td>
                                                <a href="genre.html">张三</td>
                                            <td>United Kingdom</a></td>
                                            <td>
                                                <a href="comedy.html">胡歌</a></td>
                                            <td>7.0</td></tr>
                                        <tr>
                                            <td>22</td>
                                            <td class="w3-list-img">
                                                <a href="single.html">
                                                    <img src="images/m10.jpg" alt="" />
                                                    <span>Now You See Me 2</span></a>
                                            </td>
                                            <td>2016</td>
                                            <td>
                                                <a href="genre.html">张三</td>
                                            <td>United Kingdom</a></td>
                                            <td>
                                                <a href="comedy.html">胡歌</a></td>
                                            <td>7.0</td></tr>
                                        <tr>
                                            <td>23</td>
                                            <td class="w3-list-img">
                                                <a href="single.html">
                                                    <img src="images/m1.jpg" alt="" />
                                                    <span>Swiss Army Man</span></a>
                                            </td>
                                            <td>2016</td>
                                            <td>
                                                <a href="genre.html">张三</td>
                                            <td>United Kingdom</a></td>
                                            <td>
                                                <a href="comedy.html">胡歌</a></td>
                                            <td>7.0</td></tr>
                                        <tr>
                                            <td>24</td>
                                            <td class="w3-list-img">
                                                <a href="single.html">
                                                    <img src="images/m2.jpg" alt="" />
                                                    <span>Me Before you</span></a>
                                            </td>
                                            <td>2016</td>
                                            <td>
                                                <a href="genre.html">张三</td>
                                            <td>United Kingdom</a></td>
                                            <td>
                                                <a href="comedy.html">胡歌</a></td>
                                            <td>7.0</td></tr>
                                        <tr>
                                            <td>25</td>
                                            <td class="w3-list-img">
                                                <a href="single.html">
                                                    <img src="images/m11.jpg" alt="" />
                                                    <span>Warcraft</span></a>
                                            </td>
                                            <td>2016</td>
                                            <td>
                                                <a href="genre.html">张三</td>
                                            <td>United Kingdom</a></td>
                                            <td>
                                                <a href="comedy.html">胡歌</a></td>
                                            <td>7.0</td></tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!-- <div role="tabpanel" class="tab-pane fade" id="a" aria-labelledby="a-tab"> --></div>
                </div>
            </div>
        </div>
</asp:Content>

