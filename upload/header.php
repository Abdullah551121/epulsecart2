<?php
ob_start();
session_start();
include("admin/config.php");
include("includes/functions.php");
$error_message = '';
$success_message = '';
$statement = $pdo->prepare("SELECT * FROM tbl_settings WHERE id=?");
$statement->execute(array(1));
$result = $statement->fetchAll(PDO::FETCH_ASSOC);							
foreach ($result as $row) {
	$mod_rewrite = $row['mod_rewrite'];
}
if($mod_rewrite == 'Off') {
	define("URL_CATEGORY", "category.php?slug=");
	define("URL_PAGE", "page.php?slug=");
	define("URL_NEWS", "news.php?slug=");
	define("URL_SEARCH", "search.php");
} else {
	define("URL_CATEGORY", "category/");
	define("URL_PAGE", "page/");
	define("URL_NEWS", "news/");
	define("URL_SEARCH", "search");
}
?>
<?php
// Delete all subscribers who did not confirm email within 1 day / 24 hours
$statement = $pdo->prepare("SELECT * FROM tbl_subscriber WHERE subs_active=0");
$statement->execute();
$result = $statement->fetchAll(PDO::FETCH_ASSOC);							
foreach($result as $row)
{
	$subs_date_time = $row['subs_date_time'];
	$current_date_time = date('Y-m-d H:i:s');
	$t1 = strtotime($subs_date_time);
	$t2 = strtotime($current_date_time);
	$diff = $t2 - $t1;
	$res = floor($diff/(60));
	if($res > 1440)
	{
		$statement1 = $pdo->prepare("DELETE FROM tbl_subscriber WHERE subs_id=?");
		$statement1->execute(array($row['subs_id']));
	}
}
// Getting the basic data for the website from database
$statement = $pdo->prepare("SELECT * FROM tbl_settings WHERE id=1");
$statement->execute();
$result = $statement->fetchAll(PDO::FETCH_ASSOC);
foreach ($result as $row)
{
	$logo = $row['logo'];
	$favicon = $row['favicon'];
	$contact_email = $row['contact_email'];
	$contact_phone = $row['contact_phone'];
}
?>
<!DOCTYPE html>
<html dir="ltr" lang="en">
<head>

	<!-- Meta Tags -->
	<meta name="viewport" content="width=device-width,initial-scale=1.0">
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">

	<!-- Showing the SEO related meta tags data -->
	<?php
	
	// Getting the current page URL
	$cur_page = substr($_SERVER["SCRIPT_NAME"],strrpos($_SERVER["SCRIPT_NAME"],"/")+1);

	if($cur_page == 'news.php')
	{
		$statement = $pdo->prepare("SELECT * FROM tbl_news WHERE news_slug=?");
		$statement->execute(array($_REQUEST['slug']));
		$result = $statement->fetchAll(PDO::FETCH_ASSOC);							
		foreach ($result as $row) 
		{
		    $og_photo = $row['photo'];
			echo '<meta name="description" content="'.$row['meta_description'].'">';
			echo '<meta name="keywords" content="'.$row['meta_keyword'].'">';
			echo '<title>'.$row['meta_title'].'</title>';
		}
	}

	if($cur_page == 'page.php')
	{
		$statement = $pdo->prepare("SELECT * FROM tbl_page WHERE page_slug=?");
		$statement->execute(array($_REQUEST['slug']));
		$result = $statement->fetchAll(PDO::FETCH_ASSOC);							
		foreach ($result as $row) 
		{
			echo '<meta name="description" content="'.$row['meta_description'].'">';
			echo '<meta name="keywords" content="'.$row['meta_keyword'].'">';
			echo '<title>'.$row['meta_title'].'</title>';
		}
	}

	if($cur_page == 'category.php')
	{
		$statement = $pdo->prepare("SELECT * FROM tbl_category WHERE category_slug=?");
		$statement->execute(array($_REQUEST['slug']));
		$result = $statement->fetchAll(PDO::FETCH_ASSOC);							
		foreach ($result as $row)
		{
			echo '<meta name="description" content="'.$row['meta_description'].'">';
			echo '<meta name="keywords" content="'.$row['meta_keyword'].'">';
			echo '<title>'.$row['meta_title'].'</title>';
		}
	}

	if($cur_page == 'index.php')
	{
		$statement = $pdo->prepare("SELECT * FROM tbl_settings WHERE id=1");
		$statement->execute();
		$result = $statement->fetchAll(PDO::FETCH_ASSOC);							
		foreach ($result as $row) 
		{
			echo '<meta name="description" content="'.$row['meta_description_home'].'">';
			echo '<meta name="keywords" content="'.$row['meta_keyword_home'].'">';
			echo '<title>'.$row['meta_title_home'].'</title>';
		}
	}
	?>
	
	<!-- Favicon -->
	<link rel="icon" type="image/png" href="<?php echo BASE_URL; ?>assets/uploads/<?php echo $favicon; ?>">
	
	<!-- Stylesheets -->
	<link rel="stylesheet" href="<?php echo BASE_URL; ?>assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="<?php echo BASE_URL; ?>assets/css/bootstrap-datepicker.min.css">
	<link rel="stylesheet" href="<?php echo BASE_URL; ?>assets/css/superfish.css">
	<link rel="stylesheet" href="<?php echo BASE_URL; ?>assets/css/slicknav.css">
	<link rel="stylesheet" href="<?php echo BASE_URL; ?>assets/css/magnific-popup.css">
	<link rel="stylesheet" href="<?php echo BASE_URL; ?>assets/css/style.css">
	<link rel="stylesheet" href="<?php echo BASE_URL; ?>assets/css/responsive.css">
	
	<meta property="og:image" content="<?php echo BASE_URL; ?>assets/uploads/<?php echo $og_photo; ?>">

	<script type="text/javascript" src="//platform-api.sharethis.com/js/sharethis.js#property=5993ef01e2587a001253a261&product=inline-share-buttons"></script>

