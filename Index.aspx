﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home</title>
    <!-- for-mobile-apps -->
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
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
    <link href="css/font-awesome.css" rel="stylesheet"/>
    <script type="text/javascript" src="js/modernizr-2.6.2.min.js"></script>
    <!--/web-fonts-->
    <link href='http://fonts.googleapis.com/css?family=Tangerine:400,700' rel='stylesheet' type='text/css'/>
    <link href="http://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900" rel="stylesheet"/>
    <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'/>
</head>

<body runat="server">
    <div id="demo-1" data-zs-src='["images/2.jpg", "images/1.jpg", "images/3.jpg","images/4.jpg"]' data-zs-overlay="dots">
            <div class="demo-inner-content">
                <!--/header-w3l-->
                <div class="header-w3-agileits" id="home">
                    <div class="inner-header-agile">
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
                                    <!-- 恢复注视 --><li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">Genre <b class="caret"></b></a>
								<ul class="dropdown-menu multi-column columns-3">
									<li>
                                        <%# getGenreHtmls() %>
                                       
									    <div class="clearfix"></div>
									</li>
								</ul>
							</li><!-- 恢复注释 -->
                                    <li>
                                        <a runat="server" id="Username" onmouseover="False" onfocus="false"><%# getUserNameText() %></a>

                                    </li>
                                   <!-- <li>
                                        <a href="contact.html">Contact</a></li> -->
                                </ul>
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
                                <form action="?action=search" method="post">
                                    <input name="Search" type="search" placeholder="Search..."/></form>
                            </div>
                        </div>
                    </div>
                </div>
                <!--//header-w3l-->
                <!--/banner-info-->
                <div class="baner-info">
                    <h3>Latest
                        <span>On</span>Line
                        <span>Mo</span>vies</h3>
                </div>
            </div>
        </div>
        
        <div class="w3_agilits_banner_bootm">
            <div class="w3_agilits_inner_bottom">
                <div class="col-md-6 wthree_agile_login">
                    <ul>
                         <li><a href="<%# getLoginButtonUrl() %>" class="login"  data-toggle="modal" data-target="<%# getLoginButtonDataTarget() %>"><%# getLoginButtonText() %></a></li>
							<li><a href="<%# getRegisterButtonUrl() %>" class="login reg"  data-toggle="modal" data-target="<%# getRegisterButtonDataTarget() %>"><%# getRegisterButtonText() %></a></li>
                    </ul>
                </div>
            </div>
        </div>
        
        <div class="modal fade" id="myModal4" tabindex="-1" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4>Login</h4>
                        <div class="login-form">
                            <form action="?action=login" method="post">
                                <input type="email" name="email" placeholder="E-mail" required=""/>
                                <input type="password" name="password" placeholder="Password" required=""/>
                                <div class="tp">
                                    <input type="submit" value="LOGIN NOW"/>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="modal fade" id="myModal5" tabindex="-1" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4>Register</h4>
                        <div class="login-form">
                            <form action="?action=register" method="post">
                                <input type="text" name="name" placeholder="Name" required=""/>
                                <input type="email" name="email" placeholder="E-mail" required=""/>
                                <input type="password" name="password" placeholder="Password" required=""/>
                                <!--<input type="password" name="conform password" placeholder="Confirm Password" required=""/> -->
                                
                                <!--
                                <div class="signin-rit">
                                    
                                    <span class="agree-checkbox">
                                        <label class="checkbox">
                                            <input type="checkbox" name="checkbox"/>I agree to your
                                            <a class="w3layouts-t" href="#" target="_blank">Terms of Use</a>and
                                            <a class="w3layouts-t" href="#" target="_blank">Privacy Policy</a></label>
                                    </span>
                                   
                                </div>
                                         -->
                                <div class="tp">
                                    <input type="submit" value="REGISTER NOW"/></div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="w3_content_agilleinfo_inner">
            <div class="agile_featured_movies">
                <!--/agileinfo_tabs-->
                <div class="agileinfo_tabs">
                    <!--/tab-section-->
                    <div id="horizontalTab">
                        <div class="resp-tabs-container"></div>
                    </div>
                </div>

                <!-- 电影墙 -->
                <div class="wthree_agile-requested-movies">
                    <!-- 第一个电影 -->
                    <div class="col-md-2 w3l-movie-gride-agile requested-movies">
                        <a href="Single.aspx?id=<%# mMovie[0].id %>" class="hvr-sweep-to-bottom">
                            <img src="<%# mMovie[0].getIndexImage() %>" title="Movies Pro" class="img-responsive" alt=" "/>
                            <div class="w3l-action-icon">
                               <!-- <i class="fa fa-play-circle-o" aria-hidden="true"></i> -->
                            </div>
                        </a>
                        <div class="mid-1 agileits_w3layouts_mid_1_home">
                            <div class="w3l-movie-text">
                                <h6>
                                    <a href="Single.aspx?id=<%# mMovie[0].id %>"><%# mMovie[0].name %></a></h6>
                            </div>
                            <div class="mid-2 agile_mid_2_home">
                                <p><%# mMovie[0].year %></p>
                                <div class="block-stars">
                                    <ul class="w3l-ratings">
                                        <%# getStarRatingHtmls(0) %>
                                    </ul>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                        <!--
                        <div class="ribben one">
                            <p>NEW</p>
                        </div>
                        -->
                    </div>

                    <!--第二个电影-->
                    <div class="col-md-2 w3l-movie-gride-agile requested-movies">
                        <a href="Single.aspx?id=<%# mMovie[1].id %>" class="hvr-sweep-to-bottom">
                            <img src="<%# mMovie[1].getIndexImage() %>" title="Movies Pro" class="img-responsive" alt=" "/>
                            <div class="w3l-action-icon">
                               <!-- <i class="fa fa-play-circle-o" aria-hidden="true"></i> -->
                            </div>
                        </a>
                        <div class="mid-1 agileits_w3layouts_mid_1_home">
                            <div class="w3l-movie-text">
                                <h6>
                                    <a href="Single.aspx?id=<%# mMovie[1].id %>"><%# mMovie[1].name %></a></h6>
                            </div>
                            <div class="mid-2 agile_mid_2_home">
                                <p><%# mMovie[1].year %></p>
                                <div class="block-stars">
                                    <ul class="w3l-ratings">
                                        <%# getStarRatingHtmls(1) %>
                                    </ul>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                       <!--
                         <div class="ribben one">
                            <p>NEW</p>
                        </div>
                        -->
                    </div>

                    <!--第三个电影-->
                    <div class="col-md-2 w3l-movie-gride-agile requested-movies">
                        <a href="Single.aspx?id=<%# mMovie[2].id %>" class="hvr-sweep-to-bottom">
                            <img src="<%# mMovie[2].getIndexImage() %>" title="Movies Pro" class="img-responsive" alt=" "/>
                            <div class="w3l-action-icon">
                               <!-- <i class="fa fa-play-circle-o" aria-hidden="true"></i> -->
                            </div>
                        </a>
                        <div class="mid-1 agileits_w3layouts_mid_1_home">
                            <div class="w3l-movie-text">
                                <h6>
                                    <a href="Single.aspx?id=<%# mMovie[2].id %>"><%# mMovie[2].name %></a></h6>
                            </div>
                            <div class="mid-2 agile_mid_2_home">
                                <p><%# mMovie[2].year %></p>
                                <div class="block-stars">
                                    <ul class="w3l-ratings">
                                        <%# getStarRatingHtmls(2) %>
                                    </ul>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                        <!--
                        <div class="ribben one">
                            <p>NEW</p>
                        </div>
                        -->
                    </div>

                    <!--第四个电影-->
                    <div class="col-md-2 w3l-movie-gride-agile requested-movies">
                        <a href="Single.aspx?id=<%# mMovie[3].id %>" class="hvr-sweep-to-bottom">
                            <img src="<%# mMovie[3].getIndexImage() %>" title="Movies Pro" class="img-responsive" alt=" "/>
                            <div class="w3l-action-icon">
                               <!-- <i class="fa fa-play-circle-o" aria-hidden="true"></i> -->
                            </div>
                        </a>
                        <div class="mid-1 agileits_w3layouts_mid_1_home">
                            <div class="w3l-movie-text">
                                <h6>
                                    <a href="Single.aspx?id=<%# mMovie[3].id %>"><%# mMovie[3].name %></a></h6>
                            </div>
                            <div class="mid-2 agile_mid_2_home">
                                <p><%# mMovie[3].year %></p>
                                <div class="block-stars">
                                    <ul class="w3l-ratings">
                                        <%# getStarRatingHtmls(3) %>
                                    </ul>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                        <!--
                        <div class="ribben one">
                            <p>NEW</p>
                        </div>
                        -->
                    </div>

                    <!--第五个电影-->
                    <div class="col-md-2 w3l-movie-gride-agile requested-movies">
                        <a href="Single.aspx?id=<%# mMovie[4].id %>" class="hvr-sweep-to-bottom">
                            <img src="<%# mMovie[4].getIndexImage() %>" title="Movies Pro" class="img-responsive" alt=" "/>
                            <div class="w3l-action-icon">
                            </div>
                        </a>
                        <div class="mid-1 agileits_w3layouts_mid_1_home">
                            <div class="w3l-movie-text">
                                <h6>
                                    <a href="Single.aspx?id=<%# mMovie[4].id %>"><%# mMovie[4].name %></a></h6>
                            </div>
                            <div class="mid-2 agile_mid_2_home">
                                <p><%# mMovie[4].year %></p>
                                <div class="block-stars">
                                    <ul class="w3l-ratings">
                                        <%# getStarRatingHtmls(4) %>
                                    </ul>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>

                    <!--第六个电影-->
                    <div class="col-md-2 w3l-movie-gride-agile requested-movies">
                        <a href="Single.aspx?id=<%# mMovie[5].id %>" class="hvr-sweep-to-bottom">
                            <img src="<%# mMovie[5].getIndexImage() %>" title="Movies Pro" class="img-responsive" alt=" "/>
                            <div class="w3l-action-icon">
                            </div>
                        </a>
                        <div class="mid-1 agileits_w3layouts_mid_1_home">
                            <div class="w3l-movie-text">
                                <h6>
                                    <a href="Single.aspx?id=<%# mMovie[5].id %>"><%# mMovie[5].name %></a></h6>
                            </div>
                            <div class="mid-2 agile_mid_2_home">
                                <p><%# mMovie[5].year %></p>
                                <div class="block-stars">
                                    <ul class="w3l-ratings">
                                        <%# getStarRatingHtmls(5) %>
                                    </ul>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                        <!--
                        <div class="ribben one">
                            <p>NEW</p>
                        </div>
                        -->
                    </div>

                    <!--第七个电影-->
                    <div class="col-md-2 w3l-movie-gride-agile requested-movies">
                        <a href="Single.aspx?id=<%# mMovie[6].id %>" class="hvr-sweep-to-bottom">
                            <img src="<%# mMovie[6].getIndexImage() %>" title="Movies Pro" class="img-responsive" alt=" "/>
                            <div class="w3l-action-icon">
                               <!-- <i class="fa fa-play-circle-o" aria-hidden="true"></i> -->
                            </div>
                        </a>
                        <div class="mid-1 agileits_w3layouts_mid_1_home">
                            <div class="w3l-movie-text">
                                <h6>
                                    <a href="Single.aspx?id=<%# mMovie[6].id %>"><%# mMovie[6].name %></a></h6>
                            </div>
                            <div class="mid-2 agile_mid_2_home">
                                <p><%# mMovie[6].year %></p>
                                <div class="block-stars">
                                    <ul class="w3l-ratings">
                                        <%# getStarRatingHtmls(6) %>
                                    </ul>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                        <!--
                        <div class="ribben one">
                            <p>NEW</p>
                        </div>
                        -->
                    </div>

                    <!--第八个电影-->
                    <div class="col-md-2 w3l-movie-gride-agile requested-movies">
                        <a href="Single.aspx?id=<%# mMovie[7].id %>" class="hvr-sweep-to-bottom">
                            <img src="<%# mMovie[7].getIndexImage() %>" title="Movies Pro" class="img-responsive" alt=" "/>
                            <div class="w3l-action-icon">
                              <!--  <i class="fa fa-play-circle-o" aria-hidden="true"></i> -->
                            </div>
                        </a>
                        <div class="mid-1 agileits_w3layouts_mid_1_home">
                            <div class="w3l-movie-text">
                                <h6>
                                    <a href="Single.aspx?id=<%# mMovie[7].id %>"><%# mMovie[7].name %></a></h6>
                            </div>
                            <div class="mid-2 agile_mid_2_home">
                                <p><%# mMovie[7].year %></p>
                                <div class="block-stars">
                                    <ul class="w3l-ratings">
                                        <%# getStarRatingHtmls(7) %>
                                    </ul>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                        <!--
                        <div class="ribben one">
                            <p>NEW</p>
                        </div>
                        -->
                    </div>

                    <!--第九个电影-->
                    <div class="col-md-2 w3l-movie-gride-agile requested-movies">
                        <a href="Single.aspx?id=<%# mMovie[8].id %>" class="hvr-sweep-to-bottom">
                            <img src="<%# mMovie[8].getIndexImage() %>" title="Movies Pro" class="img-responsive" alt=" "/>
                            <div class="w3l-action-icon">
                               <!-- <i class="fa fa-play-circle-o" aria-hidden="true"></i> -->
                            </div>
                        </a>
                        <div class="mid-1 agileits_w3layouts_mid_1_home">
                            <div class="w3l-movie-text">
                                <h6>
                                    <a href="Single.aspx?id=<%# mMovie[8].id %>"><%# mMovie[8].name %></a></h6>
                            </div>
                            <div class="mid-2 agile_mid_2_home">
                                <p><%# mMovie[8].year %></p>
                                <div class="block-stars">
                                    <ul class="w3l-ratings">
                                        <%# getStarRatingHtmls(8) %>
                                    </ul>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                        <!--
                        <div class="ribben one">
                            <p>NEW</p>
                        </div>
                        -->
                    </div>

                    <!--第十个电影-->
                    <div class="col-md-2 w3l-movie-gride-agile requested-movies">
                        <a href="Single.aspx?id=<%# mMovie[9].id %>" class="hvr-sweep-to-bottom">
                            <img src="<%# mMovie[9].getIndexImage() %>" title="Movies Pro" class="img-responsive" alt=" "/>
                            <div class="w3l-action-icon">
                                <!--<i class="fa fa-play-circle-o" aria-hidden="true"></i> -->
                            </div>
                        </a>
                        <div class="mid-1 agileits_w3layouts_mid_1_home">
                            <div class="w3l-movie-text">
                                <h6>
                                    <a href="Single.aspx?id=<%# mMovie[9].id %>"><%# mMovie[9].name %></a></h6>
                            </div>
                            <div class="mid-2 agile_mid_2_home">
                                <p><%# mMovie[9].year %></p>
                                <div class="block-stars">
                                    <ul class="w3l-ratings">
                                        <%# getStarRatingHtmls(9) %>
                                    </ul>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                        <!--
                        <div class="ribben one">
                            <p>NEW</p>
                        </div>
                        -->
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <!--//content-inner-section-->
       
        <div class="w3agile_footer_copy">
            <p>Copyright &copy; 2017. Movie Expert All rights reserved.</p>
        </div>
        <a href="#home" id="toTop" class="scroll" style="display: block;">
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
        <script type="text/javascript" src="js/jquery.zoomslider.min.js"></script>
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
                $().UItoTop({
                    easingType: 'easeOutQuart'
                });

            });</script>
        <!--end-smooth-scrolling-->
        <script src="js/bootstrap.js"></script>
</body>
</html>
