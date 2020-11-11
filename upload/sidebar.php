<!-- Sidebar Start -->
<?php
//Getting the top advertisement photo and url from database
$statement = $pdo->prepare("SELECT * FROM tbl_advertisement WHERE adv_id=2");
$statement->execute();
$result = $statement->fetchAll(PDO::FETCH_ASSOC);							
foreach ($result as $row) 
{
	$adv_photo = $row['adv_photo'];
	$adv_url = $row['adv_url'];
	$adv_status = $row['adv_status'];
}
?>
<?php if($adv_status == 'Show'): ?>
<div class="row">
	<div class="col-md-12">
		<div class="ad2">
			<?php if($adv_url == ''): ?>
				<img src="<?php echo BASE_URL; ?>assets/uploads/<?php echo $adv_photo; ?>">
			<?php else: ?>
				<a href="<?php echo $adv_url; ?>"><img src="<?php echo BASE_URL; ?>assets/uploads/<?php echo $adv_photo; ?>"></a>
			<?php endif; ?>
		</div>
	</div>
</div>
<?php endif; ?>

<div class="row">
	<div class="col-md-12">
		<div class="heading">
			<h2 class="sidebar-heading">Search</h2>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-md-12">
		<div class="search-sidebar">
			<form action="<?php echo BASE_URL.URL_SEARCH; ?>" method="post">
				<input type="text" name="search_string">
				<input type="submit" value="Search">
			</form>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-md-12">
		<div class="heading">
			<h2 class="sidebar-heading">Social Media</h2>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-md-12">
		<div class="social-sidebar">
			<ul>
				<?php
				// Getting all social media urls from database and showing it in the sidebar
				$statement = $pdo->prepare("SELECT * FROM tbl_social");
				$statement->execute();
				$result = $statement->fetchAll(PDO::FETCH_ASSOC);							
				foreach ($result as $row) 
				{
					if($row['social_url']!='')
					{
						echo '<li><a href="'.$row['social_url'].'"><i class="'.$row['social_icon'].'"></i></a></li>';
					}
				}
				?>
			</ul>
		</div>
	</div>