</head>
<body>
<?php
// Getting Facebook comment code from the database
$statement = $pdo->prepare("SELECT * FROM tbl_comment WHERE id=1");
$statement->execute();
$result = $statement->fetchAll(PDO::FETCH_ASSOC);							
foreach ($result as $row) 
{
	$code_body = $row['code_body'];
	echo $code_body;
}
?>
	<div id="preloader">
		<div id="status"></div>
	</div>
	
	<div class="page-wrapper">

		<!-- Top Bar Start -->
		<div class="top-bar">
			<div class="container">
				<div class="row">
					<div class="col-md-6 top-contact">
						<div class="list">
							<i class="fa fa-envelope"></i> <a href="mailto:<?php echo $contact_email; ?>"><?php echo $contact_email; ?></a>
						</div>
						<div class="list">
							<i class="fa fa-phone"></i> <?php echo $contact_phone; ?>
						</div>
					</div>
					<div class="col-md-6 top-social">
						<ul>
							<?php
							// Getting and showing all the social media icon URL from the database
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
		</div>
		<!-- Top Bar End -->
		

		<!-- Header Start -->
		<header>
			<div class="container">
				<div class="row">
					<div class="col-md-3 col-sm-3 logo">
						<a href="<?php echo BASE_URL; ?>"><img src="<?php echo BASE_URL; ?>assets/uploads/<?php echo $logo; ?>" alt=""></a>
					</div>
					<div class="col-md-9 col-sm-9 nav-wrapper">
						<!-- Nav Start -->
						<nav>
							<ul class="sf-menu" id="menu">
								<?php
								// Showing the menu dynamically from the database
								$statement = $pdo->prepare("SELECT * FROM tbl_menu ORDER BY menu_order ASC");
								$statement->execute();
								$result = $statement->fetchAll(PDO::FETCH_ASSOC);							
								foreach ($result as $row) 
								{
									echo '<li>';
									if($row['menu_parent']==0)
									{
										if($row['menu_type']=='Category')
										{
											echo '<a href="'.BASE_URL.URL_CATEGORY.$row['category_or_page_slug'].'">';
										}
										if($row['menu_type']=='Page')
										{
											echo '<a href="'.BASE_URL.URL_PAGE.$row['category_or_page_slug'].'">';
										}
										if($row['menu_type']=='Other')
										{
											echo '<a href="'.$row['menu_url'].'">';
										}										
										echo $row['menu_name'];
										echo '</a>';
									}

									$statement1 = $pdo->prepare("SELECT * FROM tbl_menu WHERE menu_parent=?");
									$statement1->execute(array($row['menu_id']));
									$total = $statement1->rowCount();
									if($total)
									{
										echo '<ul>';
										$result1 = $statement1->fetchAll(PDO::FETCH_ASSOC);							
										foreach ($result1 as $row1) 
										{
											echo '<li>';
											if($row1['menu_type']=='Category')
											{
												echo '<a href="'.BASE_URL.URL_CATEGORY.$row1['category_or_page_slug'].'">';
											}
											if($row1['menu_type']=='Page')
											{
												echo '<a href="'.BASE_URL.URL_PAGE.$row1['category_or_page_slug'].'">';
											}
											if($row1['menu_type']=='Other')
											{
												echo '<a href="'.$row1['menu_url'].'">';
											}											
											echo $row1['menu_name'];
											echo '</a>';
											echo '</li>';
										}
										echo '</ul>';
									}
									echo '</li>';
								}
								?>
							</ul>
						</nav>
						<!-- Nav End -->
					</div>
				</div>
			</div>
		</header>
		<!-- Header End -->