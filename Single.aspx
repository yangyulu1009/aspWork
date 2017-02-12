﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Single.aspx.cs" Inherits="Single" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Single Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- pop-up -->
<link href="css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
<!-- //pop-up -->
<link href="css/easy-responsive-tabs.css" rel='stylesheet' type='text/css'/>
<link rel="stylesheet" type="text/css" href="css/zoomslider.css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link href="css/font-awesome.css" rel="stylesheet"> 
<script type="text/javascript" src="js/modernizr-2.6.2.min.js"></script>
<!--/web-fonts-->
<link href='http://fonts.googleapis.com/css?family=Tangerine:400,700' rel='stylesheet' type='text/css'>
<link href="http://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900" rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<!--//web-fonts-->
</head>
<body>
   <!--/main-header-->
  <!--/banner-section-->
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
						<h1><a  href="index.html"><span>M</span>ovies <span>P</span>ro</a></h1>
					</div>
					<!-- navbar-header -->
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav">
							<li class="active"><a href="index.html">Home</a></li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">Genre <b class="caret"></b></a>
								<ul class="dropdown-menu multi-column columns-3">
									<li>
									<!-- 恢复 --><div class="col-sm-4">
										<ul class="multi-column-dropdown">
											<li><a href="action.html">Action</a></li>
											<li><a href="genre.html">Biography</a></li>
											<li><a href="genre.html">Crime</a></li>
											<li><a href="genre.html">Family</a></li>
											<li><a href="horror.html">Horror</a></li>
											<li><a href="genre.html">Romance</a></li>
											<li><a href="genre.html">Sports</a></li>
											<li><a href="genre.html">War</a></li>
										</ul>
									</div>
									<div class="col-sm-4">
										<ul class="multi-column-dropdown">
											<li><a href="genre.html">Adventure</a></li>
											<li><a href="comedy.html">Comedy</a></li>
											<li><a href="genre.html">Documentary</a></li>
											<li><a href="genre.html">Fantasy</a></li>
											<li><a href="genre.html">Thriller</a></li>
										</ul>
									</div>
									<div class="col-sm-4">
										<ul class="multi-column-dropdown">
											<li><a href="genre.html">Animation</a></li>
											<li><a href="genre.html">Costume</a></li>
											<li><a href="genre.html">Drama</a></li>
											<li><a href="genre.html">History</a></li>
											<li><a href="genre.html">Musical</a></li>
											<li><a href="genre.html">Psychological</a></li>
										</ul>
									</div>
									<div class="clearfix"></div>
									</li>
								</ul>
							</li> <!-- 恢复 -->
							<li><a href="series.html">User</a></li>
	

					</div>
					<div class="clearfix"> </div>	
				</nav>
					<div class="w3ls_search">
									<div class="cd-main-header">
										<ul class="cd-header-buttons">
											<li><a class="cd-search-trigger" href="#cd-search"> <span></span></a></li>
										</ul> <!-- cd-header-buttons -->
									</div>
									<div id="cd-search" class="cd-search">
										<form action="#" method="post">
											<input name="Search" type="search" placeholder="Search...">
										</form>
									</div>
								</div>
	
			</div> 

			   </div>
		<!--//header-w3l-->
		</div>
    </div>
  <!--/banner-section-->
 <!--//main-header-->
	         <!--/banner-bottom-->
			  <div class="w3_agilits_banner_bootm">
			     <div class="w3_agilits_inner_bottom">
			            <div class="col-md-6 wthree_agile_login">
						     <ul>
									<!-- <li><i class="fa fa-phone" aria-hidden="true"></i> (+000) 009 455 4088</li> -->
									<li><a href="#" class="login"  data-toggle="modal" data-target="#myModal4">Login</a></li>
									<li><a href="#" class="login reg"  data-toggle="modal" data-target="#myModal5">Register</a></li>

								</ul>
						</div>
						 <div class="col-md-6 wthree_share_agile">
				
						</div>
				</div>
			</div>
			<!--//banner-bottom-->
		     <!-- Modal1 -->
					<div class="modal fade" id="myModal4" tabindex="-1" role="dialog" >

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
													<input type="submit" value="LOGIN NOW">
												</div>
												<div class="forgot-grid">
												       <div class="log-check">
														<label class="checkbox"><input type="checkbox" name="checkbox">Remember me</label>
														</div>
														<div class="forgot">
															<a href="#" data-toggle="modal" data-target="#myModal2">Forgot Password?</a>
														</div>
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
					<div class="modal fade" id="myModal5" tabindex="-1" role="dialog" >

							<div class="modal-dialog">
							<!-- Modal content-->
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4>Register</h4>
										<div class="login-form">
											<form action="#" method="post">
											    <input type="text" name="name" placeholder="Name" required="">
												<input type="email" name="email" placeholder="E-mail" required="">
												<input type="password" name="password" placeholder="Password" required="">
												<input type="password" name="conform password" placeholder="Confirm Password" required="">
												<div class="signin-rit">
														<span class="agree-checkbox">
														<label class="checkbox"><input type="checkbox" name="checkbox">I agree to your <a class="w3layouts-t" href="#" target="_blank">Terms of Use</a> and <a class="w3layouts-t" href="#" target="_blank">Privacy Policy</a></label>
													</span>
												</div>
												<div class="tp">
													<input type="submit" value="REGISTER NOW">
												</div>
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
				
				<li>Single</li>
			</ul>
		</div> -->
	</div>
