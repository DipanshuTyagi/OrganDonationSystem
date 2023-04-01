


<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Home</title>
		<meta charset="utf-8">
		<meta name = "format-detection" content = "telephone=no" />
		<link rel="icon" href="images/favicon.ico">
		<link rel="shortcut icon" href="images/favicon.ico" />
		<link rel="stylesheet" href="css/owl.carousel.css">
		<link rel="stylesheet" href="css/slider.css">
		<link rel="stylesheet" href="css/style.css">
		<script src="js/jquery.js"></script>
		<script src="js/jquery-migrate-1.1.1.js"></script>
		<script src="js/script.js"></script>
		<script src="js/jquery.ui.totop.js"></script>
		<script src="js/superfish.js"></script>
		<script src="js/jquery.equalheights.js"></script>
		<script src="js/jquery.mobilemenu.js"></script>
		<script src="js/jquery.easing.1.3.js"></script>
		<script src="js/owl.carousel.js"></script>
		<script src="js/jquery.flexslider-min.js"></script>
		<script src="js/kwiks.js"></script>
		<script>
			$(document).ready(function(){
				$().UItoTop({ easingType: 'easeOutQuart' });
				var owl = $("#owl");
				owl.owlCarousel({
					items : 4, //10 items above 1000px browser width
					itemsDesktop : [995,3], //5 items between 1000px and 901px
					itemsDesktopSmall : [767, 2], // betweem 900px and 601px
					itemsTablet: [700, 2], //2 items between 600 and 0
					itemsMobile : [479, 1], // itemsMobile disabled - inherit from itemsTablet option
					navigation : true,
				});
			})
			var Main = Main || {};
			jQuery(window).load(function() {
				window.responsiveFlag = jQuery('#responsiveFlag').css('display');
				Main.gallery = new Gallery();
				jQuery(window).resize(function() {
					Main.gallery.update();
				});
			});
			function Gallery(){
				var self = this,
					container = jQuery('.flexslider'),
					clone = container.clone( false );
					this.init = function (){
						if( responsiveFlag == 'block' ){
						var slides = container.find('.slides');
						slides.kwicks({
							max : 500,
							spacing : 0
						}).find('li > a').click(function (){
							return false;
						});
						} else {
							container.flexslider();
						}
					}
					this.update = function () {
						var currentState = jQuery('#responsiveFlag').css('display');
						if(responsiveFlag != currentState) {
							responsiveFlag = currentState;
							container.replaceWith(clone);
							container = clone;
							clone = container.clone( false );
							this.init();
						}
					}
				this.init();
			}
		</script>
		<!--[if lt IE 8]>
		<div style=' clear: both; text-align:center; position: relative;'>
			<a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode">
				<img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." />
			</a>
		</div>
		<![endif]-->
		<!--[if lt IE 9]>
		<script src="js/html5shiv.js"></script>
		<link rel="stylesheet" media="screen" href="css/ie.css">
		<![endif]-->
	</head>
	<body class="page1" id="top">
            <%
                String mobile="",email="",loc="";
        String name=session.getAttribute("name").toString();
        session.setAttribute("name", name);
        Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/organ", "root","root");
String s133="select * from reg where name='"+name+"' ";
PreparedStatement pst = con.prepareStatement(s133);
ResultSet rss = pst.executeQuery();
if(rss.next())
{
mobile=rss.getString("mobile");
email=rss.getString("email");
loc=rss.getString("location");
}
        %>
<!--==============================header=================================-->
		<header>
			<div class="clear"></div>
			<div class="container_12">
				<div class="grid_12">
					<h1>
						<a href="index.jsp">
							<img src="images/logo1.png" alt="Your Happy Family">
						</a>
					</h1>
					<div class="menu_block">
						<nav class="horizontal-nav full-width horizontalNav-notprocessed">
							<ul class="sf-menu">
								<li><a href="userhome.jsp">Home</a></li>
								<li><a href="search2.jsp">Search</a></li>
								<li class="current"><a href="donateform.jsp">Donate Form</a></li>
                                                                <li><a href="logout.jsp">Logout</a></li>
							</ul>
						</nav>
						<div class="clear"></div>
					</div>
					<div class="clear"></div>
				</div>
			</div>
		</header>
		<div class="main">
<!--==============================Content=================================-->
			<div class="content"><div class="ic"></div>
				<div class="container_12">
					<div class="grid_8">
						<div class="flexslider">
							<ul class="slides">
								<li>
									<img src="images/page1_img1.jpg" alt="">
									<div class="flex-caption">
										<p>Hope</p>
									</div>
								</li>
								<li>
									<img src="images/page1_img2.jpg" alt="">
									<div class="flex-caption c2">
										<p>Save</p>
									</div>
								</li>
								<li>
									<img src="images/page1_img3.jpg" alt="">
									<div class="flex-caption">
										<p>Help</p>
									</div>
								</li>
							</ul>
						</div>
						<span id="responsiveFlag"></span>
					</div>
					<div class="grid_4">
						<a href="#" class="donate">Fill Form</a><br><br>