</div>
<?php
// Getting the total number recent news and popular news from database to show in sidebar section
$statement = $pdo->prepare("SELECT * FROM tbl_settings WHERE id=1");
$statement->execute();
$result = $statement->fetchAll(PDO::FETCH_ASSOC);							
foreach ($result as $row) 
{
	$total_recent_news = $row['total_recent_news'];
	$total_popular_news = $row['total_popular_news'];
}
?>
<div class="row">
	<div class="col-md-12">
		<div class="heading">
			<h2 class="sidebar-heading">Recent News</h2>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-sm-12 col-md-12">
		
		<?php
		// Showing all the recent news in descending order getting from database
		$count = 0;
		$statement = $pdo->prepare("SELECT * FROM tbl_news WHERE status=? ORDER BY news_id DESC");
		$statement->execute(array('Published'));
		$result = $statement->fetchAll(PDO::FETCH_ASSOC);
		foreach ($result as $row)
		{
			$count++;
			if($count > $total_recent_news) {break;}
			?>
			<div class="thumbnail1">
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
</div>
<div class="row">
	<div class="col-md-12">
		<div class="heading">
			<h2 class="sidebar-heading">Popular News</h2>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-sm-12 col-md-12">
		<?php
		// Showing all the popular news in descending order getting from database according to the total view
		$count = 0;
		$statement = $pdo->prepare("SELECT * FROM tbl_news WHERE status=? ORDER BY total_view DESC");
		$statement->execute(array('Published'));
		$result = $statement->fetchAll(PDO::FETCH_ASSOC);
		foreach ($result as $row)
		{
			$count++;
			if($count > $total_popular_news) {break;}
			?>
			<div class="thumbnail1">
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
</div>
<div class="row">
	<div class="col-md-12">
		<div class="newsletter-sidebar">
			<h2>Subscribe to Newsletter</h2>
			<p>In order to get the updates about the website, please subscribe to our newsletter.</p>
			<?php
			if(isset($_POST['form_subscribe']))
			{

				if(empty($_POST['email_subscribe'])) 
			    {
			        $valid = 0;
			        $error_message .= 'Email address can not be empty';
			    }
			    else
			    {
			    	if (filter_var($_POST['email_subscribe'], FILTER_VALIDATE_EMAIL) === false)
				    {
				        $valid = 0;
				        $error_message .= 'Email address must be valid';
				    }
				    else
				    {
				    	$statement = $pdo->prepare("SELECT * FROM tbl_subscriber WHERE subs_email=?");
				    	$statement->execute(array($_POST['email_subscribe']));
				    	$total = $statement->rowCount();							
				    	if($total)
				    	{
				    		$valid = 0;
				        	$error_message .= 'Email address already exists';
				    	}
				    	else
				    	{
				    		// Sending email to the requested subscriber for email confirmation
				    		// Getting activation key to send via email. also it will be saved to database until user click on the activation link.
				    		$key = md5(uniqid(rand(), true));

				    		// Getting current date
				    		$current_date = date('Y-m-d');

				    		// Getting current date and time
				    		$current_date_time = date('Y-m-d H:i:s');

				    		// Inserting data into the database
				    		$statement = $pdo->prepare("INSERT INTO tbl_subscriber (subs_email,subs_date,subs_date_time,subs_hash,subs_active) VALUES (?,?,?,?,?)");
				    		$statement->execute(array($_POST['email_subscribe'],$current_date,$current_date_time,$key,0));

				    		// Sending Confirmation Email
				    		$to = $_POST['email_subscribe'];
							$subject = 'Subscriber Email Confirmation';
							
							// Getting the url of the verification link
							$verification_url = BASE_URL.'verify.php?email='.$to.'&key='.$key;

							$message = '
Thanks for your interest to subscribe our newsletter!<br><br>
Please click this link to confirm your subscription:
					'.$verification_url.'<br><br>
This link will be active only for 24 hours.
					';

							$headers = 'From: ' . $contact_email . "\r\n" .
								   'Reply-To: ' . $contact_email . "\r\n" .
								   'X-Mailer: PHP/' . phpversion() . "\r\n" . 
								   "MIME-Version: 1.0\r\n" . 
								   "Content-Type: text/html; charset=ISO-8859-1\r\n";

							// Sending the email
							mail($to, $subject, $message, $headers);

							$success_message .= '<span style="color:#fff;">Please check your email and confirm your subscription.</span>
							';
				    	}
				    }
			    }
			}
			if($error_message != '') {
				echo "<script>alert('".$error_message."')</script>";
			}
			if($success_message != '') {
				echo "<script>alert('".$success_message."')</script>";
			}
			?>
			<div id="subscribeForm"></div>
			<?php
			$cur_page = substr($_SERVER["SCRIPT_NAME"],strrpos($_SERVER["SCRIPT_NAME"],"/")+1);
			?>
			<form action="<?php echo BASE_URL.$cur_page; ?>#subscribeForm" method="post">
				
				<div><input type="email" name="email_subscribe"></div>
				<div><input type="submit" value="Subscribe" name="form_subscribe"></div>
			</form>
		</div>
	</div>
</div>
<?php
//Getting the bottom advertisement photo and url from database
$statement = $pdo->prepare("SELECT * FROM tbl_advertisement WHERE adv_id=3");
$statement->execute();
$result = $statement->fetchAll(PDO::FETCH_ASSOC);							
foreach ($result as $row) 
{
	$adv_photo = $row['adv_photo'];
	$adv_url = $row['adv_url'];
	$adv_status = $row['adv_status'];
}
?>
<?php if($adv_status == 'Show'): ?>
<div class="row">
	<div class="col-md-12">
		<div class="ad2">
			<?php if($adv_url == ''): ?>
				<img src="<?php echo BASE_URL; ?>assets/uploads/<?php echo $adv_photo; ?>">
			<?php else: ?>
				<a href="<?php echo $adv_url; ?>"><img src="<?php echo BASE_URL; ?>assets/uploads/<?php echo $adv_photo; ?>"></a>
			<?php endif; ?>
		</div>
	</div>
</div>
<?php endif; ?>
<!-- Sidebar End -->