<!-- //breadcrumb -->
			<!--/content-inner-section-->
				<div class="w3_content_agilleinfo_inner">
						<div class="agile_featured_movies">
				            <div class="inner-agile-w3l-part-head">
					            <h3 class="w3l-inner-h-title">Single Page</h3>
								<p class="w3ls_head_para">Add short Description</p>
							</div>
							   <div class="latest-news-agile-info">
								   <div class="col-md-8 latest-news-agile-left-content">
											<div class="single video_agile_player">
											       
										            <div class="video-grid-single-page-agileits">
														<div data-video="f2Z65fobH2I" id="video"> <img src="images/1.jpg" alt="" class="img-responsive" /> </div>
													</div>
													 <!-- <h4>Force 2 | Official Trailer | John Abraham, Sonakshi Sinha and Tahir Raj Bhasin</h4> -->


													 <div class="player-text side-bar-info">
														<p class="fexi_header">Me Before You </p>
														<p class="fexi_header_para"><span class="conjuring_w3">Story Line<label>:</label></span>Me Before You Official Trailer #2 (2016) - Emilia Clarke, Sam Claflin Movie HD
														A girl in a small town forms an unlikely....</p>
														<p class="fexi_header_para"><span>Release On<label>:</label></span>Feb 3, 2016 </p>
														<!-- <p class="fexi_header_para">
															<span>Genres<label>:</label> </span>
															Drama|Adventure|Family
															<a href="genre.html">Drama</a> | 
															<a href="genre.html">Adventure</a> | 
															<a href="genre.html">Family</a>								
														</p> -->
														
														<p class="fexi_header_para"><span>Country<label>:</label></span>America</p>

														<p class="fexi_header_para"><span>Director<label>:</label></span><a href="https://en.wikipedia.org/wiki/Scott_DerricksonScott">Derrickson</a></p>
														<p class="fexi_header_para"><span>Writer<label>:</label></span><a href="https://en.wikipedia.org/wiki/Jon_Spaihts">Jon Spaihts</a></p>
														<p class="fexi_header_para"><span>Actor<label>:</label></span><a href="https://en.wikipedia.org/wiki/Benedict_Cumberbatch">Benedict Cumberbatch</a></p>
														<p class="fexi_header_para"><span>Genre<label>:</label></span><a href=" http://localhost/zxc/comedy.html ">Comedy</a></p>
														<p class="fexi_header_para"><span>Key Words<label>:</label></span>lov</p>


														

														<p class="fexi_header_para fexi_header_para1"><span>Star Rating<label>:</label></span>
														<!-- 	<a href="#"> --><i class="fa fa-star" aria-hidden="true"></i></a>
														<!-- 	<a href="#"> --><i class="fa fa-star" aria-hidden="true"></i></a>
														<!-- 	<a href="#"> --><i class="fa fa-star-half-o" aria-hidden="true"></i></a>
														<!-- 	<a href="#"> --><i class="fa fa-star-o" aria-hidden="true"></i></a>
															<!-- <a href="#"> --><i class="fa fa-star-o" aria-hidden="true"></i></a>
														</p>
														
													</div>
										    </div>
					

											<div class="clearfix"> </div>
										<div class="admin-text">
												<h5>Photographs</h5>
												<img src="images/admin.jpg" width="178" height="200" alt=""></a>
												<img src="images/admin.jpg" width="178" height="200" alt=""></a>
												<img src="images/admin.jpg" width="178" height="200" alt=""></a>
												<img src="images/admin.jpg" width="178" height="200" alt=""></a>
			
												<div class="clearfix"> </div>
										</div>
										<div class="admin-text">
												<h5>Videos</h5>
											    <a href="#"><img src="images/admin.jpg" width="178" height="200" alt=""></a>
												<a href="#"><img src="images/admin.jpg" width="178" height="200" alt=""></a>
												<a href="#"><img src="images/admin.jpg" width="178" height="200" alt=""></a>
												<a href="#"><img src="images/admin.jpg" width="178" height="200" alt=""></a>
						
												<div class="clearfix"> </div>
										</div>
										<div class="response">
							<h4>Responses</h4>
							<div class="media response-info">
								<div class="media-left response-text-left">
									<!-- <a href="#"> -->
										<img class="media-object" src="images/admin.jpg" alt="">
									</a>
									<h5><!-- <a href="#"> -->Admin</a></h5>
								</div>
								<div class="media-body response-text-right">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,There are many variations of passages of Lorem Ipsum available, 
										sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.There are many variations of passages of Lorem Ipsum available.</p>
									<ul>
										<li>October 15, 2016</li>
										<li><a href="single.html"><!-- <i class="fa fa-reply" aria-hidden="true"> --></i> Delete</a></li>
									</ul>
									<!-- <div class="media response-info">
										<div class="media-left response-text-left">
											<a href="#">
												<img class="media-object" src="images/admin.jpg" alt="">
											</a>
											<h5><a href="#">Admin</a></h5>
										</div>
										<div class="media-body response-text-right">
											<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,There are many variations of passages of Lorem Ipsum available, 
												sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.There are many variations of passages of Lorem Ipsum available.</p>
											<ul>
												<li>November 02, 2016</li>
												<li><a href="single.html"><i class="fa fa-reply" aria-hidden="true"></i> Reply</a></li>
											</ul>		
										</div>
										<div class="clearfix"> </div>
									</div> -->
								</div>
								<div class="clearfix"> </div>
							</div>
							<div class="media response-info">
								<div class="media-left response-text-left">
									<!-- <a href="#"> -->
										<img class="media-object" src="images/admin.jpg" alt="">
									</a>
									<h5><!-- <a href="#"> -->Admin</a></h5>
								</div>
								<div class="media-body response-text-right">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,There are many variations of passages of Lorem Ipsum available, 
										sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.There are many variations of passages of Lorem Ipsum available.</p>
									<ul>
										<li>November 03, 2016</li>
										<li><a href="single.html"><!-- <i class="fa fa-reply" aria-hidden="true"></i> --> Delete</a></li>
									</ul>		
								</div>
								<div class="clearfix"> </div>
							</div>
						</div>
											<div class="all-comments-info">
												 <h5 >LEAVE A COMMENT</h5>
												<div class="agile-info-wthree-box">
													<form>
													   <!-- <div class="col-md-6 form-info">
														<input type="text" name="name" placeholder="Your Name" required="">			           					   
														<input type="email" name="email" placeholder="Your Email" required="">
														<input type="text" name="phone" placeholder="Your Phone" required="">	
													  </div> -->
													  <textarea placeholder="Message" required=""></textarea>
														<input type="submit" value="SEND">
													  <!--  <div class="col-md-6 form-info">
														
														
													 </div> -->
													 <div class="clearfix"> </div>
														
														
													</form>
												</div>
											</div>
								   </div>
								   <div class="col-md-4 latest-news-agile-right-content">
								   <!-- <h4 class="side-t-w3l-agile">For Latest Movies</h4> -->
										<!-- <div class="side-bar-form">
										 <form action="#" method="post">
											<input type="search" name="email" placeholder="Search here...." required="required">
											<input type="submit" value=" ">
										 </form>
									    </div> -->
								      <h4 class="side-t-w3l-agile">News</h3>
									    <ul class="side-bar-agile">
										   <li><a href="single.html">John Abraham, Sonakshi Sinha and Tahir ...</a><p>Sep 29, 2016</p></li>
										   <li><a href="single.html">Romantic drama about two people finding out that love</a><p>Feb 3, 2016</p></li>
										   <li><a href="single.html">Storks have moved on from delivering babies to packages ...</a><p>Aug 1, 2016</p></li>
										   <li><a href="single.html">John Abraham, Sonakshi Sinha and Tahir ...</a><p>Sep 29, 2016</p></li>
										   <li><a href="single.html">John Abraham, Sonakshi Sinha and Tahir ...</a><p>Sep 29, 2016</p></li>
										</ul>
										<!-- <h4 class="side-t-w3l-agile">Latest <span>Trailer</span></h3> -->
										<!-- <div class="video_agile_player sidebar-player">
										            <div class="video-grid-single-page-agileits">
														<div data-video="fNKUgX8PhMA" id="video1"> <img src="images/22.jpg" alt="" class="img-responsive"> <div id="play"></div></div>
													</div> -->


										        <!-- <div class="player-text side-bar-info">
												<p class="fexi_header">Me Before You </p>
												<p class="fexi_header_para"><span class="conjuring_w3">Story Line<label>:</label></span>Me Before You Official Trailer #2 (2016) - Emilia Clarke, Sam Claflin Movie HD

