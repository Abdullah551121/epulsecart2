		<!-- Footer Main Start -->
		<?php
		$statement = $pdo->prepare("SELECT * FROM tbl_settings WHERE id=1");
		$statement->execute();
		$result = $statement->fetchAll(PDO::FETCH_ASSOC);							
		foreach ($result as $row) 
		{
			$footer_about = $row['footer_about'];
			$footer_copyright = $row['footer_copyright'];
			$contact_address = $row['contact_address'];
			$contact_email = $row['contact_email'];
			$contact_phone = $row['contact_phone'];
			$contact_fax = $row['contact_fax'];
			$total_recent_news = $row['total_recent_news'];
		}
		?>

		<section class="footer-main">
			<div class="container">
				<div class="row">
					<div class="col-sm-6 col-md-5 col-lg-5 footer-col">
						<h3>About Us</h3>
						<?php echo $footer_about; ?>
					</div>
					<div class="col-sm-6 col-md-4 col-lg-4 footer-col">
						<h3>Recent News</h3>
						<?php
						$count = 0;
						$statement = $pdo->prepare("SELECT * FROM tbl_news WHERE status=? ORDER BY news_id DESC");
						$statement->execute(array('Published'));
						$result = $statement->fetchAll(PDO::FETCH_ASSOC);
						foreach ($result as $row)
						{
							$count++;
							if($count > 3) {break;}
							?>
							<div class="thumbnail3">
								<div class="photo-content">
									<div class="photo" style="background-image: url(<?php echo BASE_URL; ?>assets/uploads/<?php if($row['photo']=='') { echo 'no-photo1.jpg'; } else { echo $row['photo']; } ?>);"></div>
								</div>
								<div class="caption">
									<h3><a href="<?php echo BASE_URL.URL_NEWS.$row['news_slug']; ?>"><?php echo $row['news_title']; ?></a></h3>
									<h4>
										<span><i class="fa fa-user"></i> <?php echo $row['publisher']; ?> </span>
										<span><i class="fa fa-calendar"></i> 
										<?php
										$day = substr($row['news_date'],0,2);
										$month = substr($row['news_date'],3,2);
										$year = substr($row['news_date'],6,4);
										if($month=='01') {$month_detail='January';}
										if($month=='02') {$month_detail='February';}
										if($month=='03') {$month_detail='March';}
										if($month=='04') {$month_detail='April';}
										if($month=='05') {$month_detail='May';}
										if($month=='06') {$month_detail='June';}
										if($month=='07') {$month_detail='July';}
										if($month=='08') {$month_detail='August';}
										if($month=='09') {$month_detail='September';}
										if($month=='10') {$month_detail='October';}
										if($month=='11') {$month_detail='November';}
										if($month=='12') {$month_detail='December';}
										echo $month_detail.' '.$day.', '.$year;
										?>
										</span>
									</h4>
								</div>
							</div>
							<?php
						}
						?>
					</div>
					<div class="col-sm-6 col-md-3 col-lg-3 footer-col">
						<h3>Contact Us</h3>
						<div class="contact-item">
							<div class="icon"><i class="fa fa-map-marker"></i></div>
							<div class="text">
								<?php echo nl2br($contact_address); ?>
							</div>
						</div>
						<div class="contact-item">
							<div class="icon"><i class="fa fa-phone"></i></div>
							<div class="text">
								<?php echo $contact_phone; ?>
							</div>
						</div>
						<div class="contact-item">
							<div class="icon"><i class="fa fa-fax"></i></div>
							<div class="text">
								<?php echo $contact_fax; ?>
							</div>
						</div>
						<div class="contact-item">
							<div class="icon"><i class="fa fa-envelope-o"></i></div>
							<div class="text">
								<?php echo $contact_email; ?>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- Footer Main End -->

		
		<!-- Footer Bottom Start -->
		<div class="footer-bottom">
			<div class="container">
				<div class="row">
					<div class="col-md-12 copyright">
						<?php echo $footer_copyright; ?>
					</div>
				</div>
			</div>
		</div>
		<!-- Footer Bottom End -->

		<!-- Scroll to top -->
		<a href="#" class="scrollup">
			<i class="fa fa-angle-up"></i>
		</a>

		<?php
			// Load More button working
			// Finding out the total number of load more buttons to show in a page
			$cur_page = substr($_SERVER["SCRIPT_NAME"],strrpos($_SERVER["SCRIPT_NAME"],"/")+1);
			if(($cur_page == 'category.php')||($cur_page == 'search.php'))
			{
				if($i>6)
				{
					$rest = $i-6;
					if($rest%2==0)
					{
						$final = $rest/2;
					}
					else
					{
						$rest = $rest+1;
						$final = $rest/2;
					}
				}
				else
				{
					$final = 0;
				}
			}	
		?>
	</div>

	<!-- Scripts -->
	<script src="<?php echo BASE_URL; ?>assets/js/jquery-2.2.4.min.js"></script>
	<script src="<?php echo BASE_URL; ?>assets/js/bootstrap.min.js"></script>
	<script src="<?php echo BASE_URL; ?>assets/js/bootstrap-datepicker.min.js"></script>
	<script src="<?php echo BASE_URL; ?>assets/js/hoverIntent.js"></script>
	<script src="<?php echo BASE_URL; ?>assets/js/superfish.js"></script>
	<script src="<?php echo BASE_URL; ?>assets/js/jquery.slicknav.js"></script>
	<script src="<?php echo BASE_URL; ?>assets/js/jquery.magnific-popup.min.js"></script>	
	<script src="<?php echo BASE_URL; ?>assets/js/waypoints.min.js"></script>
	<script src="<?php echo BASE_URL; ?>assets/js/modernizr.min.js"></script>
	<script src="<?php echo BASE_URL; ?>assets/js/custom.js"></script>
	<?php if(($cur_page == 'category.php')||($cur_page == 'search.php')): ?>
	<script>
		// Load More jquery checking for category and search page
		jQuery(document).ready(function() {
	        if(!count) {
				var count = 0;
			}
		    $(".load").on( 'click', function(e) {
				$(".child:hidden").slice(0, 2).slideDown();
				var dmCnt = $(".child").length;
				count++;
				if (count == <?php echo $final; ?>) {
					$('.load-more').hide();
				}
		    });
			$(".child").slice(0, 6).slideDown();
	    });
	</script>
	<?php endif; ?>
</body>
</html>