﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MovieManager.aspx.cs" Inherits="NewsManager" %>
    <!DOCTYPE html>
    <html xmlns="http://www.w3.org/1999/xhtml">
        
        <head runat="server">
            <title></title>
            <style>
                .addbtn { float:right; width:100px; height:28px; position:relative; top:9px; right:2px; }
                .gridheader {text-align:center; height:40px;font-family:'Microsoft YaHei';font-weight:normal;}
                .griditem {text-align:center;height: 40px;font-family:'Microsoft YaHei';font-weight:normal;}
            </style>
            <meta name="viewport" content="width=device-width, initial-scale=1" />
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
            <meta name="" />
            <script type="application/x-javascript">addEventListener("load",
                function() {
                    setTimeout(hideURLbar, 0);
                },
                false);
                function hideURLbar() {
                    window.scrollTo(0, 1);
                }</script>
            <!-- //for-mobile-apps -->
            <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
            <!-- pop-up -->
            <link href="css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
            <!-- //pop-up -->
            <link href="css/easy-responsive-tabs.css" rel='stylesheet' type='text/css' />
            <link rel="stylesheet" type="text/css" href="css/zoomslider.css" />
            <link rel="stylesheet" type="text/css" href="css/style.css" />
            <link href="css/font-awesome.css" rel="stylesheet" />
            <script type="text/javascript" src="js/modernizr-2.6.2.min.js"></script>
            <!--/web-fonts-->
            <link href='http://fonts.googleapis.com/css?family=Tangerine:400,700' rel='stylesheet' type='text/css' />
            <link href="http://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900" rel="stylesheet" />
            <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css' /></head>
        
        <body style="font-family: 'Microsoft YaHei'">
            <div id="demo-1" class="banner-inner">
                <div class="banner-inner-dott">
                    <!--/header-w3l-->
                    <div class="header-w3-agileits" id="home">
                        <div class="inner-header-agile part2">
                            <nav class="navbar navbar-default">
                                <div class="navbar-header">
                                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                                        <span class="sr-only">Toggle navigation</span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                    </button>
                                    <h1>
                                        <a href="index.html">
                                            <span>M</span>ovies
                                            <span>P</span>ro</a></h1>
                                </div>
                                <!-- navbar-header -->
                                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                                    <ul class="nav navbar-nav">
                                        <li class="active">
                                            <a href="index.html">Home</a></li>
                                        <li class="dropdown">
                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Genre
                                                <b class="caret"></b></a>
                                            <ul class="dropdown-menu multi-column columns-3">
                                                <li>
                                                    <!-- 恢复 -->
                                                    <div class="col-sm-4">
                                                        <ul class="multi-column-dropdown">
                                                            <li>
                                                                <a href="action.html">Action</a></li>
                                                            <li>
                                                                <a href="genre.html">Biography</a></li>
                                                            <li>
                                                                <a href="genre.html">Crime</a></li>
                                                            <li>
                                                                <a href="genre.html">Family</a></li>
                                                            <li>
                                                                <a href="horror.html">Horror</a></li>
                                                            <li>
                                                                <a href="genre.html">Romance</a></li>
                                                            <li>
                                                                <a href="genre.html">Sports</a></li>
                                                            <li>
                                                                <a href="genre.html">War</a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <ul class="multi-column-dropdown">
                                                            <li>
                                                                <a href="genre.html">Adventure</a></li>
                                                            <li>
                                                                <a href="comedy.html">Comedy</a></li>
                                                            <li>
                                                                <a href="genre.html">Documentary</a></li>
                                                            <li>
                                                                <a href="genre.html">Fantasy</a></li>
                                                            <li>
                                                                <a href="genre.html">Thriller</a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <ul class="multi-column-dropdown">
                                                            <li>
                                                                <a href="genre.html">Animation</a></li>
                                                            <li>
                                                                <a href="genre.html">Costume</a></li>
                                                            <li>
                                                                <a href="genre.html">Drama</a></li>
                                                            <li>
                                                                <a href="genre.html">History</a></li>
                                                            <li>
                                                                <a href="genre.html">Musical</a></li>
                                                            <li>
                                                                <a href="genre.html">Psychological</a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </li>
                                            </ul>
                                        </li>
                                        <!-- 恢复 -->
                                        <li>
                                            <a href="series.html">User</a></li>
                                </div>
                                <div class="clearfix"></div>
                            </nav>
                            <div class="w3ls_search">
                                <div class="cd-main-header">
                                    <ul class="cd-header-buttons">
                                        <li>
                                            <a class="cd-search-trigger" href="#cd-search">
                                                <span></span>
                                            </a>
                                        </li>
                                    </ul>
                                    <!-- cd-header-buttons --></div>
                                <div id="cd-search" class="cd-search">
                                    <form action="#" method="post">
                                        <input name="Search" type="search" placeholder="Search..."></form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--//header-w3l--></div>
            </div>
            <!--/banner-section-->
            <!--//main-header-->
            <!--/banner-bottom-->
            <div class="w3_agilits_banner_bootm">
                <div class="w3_agilits_inner_bottom">
                    <div class="col-md-6 wthree_agile_login">
                        <ul>
                            <!-- <li><i class="fa fa-phone" aria-hidden="true"></i> (+000) 009 455 4088</li> -->
                            <li>
                                <a href="#" class="login" data-toggle="modal" data-target="#myModal4">Login</a></li>
                            <li>
                                <a href="#" class="login reg" data-toggle="modal" data-target="#myModal5">Register</a></li>
                        </ul>
                    </div>
                    <div class="col-md-6 wthree_share_agile"></div>
                </div>
            </div>
            <!--//banner-bottom-->
            <!-- Modal1 -->
            <div class="modal fade" id="myModal4" tabindex="-1" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4>Login</h4>
                            <div class="login-form">
                                <form action="#" method="post">
                                    <input type="email" name="email" placeholder="E-mail" required="">
                                    <input type="password" name="password" placeholder="Password" required="">
                                    <div class="tp">
                                        <input type="submit" value="LOGIN NOW"></div>
                                    <div class="forgot-grid">
                                        <div class="log-check">
                                            <label class="checkbox">
                                                <input type="checkbox" name="checkbox">Remember me</label></div>
                                        <div class="forgot">
                                            <a href="#" data-toggle="modal" data-target="#myModal2">Forgot Password?</a></div>
                                        <div class="clearfix"></div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- //Modal1 -->
            <!-- Modal1 -->
            <div class="modal fade" id="myModal5" tabindex="-1" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4>Register</h4>
                            <div class="login-form">
                                <form action="#" method="post">
                                    <input type="text" name="name" placeholder="Name" required=""/>
                                    <input type="email" name="email" placeholder="E-mail" required=""/>
                                    <input type="password" name="password" placeholder="Password" required=""/>
                                    <input type="password" name="conform password" placeholder="Confirm Password" required=""/>
                                    <div class="signin-rit">
                                        <span class="agree-checkbox">
                                            <label class="checkbox">
                                                <input type="checkbox" name="checkbox">I agree to your
                                                <a class="w3layouts-t" href="#" target="_blank">Terms of Use</a>and
                                                <a class="w3layouts-t" href="#" target="_blank">Privacy Policy</a></label>
                                        </span>
                                    </div>
                                    <div class="tp">
                                        <input type="submit" value="REGISTER NOW"/></div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- //Modal1 -->
            <!-- breadcrumb -->
            <div class="w3_breadcrumb">
                <!-- <div class="breadcrumb-inner">	
                <ul>
                <li><a href="index.html">Home</a><i>//</i></li>
                <li>Single</li></ul></div> -->
            </div>
            <form id="form1" runat="server">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSourceMovie" ForeColor="#333333" GridLines="None" Width="100%" OnRowCommand="GridView1_RowCommand">
                    <AlternatingRowStyle BackColor="White" Font-Bold="True" Font-Names="microsoft-yahei" />
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="ID" SortExpression="id" HeaderStyle-HorizontalAlign="Center" HeaderStyle-CssClass="gridheader" ReadOnly="True" ItemStyle-CssClass="griditem">
<HeaderStyle HorizontalAlign="Center" CssClass="gridheader"></HeaderStyle>