A girl in a small town forms an unlikely....</p>
												<p class="fexi_header_para"><span>Release On<label>:</label></span>Feb 3, 2016 </p>
												<p class="fexi_header_para">
													<span>Genres<label>:</label> </span>
													<a href="genre.html">Drama</a> | 
													<a href="genre.html">Adventure</a> | 
													<a href="genre.html">Family</a>								
												</p>
												<p class="fexi_header_para fexi_header_para1"><span>Star Rating<label>:</label></span>
													<a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
													<a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
													<a href="#"><i class="fa fa-star-half-o" aria-hidden="true"></i></a>
													<a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
													<a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
												</p>
											</div> -->

										    <!-- </div> -->
											<div class="clearfix"> </div>
											<div class="agile-info-recent">
											<h4 class="side-t-w3l-agile">Box Office Sales </h4>
											<div class="w3ls-recent-grids">
												<table table width="100%" border="1">
 												 <tr>
   												   <th>Date</th>
    											   <th>Week</th>
    											   <th>Sales</th>
  												 </tr>
 													 <tr>
 													 <td>2017.01.02</td>
   													   <td>Monday</td>
   														 <td>$730.40</td>
 															 </tr>
 													 <tr>
 													  <td>2017.01.02</td>
   													  <td>Tuesday</td>
   														  <td>$730.40</td>
 															 </tr>
 															  <tr>
 															  <td>2017.01.02</td>
   													 <td>Wednesday</td>
   														  <td>$730.40</td>
 															 </tr>
 															  <tr>
 															  <td>2017.01.02</td>
   													 <td>Thursday</td>
   														  <td>$730.40</td>
 															 </tr>
 															  <tr>
 															  <td>2017.01.02</td>
   													 <td>Friday</td>
   														  <td>$730.40</td>
 															 </tr>
 															  <tr>
 															  <td>2017.01.02</td>
   													 <td>Saturday</td>
   														  <td>$730.40</td>
 															 </tr>
 															  <tr>
 															  <td>2017.01.02</td>
   													 <td>Sunday</td>
   														  <td>$730.40</td>
 															 </tr>
												</table>
												
												<!-- <h5><p>$1,203,759</p></h5> -->
												
													<ul class="w3l-sider-list">
														<li><i class="fa fa-clock-o" aria-hidden="true"></i>Till Jan 12, 2016</li>
														</i><li>Total Sales:$1,203,759</li>
													</ul>
													
												<div class="clearfix"> </div>
												
											</div>
										</div>
										
							       </div>
								   <div class="clearfix"></div>
							   </div>
					
						</div>
				</div>
			<!--//content-inner-section-->

			<div class="w3agile_footer_copy">
				    <p>Copyright &copy; 2017. Movie Expert All rights reserved.</p>
			</div>
		<a href="#home" id="toTop" class="scroll" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>