<form name="myform" method="post" action="don1.jsp" >  
    <strong>UserName : </strong>&emsp;&nbsp;&nbsp;<input type="text" required="" style="background-color: #7eea3d;width: 180px;" readonly="" value="<%=name%>" name="name"><br><br>
<strong>Age : </strong>&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;<input type="text" required="" style="background-color: #7eea3d;width: 180px;" name="age"><br><br/>  
<strong>Blood Group :</strong>&nbsp;&nbsp;&nbsp;<input type="text" required="" style="background-color: #7eea3d;width: 180px;" name="blood"><br><br>
<strong>Mobile : </strong>&emsp;&emsp;&emsp;&nbsp;&nbsp;<input type="text" required="" style="background-color: #7eea3d;width: 180px;" value="<%=mobile%>" readonly="" name="mobile"><br><br/>  
<strong>Email id : </strong>&emsp;&emsp;&emsp;<input type="email" required="" style="background-color: #7eea3d;width: 180px;" value="<%=email%>" readonly="" name="email"><br><br/>  
<strong>Location : </strong>&emsp;&nbsp;&nbsp;&emsp;<input type="text" required="" style="background-color: #7eea3d;width: 180px;" name="location" value="<%=loc%>" readonly=""> &emsp;&emsp;<br><br>
<strong>Select Part to Donate : </strong>&emsp;&nbsp;&nbsp;&nbsp;<br><br>
 &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<select name="part" style="width: 200px;background-color: #7eea3d;">                                                  
                                                  <option>Corneas</option>
                                                  <option>Kidneys</option>
                                                  <option>Heart</option>
                                                  <option>Lungs</option>
                                                  <option>Liver</option>
                                                  <option>Pancreas</option>
                                                  <option>Eyes</option>
                                              </select><br><br>
<center>
    <input type="submit" value="Submit">  
</center>
</form>  				
                                        </div>
					<div class="clear"></div>
					
					<div class="clear"></div>
					<div class="grid_12">
						<h2>You can help Them</h2>
						<div id="owl">
							<div class="item">
								<a href="#"><img src="images/page1_img4.jpg" alt="">Jim <br>
								8 years</a>
							</div>
							<div class="item it1">
								<a href="#"><img src="images/page1_img5.jpg" alt="">Ann <br>
								3 years</a>
							</div>
							<div class="item it2">
								<a href="#"><img src="images/page1_img6.jpg" alt="">Linda <br>
								5 years</a>
							</div>
							<div class="item it3">
								<a href="#"><img src="images/page1_img7.jpg" alt="">Mark  <br>
								6 years</a>
							</div>
							<div class="item">
								<a href="#"><img src="images/page1_img4.jpg" alt="">Jim <br>
								8 years</a>
							</div>
							<div class="item it1">
								<a href="#"><img src="images/page1_img5.jpg" alt="">Ann <br>
								3 years</a>
							</div>
							<div class="item it2">
								<a href="#"><img src="images/page1_img6.jpg" alt="">Linda <br>
								5 years</a>
							</div>
							<div class="item it3">
								<a href="#"><img src="images/page1_img7.jpg" alt="">Mark  <br>
								6 years</a>
							</div>
						</div>
					</div>
                                        <div>
                                                    <h2>OUR MISSION</h2><br>
                                                    <p>The mission our project is to ensure that every Indian who is suffering from end stage organ failure be provided with the 'gift of life’ through a life-saving organ.
                                                           
                                                        <br> We accomplishing this mission through the following objectives:</p>
                                                    <ul>
                                                    <li>1) To create public awareness among a cross-section of the population</li>

                                                    <li>2) To train health care professionals in transplant coordination</li>

                                                    <li>3) To counsel families of "brain dead" victims to donate their loved ones' organs</li>

                                                    <li>4) To create a computerized network for logistic support for organ donation in hospitals and the utilization of organs</li>

                                                    <li>5) To liaise with Government (State and Central) to pass favorable legislation that will help increase organ donations in India.</li>

                                                    <li>6) Networking with other organ procuring organizations in the country</li>

                                                    <li>7) Raising resources to promote organ donation efficiently</li>
                                                    </ul>
                                                </div>
					
				</div>
			</div>
<!--==============================footer=================================-->
			<footer>
				<div class="hor bg3"></div>
				<div class="container_12">
					<div class="grid_12 ">
						<div class="socials">
							<a href="#"></a>
							<a href="#"></a>
							<a href="#"></a>
							<div class="clear"></div>
						</div>
						<div class="copy">
                                                    <a href="index.jsp" >Organ Donation</a>	
                                                </div>
					</div>
				</div>
			</footer>
		</div>
	</body>
</html>