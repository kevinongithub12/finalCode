<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="UserPortfolioGrid.aspx.cs" Inherits="About" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <!DOCTYPE html>
    <html>
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<title>Race Tracker: User Profile Grid Gallery</title>
		<meta name="description" content="UserList of up to 30 users nearby as a collague" />
		<meta name="keywords" content="google getting started gallery, image gallery, image grid, template, masonry" />
		<meta name="author" content="Codrops" />
		<link rel="shortcut icon" href="../favicon.ico">
		<link rel="stylesheet" type="text/css" href="Content/css/demo.css" />
		<link rel="stylesheet" type="text/css" href="Content/css/component.css" />
		<script src="Scripts/js/modernizr.custom.js"></script>
	</head>
	<body>
		<div class="container">
			<header class="clearfix">
				<span>Race Tracker <span class="bp-icon bp-icon-about" data-content="The  top 15 users using Race Tracker!!!!!!!"></span></span>
				<h1>USER RANKINGS</h1>
				<nav>
					<a href="http://tympanus.net/Blueprints/FullWidthTabs/" class="bp-icon bp-icon-prev" data-info="previous Blueprint"><span>Back to User Gallery</span></a>
					<!--a href="" class="bp-icon bp-icon-next" data-info="next Blueprint"><span>Next Blueprint</span></a-->
					<a href="http://tympanus.net/codrops/?p=18699" class="bp-icon bp-icon-drop" data-info="back to the Race-Tracker Application"><span>back to the Locations Page</span></a>
					<a href="http://tympanus.net/codrops/category/blueprints/" class="bp-icon bp-icon-archive" data-info="Blueprints archive"><span> archive</span></a>
				</nav>
			</header>
			<div id="grid-gallery" class="grid-gallery">
				<section class="grid-wrap">
					<ul class="grid">
						<li class="grid-sizer"></li><!-- for Masonry column width -->
						<li>
							<figure>
								<img src="Images\user_imgs\tumblr_lz05g87jOo1r0jhcmo1_500.gif" alt="img01"/>
								<figcaption><h3>#1 Sam Burdd:</h3><p>Wins:99 <br />Losses:None </p></figcaption>
							</figure>
						</li>
						<li>
							<figure>
								<img src="Images/user_imgs/tumblr_m7bka9esiO1raq5k7o1_500.gif"  alt="img02"/>
								<figcaption><h3>#2 Jason Xfactor:</h3><p>Wins:80 <br />Losses:None </p></figcaption>
							</figure>
						</li>
						<li>
							<figure>
								<img src="Images/user_imgs/tumblr_m7chexAuf11rwcc6bo1_400.gif" alt="img03"/>
								<figcaption><h3>#3 Who's Next :</h3><p>Wins:70 <br />Losses:None </p></figcaption>
							</figure>
						</li>
						<li>
							<figure>
								<img src="Images/user_imgs/tumblr_mednn3eaZv1rmneg9o1_500.gif" alt="img04"/>
								<figcaption><h3>#4 who's Next :</h3><p>Wins:50 <br />Losses:3 </p></figcaption>
							</figure>
						</li>
						<li>
							<figure>
							    <img src="Images/user_imgs/tumblr_mvxmpm2xNi1sd5eo5o1_r2_500.gif" alt="img05"/>
								<figcaption><h3>#5 Mr.RaceCrusher:</h3><p>Wins:49 <br />Losses:4 </p></figcaption>
                            </figure>
						</li>
						<li>
							<figure>
								<img src="Images/user_imgs/tumblr_mwzcszDM2E1s6stdwo1_500.gif"  alt="img06"/>
								<figcaption><h3>#6 Exercitation</h3><p>Wins:49</p>
                                    <p>Losses:5</p>
                                </figcaption>
							</figure>
						</li>
						<li>
							<figure>
                                <img src="Images/user_imgs/tumblr_mxbvss8Tp41sd5eo5o1_500.gif"  alt="img07"/>
								<figcaption><h3>#7 Viral</h3><p>Wins:46<br />Losses:6</p></figcaption>
							</figure>
						</li>
						<li>
							<figure>
							<img src="Images/user_imgs/giphy%20(1).gif" alt="img08" />
								<figcaption><h3>#8 Photo booth skateboard</h3><p>Wins:45<br />Losses:6</p></figcaption>
							</figure>
						</li>
						<li>
							<figure>
								<img src="Images/user_imgs/giphy%20(2).gif" alt="img09" />
								<figcaption><h3>#9 Ex fashion axe</h3><p>Wins:43<br />Losses:7</p></figcaption>
							</figure>
						</li>
						<li>
							<figure>
								<img src="Images/user_imgs/giphy%20(3).gif" alt="img10" />
								<figcaption><h3>#10 Thundercat</h3><p>Wins 42<br />Losses:7</p></figcaption>
							</figure>
						</li>
						<li>
							<figure>
								<img src="Images/user_imgs/giphy%20(4).gif" alt="img11" />
								<figcaption><h3>#12 Bushwick </h3><p>Wins:38</p>
                                    <p>Losses:9</p></figcaption>
							</figure>
						</li>
						<li>
							<figure>
								<img src="Images/user_imgs/giphyNEW1.gif"  alt="img12"/>
								<figcaption><h3>#11 FearlessGirl</h3><p>Wins:39</p>
                                    <p>Losses: 9</p></figcaption>
							</figure>
						</li>
						<li>
							<figure>
								<img src="Images/user_imgs/gifNEW2.gif"  alt="img13"/>
								<figcaption><h3>#13 Letterpress asymmetrical</h3><p>Wins: 37</p>
                                    <p>Losses: 9</p></figcaption>
							</figure>
						</li>
						<li>
							<figure>
								<img src="Images/user_imgs/giphy.gif"  alt="img14"/>
								<figcaption><h3>#15 Tony Soprano</h3><p>Wins:&nbsp; 36</p>
                                    <p>Losses: 14</p></figcaption>
							</figure>
						</li>
						<li>
							<figure>
								<img src="Images/user_imgs/racinggif3.gif" alt="img15"/>
								<figcaption><h3>#14 NiteRyder</h3><p>Wins: 36</p>
                                    <p>Losses: 11</p>
                                    <p>&nbsp;</p></figcaption>
							</figure>
						</li>
					</ul>
				</section><!-- // grid-wrap -->
				<section class="slideshow">
					<ul>
						<li>
							<figure>
								<figcaption>
									<h3>I always win</h3>
									<p>Bring it on.Meet me on RaceTracker.</p>
								</figcaption>
								<img src="Images\user_imgs\tumblr_lz05g87jOo1r0jhcmo1_500.gif" alt="img01"/>
							</figure>
						</li>
						<li>
							<figure>
								<figcaption>
									<h3>Me losing?? ahh Funny!!</h3>
									<p>PM me if you're in Texas and wanna race.</p>
								</figcaption>
								<img src="Images/user_imgs/tumblr_m7bka9esiO1raq5k7o1_500.gif"  alt="img02"/>
							</figure>
						</li>
						<li>
							<figure>
								<figcaption>
									<h3>I'm too fast..</h3>
									<p>PM me if u want to add another loss to your record.</p>
								</figcaption>
								<img src="Images/user_imgs/tumblr_m7chexAuf11rwcc6bo1_400.gif" alt="img03"/>
							</figure>
						</li>
						<li>
							<figure>
								<figcaption>
									<h3>Anyone wanna Race???</h3>
									<p>Please PM me if you're in the michigan area, lets get this going.</p>
								</figcaption>
								<img src="Images/user_imgs/tumblr_mednn3eaZv1rmneg9o1_500.gif" alt="img04"/>
							</figure>
						</li>
						<li>
							<figure>
								<figcaption>
									<h3>Any beginners wanan race?</h3>
									<p>Looking for some easy bait to rank up my wins..</p>
								</figcaption>
								<img src="Images/user_imgs/tumblr_mvxmpm2xNi1sd5eo5o1_r2_500.gif" alt="img05"/>
							</figure>
						</li>
						<li>
							<figure>
								<figcaption>
									<h3>Who's my next victim?</h3>
									<p>Don't eat dust, when I'm zooming past you.</p>
								</figcaption>
								<img src="Images/user_imgs/tumblr_mwzcszDM2E1s6stdwo1_500.gif"  alt="img06"/>
							</figure>
						</li>
						<li>
							<figure>
								<figcaption>
									<h3>I can race and take selfies at the same time</h3>
									<p>I'll beat you, and look good doing it too.</p>
								</figcaption>
                                <img src="Images/user_imgs/tumblr_mxbvss8Tp41sd5eo5o1_500.gif"  alt="img07"/>
							</figure>
						</li>
						<li>
							<figure>
								<figcaption>
									<h3>I'm the Anime Nascar champpp</h3>
									<p>Up to race anybody, especially if you like anime.</p>
								</figcaption>
								<img src="Images/user_imgs/giphy%20(1).gif" alt="img08" />
							</figure>
						</li>
						<li>
							<figure>
								<figcaption>
									<h3>Ex fashion axe</h3>
									<p>I have a very fashionable ride, and it's quite fast too.PM ME </p>
								</figcaption>
								<img src="Images/user_imgs/giphy%20(2).gif" alt="img09" />
							</figure>
						</li>
						<li>
							<figure>
								<figcaption>
									<h3>Thundercats </h3>
									<p>I'm winning a race right now, while posting this status</p>
								</figcaption>
								<img src="Images/user_imgs/giphy%20(3).gif" alt="img10" />
							</figure>
						</li>
						<li>
							<figure>
								<figcaption>
									<h3>I AINT NEVAAA SCARED!!!....okay maybe...</h3>
									<p>Schlitz deserunt pour-over consectetur. Selfies plaid asymmetrical farm-to-table, cred                                           that's german for "I'll destory you on the track!!".</p>
								</figcaption>
								<img src="Images/user_imgs/giphy%20(4).gif" alt="img11" />
							</figure>
						</li>
						<li>
							<figure>
								<figcaption>
									<h3>Just designed a sweet track. PM ME</h3>
									<p>The race track we will race on is 10 miles long, with sweet re-route paths.</p>
								</figcaption>
								<img src="Images/user_imgs/giphyNEW1.gif" alt="img12"/>
							</figure>
						</li>
						<li>
							<figure>
								<figcaption>
									<h3>Just designed a sweet track. PM ME</h3>
									<p>The race track we will race on is 10 miles long, with sweet re-route paths.</p>
								</figcaption>
								<img src="Images/user_imgs/gifNEW2.gif"  alt="img13"/>
							</figure>
						</li>
						<li>
							<figure>
								<figcaption>
									<h3>oh lalaalala</h3>
									<p>This is a cool app/website danggg.</p>
								</figcaption>
								<img src="Images/user_imgs/giphy.gif"  alt="img14"/>
							</figure>
						</li>
						<li>
							<figure>
								<figcaption>
									<h3>They call me Bully man</h3>
									<p>I don't care about winning, as long as you get a beatdown.</p>
								</figcaption>
								<img src="Images/user_imgs/racinggif3.gif" alt="img15"/>
							</figure>
						</li>
						
					</ul>
					<nav>
						<span class="icon nav-prev"></span>
						<span class="icon nav-next"></span>
						<span class="icon nav-close"></span>
					</nav>
					<div class="info-keys icon">Navigate with arrow keys</div>
				</section><!-- // slideshow -->
			</div><!-- // grid-gallery -->
		</div>
		<script src="Scripts/imagesloaded.pkgd.min.js"></script>
		<script src="Scripts//masonry.pkgd.min.js"></script>
		<script src="Scripts//classie.js"></script>
		<script src="Scripts//cbpGridGallery.js"></script>
		<script>
		    new CBPGridGallery(document.getElementById('grid-gallery'));
		</script>
	</body>
</html>
    </asp:Content>