<script src="js/jquery-1.11.1.min.js"></script>
	<!-- Dropdown-Menu-JavaScript -->
			<script>
				$(document).ready(function(){
					$(".dropdown").hover(            
						function() {
							$('.dropdown-menu', this).stop( true, true ).slideDown("fast");
							$(this).toggleClass('open');        
						},
						function() {
							$('.dropdown-menu', this).stop( true, true ).slideUp("fast");
							$(this).toggleClass('open');       
						}
					);
				});
			</script>
		<!-- //Dropdown-Menu-JavaScript -->
		<!-- search-jQuery -->
				<script src="js/main.js"></script>
			
			<script src="js/simplePlayer.js"></script>
			<script>
				$("document").ready(function() {
					$("#video").simplePlayer();
				});
			</script>
			<script>
				$("document").ready(function() {
					$("#video1").simplePlayer();
				});
			</script>
			<script>
				$("document").ready(function() {
					$("#video2").simplePlayer();
				});
			</script>
				<script>
				$("document").ready(function() {
					$("#video3").simplePlayer();
				});
			</script>
			<script>
				$("document").ready(function() {
					$("#video4").simplePlayer();
				});
			</script>
			<script>
				$("document").ready(function() {
					$("#video5").simplePlayer();
				});
			</script>
			<script>
				$("document").ready(function() {
					$("#video6").simplePlayer();
				});
			</script>
			<script>
				$("document").ready(function() {
					$("#video6").simplePlayer();
				});
			</script>

			<!-- pop-up-box -->  
		<script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
	<!--//pop-up-box -->

			<div id="small-dialog1" class="mfp-hide">
		<iframe src=""></iframe>
	</div>
	<div id="small-dialog2" class="mfp-hide">
		<iframe src=""></iframe>
	</div>
	<script>
		$(document).ready(function() {
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
																		
		});
	</script>
