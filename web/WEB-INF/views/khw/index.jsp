<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>여기 부동산 어떄</title>

        <!-- CSS -->
        <link rel="stylesheet" href="assets/fonts/fonts.css">
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/select2.css">
        <link rel="stylesheet" href="assets/css/gray.css">
        <link rel="stylesheet" href="assets/css/magnific-popup.css">
        <link rel="stylesheet" href="assets/css/form-elements.css">
        <link rel="stylesheet" href="assets/css/buttons.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/media-queries.css">

        <link rel="stylesheet" href="assets/css/news.css">
        <link rel="stylesheet" href="assets/css/loading.css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
        
        <!-- Favicon and touch icons -->
        <link rel="shortcut icon" href="assets/ico/favicon.png">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">

		<!-- Java script -->
		
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
    </head>
    <body>

	<c:import url="top.jsp" charEncoding="UTF-8">
		<%-- <c:param name="serverTime" value="${serverTime}"></c:param> --%>
	</c:import>

	<!-- Top content -->
        <div class="top-content-container">
            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12 top-content-text">
                        	<h1>
                        		We are an interactive agency<br>
                        		<span class="top-content-text-big">Creating high quality in media</span>
                        	</h1>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12 top-content-computer">
                        	<div class="top-content-computer-container">
                        		<img src="assets/img/macbook.png" alt="">
                        		<div class="top-content-video">
                        			<img src="assets/img/icons/play.png" alt="">
                        			<p>Play case study</p>
                        			<iframe src="//player.vimeo.com/video/84910153?title=0&amp;byline=0&amp;portrait=0&amp;badge=0&amp;api=1" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
                        		</div>
                        	</div>
                        </div>
                    </div>
                    <div class="row">
                    	<div class="col-sm-12 top-content-select">
                        	<select class="custom-select">
                        		<option class="custom-select-web-design" value="web-design">Web design</option>
                       			<option class="custom-select-image-design" value="image-design">Image design</option>
                       			<option class="custom-select-branding" value="branding">Branding</option>
                       			<option class="custom-select-dtp" value="dtp">DTP</option>
                       			<option class="custom-select-tv-campanies" value="tv-campanies">TV campanies</option>
                       		</select>
                       		<a class="button-2" href="#">See the works</a>
                    	</div>
                    </div>
                </div>
            </div>
        </div>
                
         <div class="loading-bro">
  		<h1>Loading</h1>
  		<svg id="load" x="0px" y="0px" viewBox="0 0 150 150">
    	<circle id="loading-inner" cx="75" cy="75" r="60"/>
 		</svg>
		</div>
		
        <!-- Services -->
        <!-- News -->
        <c:import url="news.jsp" charEncoding="UTF-8">
		<%-- <c:param name="serverTime" value="${serverTime}"></c:param> --%>
		</c:import>
        
        
        <!-- Portfolio -->
        <div class="portfolio-container">
	        <div class="container">
	            <div class="row">
	                <div class="col-sm-12 portfolio">
	                    <h2>Portfolio</h2>
	                    <p>
	                    	Voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis 
	                    	et quasi architecto beatae vitae.
	                    </p>
	                </div>
	            </div>
	            <div class="row">
	            	<div class="col-sm-12 portfolio-filters">
	            		<a href="#" class="filter-all active">All</a> 
	            		<a href="#" class="filter-web-design">Web design</a> 
	            		<a href="#" class="filter-image-design">Image design</a> 
	            		<a href="#" class="filter-branding">Branding</a> 
	            		<a href="#" class="filter-dtp">DTP</a> 
	            		<a href="#" class="filter-tv-campanies">TV campanies</a>
	            	</div>
	            </div>
	            <div class="row">
	            	<div class="col-sm-12 portfolio-masonry">
		                <div class="portfolio-box web-design">
		                	<img src="assets/img/portfolio/1.jpg" alt="" data-at2x="assets/img/portfolio/1.jpg">
		                	<div class="portfolio-box-text-container">
			                	<div class="portfolio-box-text">
			                		<h3>Rio blue parrots</h3>
			                		<p>January 2014</p>
			                	</div>
			                </div>
		                </div>
		                <div class="portfolio-box image-design">
		                	<img src="assets/img/portfolio/2.jpg" alt="" data-at2x="assets/img/portfolio/2.jpg">
		                	<div class="portfolio-box-text-container">
			                	<div class="portfolio-box-text">
			                		<h3>Rio blue parrots</h3>
			                		<p>January 2014</p>
			                	</div>
			                </div>
		                </div>
		                <div class="portfolio-box branding">
		                	<img src="assets/img/portfolio/3.jpg" alt="" data-at2x="assets/img/portfolio/3.jpg">
		                	<div class="portfolio-box-text-container">
			                	<div class="portfolio-box-text">
			                		<h3>Rio blue parrots</h3>
			                		<p>January 2014</p>
			                	</div>
			                </div>
		                </div>
		                <div class="portfolio-box web-design">
		                	<img src="assets/img/portfolio/4.jpg" alt="" data-at2x="assets/img/portfolio/4.jpg">
		                	<div class="portfolio-box-text-container">
			                	<div class="portfolio-box-text">
			                		<h3>Rio blue parrots</h3>
			                		<p>January 2014</p>
			                	</div>
			                </div>
		                </div>
		                <div class="portfolio-box image-design">
		                	<img src="assets/img/portfolio/5.jpg" alt="" data-at2x="assets/img/portfolio/5.jpg">
		                	<div class="portfolio-box-text-container">
			                	<div class="portfolio-box-text">
			                		<h3>Rio blue parrots</h3>
			                		<p>January 2014</p>
			                	</div>
			                </div>
		                </div>
		                <div class="portfolio-box dtp">
		                	<img src="assets/img/portfolio/6.jpg" alt="" data-at2x="assets/img/portfolio/6.jpg">
		                	<div class="portfolio-box-text-container">
			                	<div class="portfolio-box-text">
			                		<h3>Rio blue parrots</h3>
			                		<p>January 2014</p>
			                	</div>
			                </div>
		                </div>
		                <div class="portfolio-box tv-campanies">
		                	<img src="assets/img/portfolio/7.jpg" alt="" data-at2x="assets/img/portfolio/7.jpg">
		                	<div class="portfolio-box-text-container">
			                	<div class="portfolio-box-text">
			                		<h3>Rio blue parrots</h3>
			                		<p>January 2014</p>
			                	</div>
			                </div>
		                </div>
		                <div class="portfolio-box branding">
		                	<img src="assets/img/portfolio/8.jpg" alt="" data-at2x="assets/img/portfolio/8.jpg">
		                	<div class="portfolio-box-text-container">
			                	<div class="portfolio-box-text">
			                		<h3>Rio blue parrots</h3>
			                		<p>January 2014</p>
			                	</div>
			                </div>
		                </div>
	                </div>
	            </div>
	        </div>
        </div>

		<!-- Our team -->
        <div class="team-container">
	        <div class="container">
	            <div class="row">
	                <div class="col-sm-12 team">
	                    <h2>Our team</h2>
	                    <p>Neque porro quisquam est qui dolorem ipsum quia dolor sit ame consectetur adipisci velit sed quia non numquam lorem dolor.</p>
	                </div>
	            </div>
	            <div class="row">
	                <div class="col-sm-6">
	                	<div class="team-box">
		                	<div class="team-box-photo"><img src="assets/img/team/1.jpg" alt="" data-at2x="assets/img/team/1.jpg"></div>
		                	<div class="team-box-text">
		                		<h3>Steven Thomson</h3>
		                		<p>Harum quidem rerum facilis est et expedita distinctio.</p>
		                		<div class="team-box-social">
		                			<a class="button-social-1 button-facebook-1" href="#"></a>
		                			<a class="button-social-1 button-google-plus-1" href="#"></a>
		                			<a class="button-social-1 button-twitter-1" href="#"></a>
		                			<a class="button-social-1 button-pinterest-1" href="#"></a>
		                		</div>
							</div>
						</div>
	                </div>
	                <div class="col-sm-6">
	                	<div class="team-box">
		                	<div class="team-box-photo"><img src="assets/img/team/2.jpg" alt="" data-at2x="assets/img/team/2.jpg"></div>
		                	<div class="team-box-text">
		                		<h3>Sarah Smith</h3>
		                		<p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed.</p>
		                		<div class="team-box-social">
		                			<a class="button-social-1 button-facebook-1" href="#"></a>
		                			<a class="button-social-1 button-google-plus-1" href="#"></a>
		                			<a class="button-social-1 button-twitter-1" href="#"></a>
		                			<a class="button-social-1 button-pinterest-1" href="#"></a>
		                		</div>
							</div>
						</div>
	                </div>
	            </div>
	            <div class="row">
	                <div class="col-sm-6">
	                	<div class="team-box">
		                	<div class="team-box-photo"><img src="assets/img/team/3.jpg" alt="" data-at2x="assets/img/team/3.jpg"></div>
		                	<div class="team-box-text">
		                		<h3>Jane Branson</h3>
		                		<p>Doloremque laudantium totam rem aperiam eaque ipsa quae.</p>
		                		<div class="team-box-social">
		                			<a class="button-social-1 button-facebook-1" href="#"></a>
		                			<a class="button-social-1 button-google-plus-1" href="#"></a>
		                			<a class="button-social-1 button-twitter-1" href="#"></a>
		                			<a class="button-social-1 button-pinterest-1" href="#"></a>
		                		</div>
							</div>
						</div>
	                </div>
	                <div class="col-sm-6">
	                	<div class="team-box">
		                	<div class="team-box-photo"><img src="assets/img/team/4.jpg" alt="" data-at2x="assets/img/team/4.jpg"></div>
		                	<div class="team-box-text">
		                		<h3>Martin Blanc</h3>
		                		<p>Neque porro quisquam est qui dolorem ipsum quia dolor.</p>
		                		<div class="team-box-social">
		                			<a class="button-social-1 button-facebook-1" href="#"></a>
		                			<a class="button-social-1 button-google-plus-1" href="#"></a>
		                			<a class="button-social-1 button-twitter-1" href="#"></a>
		                			<a class="button-social-1 button-pinterest-1" href="#"></a>
		                		</div>
							</div>
						</div>
	                </div>
	            </div>
	        </div>
        </div>

        <!-- Customer reviews -->
        <div class="reviews-container">
	        <div class="container">
	            <div class="row">
	                <div class="col-sm-12 reviews">
	                    <h2>Customer reviews</h2>
	                    <div class="review-active"></div>
	                    <div class="review-single">
	                    	<p>
	                    		"Accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti 
	                    		quos dolores et quas molestias excepturi tempore"
	                    		<br><br>
	                    		<a class="review-author" href="">Steven Johnson, CEO</a>
	                    	</p>
	                    	<div class="review-single-pagination active"><span></span></div>
	                    </div>
	                    <div class="review-single">
	                    	<p>
	                    		"Neque porro quisquam est qui dolorem ipsum quia dolor sit ame consectetur adipisci velit sed quia non numquam 
	                    		lorem dolor excepturi tempore"
	                    		<br><br>
	                    		<a class="review-author" href="">Jane Doe, Designer</a>
	                    	</p>
	                    	<div class="review-single-pagination"><span></span></div>
	                    </div>
	                    <div class="review-single">
	                    	<p>
	                    		"Accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti 
	                    		quos dolores et quas molestias excepturi tempore"
	                    		<br><br>
	                    		<a class="review-author" href="">Steven Johnson, CEO</a>
	                    	</p>
	                    	<div class="review-single-pagination"><span></span></div>
	                    </div>
	                    <div class="review-single">
	                    	<p>
	                    		"Neque porro quisquam est qui dolorem ipsum quia dolor sit ame consectetur adipisci velit sed quia non numquam 
	                    		lorem dolor excepturi tempore"
	                    		<br><br>
	                    		<a class="review-author" href="">Jane Doe, Designer</a>
	                    	</p>
	                    	<div class="review-single-pagination"><span></span></div>
	                    </div>
	                    <div class="review-single">
	                    	<p>
	                    		"Accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti 
	                    		quos dolores et quas molestias excepturi tempore"
	                    		<br><br>
	                    		<a class="review-author" href="">Steven Johnson, CEO</a>
	                    	</p>
	                    	<div class="review-single-pagination"><span></span></div>
	                    </div>
	                </div>
	            </div>
	        </div>
        </div>
        
		<!-- Blog -->
        <div class="blog-container">
	        <div class="container">
	            <div class="row">
	                <div class="col-sm-12 blog">
	                    <h2>Blog</h2>
	                    <p>Quia dolor sit ame consectetur adipisci velit sed quia non numquam lorem dolor.</p>
	                </div>
	            </div>
	            <div class="row">
	                <div class="col-sm-12 blog-articles">
	                	<div class="blog-single-article">
	                		<div class="blog-title"><a href="#">Libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit.</a></div>
	                		<div class="blog-author">Steven Boomel</div>
	                		<div class="blog-date"><span>10.02.2014</span></div>
	                	</div>
	                	<div class="blog-single-article">
	                		<div class="blog-title"><a href="#">Repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur.</a></div>
	                		<div class="blog-author">Kate Winger</div>
	                		<div class="blog-date"><span>08.02.2014</span></div>
	                	</div>
	                	<div class="blog-single-article">
	                		<div class="blog-title"><a href="#">Minus id quod maxime placeat facere possimus, omnis voluptas.</a></div>
	                		<div class="blog-author">John Smith</div>
	                		<div class="blog-date"><span>06.02.2014</span></div>
	                	</div>
	                	<div class="blog-all-posts"><a class="button-2" href="#">Show all posts</a></div>
	                </div>
	            </div>
	        </div>
        </div>

		<!-- Image slider -->
        <div class="slider-container">
	        <div class="container">
	            <div class="row">
	                <div class="col-sm-12">
	                	<div class="slider">
	                		<div id="slider-1" class="carousel slide" data-ride="carousel">
								<!-- Wrapper for slides -->
								<div class="carousel-inner">
									<div class="item active">
										<img src="assets/img/slider/1.jpg" alt="" data-at2x="assets/img/slider/1.jpg">
									</div>
									<div class="item">
										<img src="assets/img/slider/2.jpg" alt="" data-at2x="assets/img/slider/2.jpg">
									</div>
								</div>
								<!-- Controls -->
								<a class="left carousel-control" href="#slider-1" data-slide="prev"></a>
								<a class="right carousel-control" href="#slider-1" data-slide="next"></a>
							</div>
	                	</div>
	                </div>
	            </div>
	        </div>
        </div>

		<!-- Project valuation -->
        <div class="project-valuation-container">
	        <div class="container">
	            <div class="row">
	                <div class="col-sm-12 project-valuation">
	                    <h2>Project valuation</h2>
	                    <p>Neque porro quisquam est qui dolorem ipsum quia dolor sit ame consectetur adipisci velit sed quia non numquam lorem dolor.</p>
	                </div>
	            </div>
	            <div class="row">
	                <div class="col-sm-12 project-valuation-form">
	                	<form action="" method="post">
	                		<div class="project-valuation-form-left">
	                			<label for="custom-select-budget">Your budget:</label>
	                			<select id="custom-select-budget" class="custom-select" name="custom-select-budget">
	                        		<option value="1000-2000">$1000 - $2000</option>
	                       			<option value="2000-3000">$2000 - $3000</option>
	                       			<option value="3000-4000">$3000 - $4000</option>
	                       			<option value="5000">$5000 +</option>
	                       		</select>
	                       		<label for="custom-select-logo">Do you have a logotype?</label>
	                			<select id="custom-select-logo" class="custom-select" name="custom-select-logo">
	                        		<option value="yes">Yes</option>
	                       			<option value="no">No</option>
	                       		</select>
	                       		<label for="custom-select-gallery">Photo gallery?</label>
	                			<select id="custom-select-gallery" class="custom-select" name="custom-select-gallery">
	                        		<option value="yes">Yes</option>
	                       			<option value="no">No</option>
	                       		</select>
	                       		<label for="custom-select-admin">Admin panel?</label>
	                			<select id="custom-select-admin" class="custom-select" name="custom-select-admin">
	                        		<option value="yes">Yes</option>
	                       			<option value="no">No</option>
	                       		</select>
	                		</div>
	                		<div class="project-valuation-form-right">
	                			<label for="project-description">Project description:</label>
	                			<textarea id="project-description" name="project-description">Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae.</textarea>
	                			<label for="project-valuation-example-1">1-5 examples that you like:</label>
	                			<div class="project-valuation-examples">
	                				<label for="project-valuation-example-1">1:</label>
	                				<input type="text" id="project-valuation-example-1" name="project-valuation-example-1" value="www.google.pl">
	                				<label for="project-valuation-example-2">2:</label>
	                				<input type="text" id="project-valuation-example-2" name="project-valuation-example-2" value="www.behance.net">
	                				<label for="project-valuation-example-3">3:</label>
	                				<input type="text" id="project-valuation-example-3" name="project-valuation-example-3" value="www.ebay.com">
	                				<label for="project-valuation-example-4">4:</label>
	                				<input type="text" id="project-valuation-example-4" name="project-valuation-example-4">
	                				<label for="project-valuation-example-5" class="project-valuation-example-last-label">5:</label>
	                				<input type="text" id="project-valuation-example-5" name="project-valuation-example-5">
	                			</div>
	                			<input type="submit" value="Send to valuation">
	                		</div>
	                	</form>
	                </div>
	            </div>
	        </div>
        </div>

		<!-- Map -->
        <div class="map-container">
	        <div class="map"></div>
        	<div class="container">
	            <div class="row">
	                <div class="col-sm-12 address-container">
	                    <div class="address">
	                    	<h3>CREATIVITY Inc.</h3>
	                    	<p>355 Murray Hill Pkwy<br> East Rutherford<br> NJ 07073</p>
	                    	<p>info@creativity.com<br> (42) 455 235 634</p>
	                    	<div class="address-box-social">
		                		<a class="button-social-1 button-facebook-1" href="#"></a>
		                		<a class="button-social-1 button-google-plus-1" href="#"></a>
		                		<a class="button-social-1 button-twitter-1" href="#"></a>
		                		<a class="button-social-1 button-pinterest-1" href="#"></a>
		                	</div>
						</div>
	                </div>
	            </div>
	        </div>
        </div>

		<!-- Contact us -->
        <div class="contact-us-container">
	        <div class="container">
	            <div class="row">
	                <div class="col-sm-12 contact-us">
	                    <h2>Contact us</h2>
	                    <p>Voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae.</p>
	                </div>
	            </div>
	            <div class="row">
	                <div class="col-sm-12 contact-us-form">
	                	<form action="" method="post">
	                		<div class="contact-us-form-left">
	                			<div class="contact-us-input-container">
		                			<label for="contact-us-name" class="contact-us-name-label"></label>
		                			<input type="text" id="contact-us-name" name="contact-us-name" placeholder="Name...">
	                       		</div>
	                       		<div class="contact-us-input-container">
		                			<label for="contact-us-email" class="contact-us-email-label"></label>
		                			<input type="text" id="contact-us-email" name="contact-us-email" placeholder="Email...">
	                       		</div>
	                       		<div class="contact-us-input-container">
		                			<label for="contact-us-phone" class="contact-us-phone-label"></label>
		                			<input type="text" id="contact-us-phone" name="contact-us-phone" placeholder="Phone...">
	                       		</div>
	                		</div>
	                		<div class="contact-us-form-right">
	                			<div class="contact-us-input-container">
		                			<label for="contact-us-message" class="contact-us-message-label"></label>		                			
		                			<textarea id="contact-us-message" name="contact-us-message" placeholder="Message..."></textarea>
	                       		</div>
	                			<input type="submit" value="Send message">
	                		</div>
	                	</form>
	                </div>
	            </div>
	        </div>
        </div>
    
        <!-- Footer -->
        <footer>
	        <div class="container">
	            <div class="row">
	                <div class="col-sm-12 footer">
	                	<div class="footer-left">Copyright 2014 Creativity. All rights reserved.</div>
	                	<div class="footer-right">
	                		<a class="button-social-2 button-facebook-2" href="#"><span>Facebook</span></a>
		                	<a class="button-social-2 button-google-plus-2" href="#"><span>Google+</span></a>
		                	<a class="button-social-2 button-twitter-2" href="#"><span>Twitter</span></a>
		                	<a class="button-social-2 button-pinterest-2" href="#"><span>Pinterest</span></a>
	                	</div>
	                </div>
	            </div>
	        </div>
        </footer>
        

        <!-- Javascript -->
        <script src="assets/js/jquery-1.10.2.min.js"></script>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.backstretch.min.js"></script>
        <script src="assets/js/masonry.pkgd.min.js"></script>
        <script src="http://maps.google.com/maps/api/js?sensor=true"></script>
        <script src="assets/js/jquery.ui.map.min.js"></script>
        <script src="http://a.vimeocdn.com/js/froogaloop2.min.js"></script>
        <script src="assets/js/select2.min.js"></script>
        <script src="assets/js/jquery.gray.min.js"></script>
        <script src="assets/js/jquery.magnific-popup.min.js"></script>
        <script src="assets/js/scripts.js"></script>
        <script src="assets/js/retina-1.1.0.min.js"></script>
        <script src="assets/js/loading.js"></script>
        <script src="assets/js/news.js"></script>
        
        
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
        
        

    </body>

</html>