<ItemStyle CssClass="griditem"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="name" HeaderText="电影名称" SortExpression="name"  HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem">
<HeaderStyle CssClass="gridheader"></HeaderStyle>

<ItemStyle CssClass="griditem"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="description" HeaderText="剧情简介" SortExpression="description"  HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem">
<HeaderStyle CssClass="gridheader"></HeaderStyle>

<ItemStyle CssClass="griditem"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="year" HeaderText="上映年份" SortExpression="year"  HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem">
<HeaderStyle CssClass="gridheader"></HeaderStyle>

<ItemStyle CssClass="griditem"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="country" HeaderText="国家" SortExpression="country"  HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem">
<HeaderStyle CssClass="gridheader"></HeaderStyle>

<ItemStyle CssClass="griditem"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="star" HeaderText="星级" SortExpression="star"  HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem">
<HeaderStyle CssClass="gridheader"></HeaderStyle>

<ItemStyle CssClass="griditem"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="genre" HeaderText="电影类型" SortExpression="genre"  HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem">
<HeaderStyle CssClass="gridheader"></HeaderStyle>

<ItemStyle CssClass="griditem"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="allsales" HeaderText="总票房" SortExpression="allsales"  HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem">

<HeaderStyle CssClass="gridheader"></HeaderStyle>

<ItemStyle CssClass="griditem"></ItemStyle>
                        </asp:BoundField>

                        <asp:CommandField EditText="编辑" ShowEditButton="True" />
                        <asp:CommandField ShowDeleteButton="True" DeleteText="删除" />


                        <asp:ButtonField Text="编辑其它" HeaderStyle-CssClass="gridheader" ItemStyle-CssClass="griditem" CommandName="UpdateExtra" InsertVisible="False" ButtonType="Button">
<HeaderStyle CssClass="gridheader"></HeaderStyle>