<script src="js/easy-responsive-tabs.js"></script>
<script>
$(document).ready(function () {
$('#horizontalTab').easyResponsiveTabs({
type: 'default', //Types: default, vertical, accordion           
width: 'auto', //auto or any width like 600px
fit: true,   // 100% fit in a container
closed: 'accordion', // Start closed if in accordion view
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
});
</script>
<link href="css/owl.carousel.css" rel="stylesheet" type="text/css" media="all">
<script src="js/owl.carousel.js"></script>
<script>
	$(document).ready(function() { 
		$("#owl-demo").owlCarousel({
	 
		 autoPlay: 3000, //Set AutoPlay to 3 seconds
		  autoPlay : true,
		   navigation :true,

		  items : 5,
		  itemsDesktop : [640,4],
		  itemsDesktopSmall : [414,3]
	 
		});
	 
	}); 
</script> 

<!--/script-->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>

<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){		
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},900);
				});
			});
</script>
 <script type="text/javascript">
						$(document).ready(function() {
							/*
							var defaults = {
					  			containerID: 'toTop', // fading element id
								containerHoverID: 'toTopHover', // fading element hover id
								scrollSpeed: 1200,
								easingType: 'linear' 
					 		};
							*/
							
							$().UItoTop({ easingType: 'easeOutQuart' });
							
						});
					</script>
<!--end-smooth-scrolling-->
	<script src="js/bootstrap.js"></script>
</body>
</html>
