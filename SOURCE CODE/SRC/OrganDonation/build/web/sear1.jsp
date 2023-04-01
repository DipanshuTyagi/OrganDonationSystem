
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
								<li><a href="adminhome.jsp">Home</a></li>
								<li><a href="viewusers.jsp">View User</a></li>
								 <li><a href="history.jsp">User History</a></li>
								<li class="current"><a href="sear.jsp">Search</a></li>
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
						<center>					
    <h1>Search Result</h1><br><br>		
					  <%
        try{        
    %>
  
     <table id="pro_display_table" border="0" cellspacing="1px"  style="border: 4px solid #FB9217; width:auto;height: auto;">
  <tr>
    <th scope="row">&nbsp;</th>
    <td>&nbsp;</td>
  </tr>
         <tr>  
             <td  style="color:#0D72BD;font-weight: bold;font-size: 17px;"><b><strong>&emsp;&nbsp;&nbsp;Name</strong></b></td>
             <td  style="color:#0D72BD;font-weight: bold;font-size: 17px;"><b><strong>&emsp;&emsp;Blood Group</strong></b></td>
             <td  style="color:#0D72BD;font-weight: bold;font-size: 17px;"><b><strong>&emsp;&emsp;&emsp;Mobile </strong>&emsp;</b></td>
             <td  style="color:#0D72BD;font-weight: bold;font-size: 17px;"><b><strong>&emsp;&emsp;&emsp;&emsp;&emsp;Email</strong>&emsp;</b></td>
             <td  style="color:#0D72BD;font-weight: bold;font-size: 17px;"><b><strong>&emsp;&emsp;Location</strong>&emsp;</b></td>    
             <td  style="color:#0D72BD;font-weight: bold;font-size: 17px;"><b><strong>&emsp;&emsp;Part</strong>&emsp;</b></td>
          </tr>
         <tr>
    <th scope="row">&nbsp;</th>
    <td>&nbsp;</td>
  </tr>
<% 
            String search=request.getParameter("search");
            Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/organ", "root","root");
        String Query22="select * from det where part like '%"+search+"%' or location like '%"+search+"%' ";
                        PreparedStatement ps22=con.prepareStatement(Query22);
                        ResultSet rs22=ps22.executeQuery();
                        while(rs22.next())
                        {                                         
                        %>
                                <tr>  
                                    <td  style="color:#080606;font-weight: bold;">&emsp;&emsp;<%=rs22.getString("name")%></td>
                                    <td  style="color:#080606;font-weight: bold;">&emsp;&emsp;&emsp;&emsp;<%=rs22.getString("blood")%></td>
                                    <td  style="color:#080606;font-weight: bold;">&emsp;&emsp;&emsp;<%=rs22.getString("mobile")%></td>
                                  <td  style="color:#080606;font-weight: bold;">&emsp;&emsp;<%=rs22.getString("email")%></td>
                                  <td  style="color:#080606;font-weight: bold;">&emsp;&emsp;<%=rs22.getString("location")%></td>   
                                <td  style="color:#080606;font-weight: bold;">&emsp;&emsp;<%=rs22.getString("part")%></td>
                                <tr>
    <th scope="row">&nbsp;</th>
    <td>&nbsp;</td>
  </tr>
                                    <%}%>
              </table>

               <%//}
                                     
   }catch(Exception e){
   System.out.println(e);
   }
   %>            
                                        </center> 
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