<ItemStyle CssClass="griditem"></ItemStyle>
                        </asp:ButtonField>
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                    <SortedDescendingHeaderStyle BackColor="#820000" />
                </asp:GridView>

                <asp:SqlDataSource ID="SqlDataSourceMovie" runat="server" ConnectionString="<%$ ConnectionStrings:movie %>" 
                    SelectCommand="SELECT movie.* FROM movie"
                    DeleteCommand="DELETE FROM movie WHERE (id = @id)"
                    UpdateCommand="Update movie set name=@name, allsales=@allsales, description=@description, genre=@genre, country=@country, star=@star, year=@year WHERE (id=@id)"
                   ></asp:SqlDataSource>

            </form>


            <div class="w3agile_footer_copy">
                <p>Copyright &copy; 2017. Movie Expert All rights reserved.</p>
            </div>
            <a href="#home" id="toTop" class="scroll" style="display: block; left: 1101px;">
                <span id="toTopHover" style="opacity: 1;"></span>
            </a>
            <script src="js/jquery-1.11.1.min.js"></script>
            <!-- Dropdown-Menu-JavaScript -->
            <script>$(document).ready(function() {
                    $(".dropdown").hover(function() {
                        $('.dropdown-menu', this).stop(true, true).slideDown("fast");
                        $(this).toggleClass('open');
                    },
                    function() {
                        $('.dropdown-menu', this).stop(true, true).slideUp("fast");
                        $(this).toggleClass('open');
                    });
                });</script>
            <!-- //Dropdown-Menu-JavaScript -->
            <!-- search-jQuery -->
            <script src="js/main.js"></script>
            <script src="js/simplePlayer.js"></script>
            <script>$("document").ready(function() {
                    $("#video").simplePlayer();
                });</script>
            <script>$("document").ready(function() {
                    $("#video1").simplePlayer();
                });</script>
            <script>$("document").ready(function() {
                    $("#video2").simplePlayer();
                });</script>
            <script>$("document").ready(function() {
                    $("#video3").simplePlayer();
                });</script>
            <script>$("document").ready(function() {
                    $("#video4").simplePlayer();
                });</script>
            <script>$("document").ready(function() {
                    $("#video5").simplePlayer();
                });</script>
            <script>$("document").ready(function() {
                    $("#video6").simplePlayer();
                });</script>
            <script>$("document").ready(function() {
                    $("#video6").simplePlayer();
                });</script>
            <!-- pop-up-box -->
            <script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
            <!--//pop-up-box -->
            <div id="small-dialog1" class="mfp-hide">
                <iframe src=""></iframe>
            </div>
            <div id="small-dialog2" class="mfp-hide">
                <iframe src=""></iframe>
            </div>
            <script>$(document).ready(function() {
                    $('.w3_play_icon,.w3_play_icon1,.w3_play_icon2').magnificPopup({
                        type: 'inline',
                        fixedContentPos: false,
                        fixedBgPos: true,
                        overflowY: 'auto',
                        closeBtnInside: true,
                        preloader: false,
                        midClick: true,
                        removalDelay: 300,
                        mainClass: 'my-mfp-zoom-in'
                    });

                });</script>
            <script src="js/easy-responsive-tabs.js"></script>
            <script>$(document).ready(function() {
                    $('#horizontalTab').easyResponsiveTabs({
                        type: 'default',
                        //Types: default, vertical, accordion           
                        width: 'auto',
                        //auto or any width like 600px
                        fit: true,
                        // 100% fit in a container
                        closed: 'accordion',
                        // Start closed if in accordion view
                        activate: function(event) { // Callback function if tab is switched
                            var $tab = $(this);
                            var $info = $('#tabInfo');
                            var $name = $('span', $info);
                            $name.text($tab.text());
                            $info.show();
                        }
                    });
                    $('#verticalTab').easyResponsiveTabs({
                        type: 'vertical',
                        width: 'auto',
                        fit: true
                    });
                });</script>
            <link href="css/owl.carousel.css" rel="stylesheet" type="text/css" media="all">
            <script src="js/owl.carousel.js"></script>
            <script>$(document).ready(function() {
                    $("#owl-demo").owlCarousel({

                        autoPlay: 3000,
                        //Set AutoPlay to 3 seconds
                        autoPlay: true,
                        navigation: true,

                        items: 5,
                        itemsDesktop: [640, 4],
                        itemsDesktopSmall: [414, 3]

                    });

                });</script>
            <!--/script-->
            <script type="text/javascript" src="js/move-top.js"></script>
            <script type="text/javascript" src="js/easing.js"></script>
            <script type="text/javascript">jQuery(document).ready(function($) {
                    $(".scroll").click(function(event) {
                        event.preventDefault();
                        $('html,body').animate({
                            scrollTop: $(this.hash).offset().top
                        },
                        900);
                    });
                });</script>
            <script type="text/javascript">$(document).ready(function() {
                    /*
							var defaults = {
					  			containerID: 'toTop', // fading element id
								containerHoverID: 'toTopHover', // fading element hover id
								scrollSpeed: 1200,
								easingType: 'linear' 
					 		};
							*/

                    $().UItoTop({
                        easingType: 'easeOutQuart'
                    });

                });</script>
            <!--end-smooth-scrolling-->
            <script src="js/bootstrap.js"></script>
        </body>
    
    </html>